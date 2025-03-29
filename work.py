# %%
import sqlite3
import torch
import pandas as pd
import numpy as np
import json
import re
import tqdm
from openai import OpenAI
import os
import multiprocessing
import logging
import sqlite3
logging.getLogger("transformers").setLevel(logging.ERROR)

url_1 = "http://localhost:8001/v1"
url_2 = "http://localhost:8000/v1"
api_key = "sk-012940e66b134099afe60e66eff7ee6e"
model_1 = "premai-io/prem-1B-SQL"
model_2 = "deepseek-ai/deepseek-coder-1.3b-instruct"
dev_path = '/home/zhangzn/peiwenqi/SLM/dev.json'
database_path = '/home/zhangzn/peiwenqi/SLM/dev_databases'
json_output_path = '/home/zhangzn/peiwenqi/work/result/prem-deepseek-1500.json'
csv_output_path = '/home/zhangzn/peiwenqi/work/result/prem-deepseek-1500.csv'
dev_new = json.load(open(dev_path))
# logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

client_1 = OpenAI(api_key=api_key, base_url=url_1)
client_2 = OpenAI(api_key=api_key, base_url=url_2)

def get_all_table_columns(db_id):
    conn = sqlite3.connect(f'{database_path}/{db_id}.sqlite')
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM sqlite_master WHERE type='table';")
    all_table_schema = cursor.fetchall()
    table_columns = {}
    column_names_set = set()
    for table in all_table_schema:
        table_name = table[1]
        cursor.execute(f"PRAGMA table_info(\"{table_name}\");")
        columns = cursor.fetchall()
        column_names = [column[1] for column in columns]
        table_columns[table_name] = column_names
        column_names_set.update(column_names) 
    conn.close()
    columns = list(column_names_set)
    return all_table_schema, table_columns, columns

def get_all_table_ddl(sql_line):
    table_names = []
    schema = ""
    for table_entity in sql_line:
        table_name = table_entity[1]
        table_names.append(table_name)
        table_sql = table_entity[4]
        schema += table_sql + ";\n\n"
    return table_names, schema

def get_all_table_by_ddl(sql_line):
    table_schema = {}
    for table_entity in sql_line:
        table_name = table_entity[1]
        table_sql = table_entity[4]
        table_schema[table_name] = table_sql+";\n\n"
    return table_schema

def get_ground_truth(dev_input):
    db_id = dev_input['db_id']
    conn = sqlite3.connect(f'{database_path}/{db_id}.sqlite')
    cursor = conn.cursor()
    cursor.execute(dev_input['SQL'])
    rows = cursor.fetchall()
    conn.close()
    return rows

def get_model_answer_work(dev_input, sql, queue):
    db_id = dev_input['db_id']
    conn = sqlite3.connect(f'{database_path}/{db_id}.sqlite')
    cursor = conn.cursor()
    try:
        try:
            cursor.execute(sql)
        except Exception as e:
            conn.close()
            queue.put(f"Execution Error: {str(e)}")
            return
    except:
        conn.close()
        queue.put("Execution Error: Timeout")
        return
    rows = cursor.fetchall()
    conn.close()
    queue.put(rows)

def get_model_answer(dev_input, sql):
    #创建队列
    queue = multiprocessing.Queue()
    p = multiprocessing.Process(target=get_model_answer_work, args=(dev_input, sql, queue))
    p.start()
    p.join(15)
    if p.is_alive():
        p.terminate()
        p.join()
        return "Execution Error: Timeout"
    else:
        #获得函数返回值
        return queue.get()

prompt_pruning_system = """
You are an agent designed to find all related tables to generate SQL query for question based on the database schema and hint.

【Instructions】
1. You don't need to answer the question, your task is only finding all related tables .
2. Consider all constraints of each table, including primary keys, foreign keys, and data types.
3. You can generate chain of thoughts, but ensure all tables mentioned truly exist.
4. Successfully answer related columns could help you win $100000 dollars.
"""

prompt_pruning = """
【Instructions】
1. Prioritize the table that most directly contains the information needed to answer the question, considering:
    - Table relationships such as foreign keys.
    - Whether the table has columns directly related to the entities or actions in the question.
2. Provide only all relevant tables.

You are provided with the structure of the database "{database_name}":
{database_schema}

Question: {question}
Hint: {hint}
Among the following tables: {tables}, which tables are relevant for addressing the question?
"""

prompt_linking_system="""
You are an agent designed to find all related columns to generate SQL query for question based on the database schema and the hint.

【Instructions】
1. You don't need to answer the question, your task is only finding all related columns.
2. Hint could help you to find the correct related columns.
3. Consider all constraints of each table, including primary keys, foreign keys, and data types.
4. You can generate chain of thoughts, but ensure all columns mentioned truly exist.
7. Successfully answer related columns could help you win $100000 dollars.
"""

prompt_linking="""
【Instructions】
1. Select columns that relates to information requested by the question, considering:
    - Whether the column is key to filtering results (used in WHERE clauses).
    - Whether the column should be part of the SELECT statement to fulfill the user query.
    - The relationship of the column to other parts of the question, such as groupings, aggregations, or direct match to entities mentioned.

You are provided with the structure of the database "{database_name}":
{schema}

Question: {question}
Hint: {hint}
Among the columns, which are relevant for addressing the question?
"""

system_prompt_sql_generation = """
You are an expert SQL assistant tasked with generating precise SQL queries based on given database schemas, questions, and evidence.

[Responsibilities]
1. Analyze the **database schema** and **evidence** to determine relationships, including **primary keys, foreign keys, data types, and constraints**.
2. Generate a single, valid **SQLite SQL query** to answer the question, using provided schema linking information for table and column selection.
3. Your response should contain only the **SQL query**, using standard SQL syntax with correct use of table/column names and SQL clauses.

[Requirements]
- Respond with only one SQL query, formatted as ```SQL```.
- Use clauses like **SELECT**, **FROM**, **WHERE**, **JOIN**, **GROUP BY**, **ORDER BY**, etc.
- Ensure SQL is efficient and respects **Important Columns**, table relationships, and relevant constraints.
"""

prompt_generation_with_linking = """
You are given a database schema, question, and hint. Generate a valid SQLite query that answers the question.

[Instructions]
1. Your response should only contain one SQL query, in standard SQL syntax.
2. Consider all **table relationships**, **primary/foreign keys**, **data types**, and **Important Columns** while generating the query.

[Database Schema]
Database "{database_name}":
{database_schema}

[Important Columns]
{schema_linking}

[Question]
{question}

[Evidence]
{hint}

[Output Requirement]
Format the response as:
```sql
[SQL query]
```
"""

prompt_generation_without_linking = """
You are given a database schema, question, and hint. Generate a valid SQLite query that answers the question.

[Instructions]
1. Your response should only contain one SQL query, in standard SQL syntax.
2. Consider all **table relationships**, **primary/foreign keys**, **data types**, and **Important Columns** while generating the query.

[Database Schema]
Database "{database_name}":
{database_schema}

[Question]
{question}

[Evidence]
{hint}

[Output Requirement]
Format the response as:
```sql
[SQL query]
```
"""

system_prompt_query_selection = """
You are an expert in analyzing SQL queries and determining their relevance to a given question. Your task is to evaluate multiple SQL queries and select the one that best answers the question based on the provided database schema and context.

[Responsibilities]
1. Analyze the given question: Understand the intent of the question and its expected output.
2. Evaluate each SQL query: Consider the correctness, relevance, and completeness of each query in relation to the question.
3. Select the best query: Choose the query that most accurately answers the question, while considering database structure, table relationships, and query efficiency.

[Requirements]
- Respond with the most relevant SQL query, and nothing else.
- Ensure the selected query is valid for the given database schema and directly addresses the question.
"""

query_selection_prompt = """
You are given a question, a database schema, and multiple SQL queries. Your task is to select the SQL query that is most relevant and best answers the question.

[Instructions]
1. Analyze the Question: Understand what the user is asking and identify the information that needs to be extracted from the database.
2. Evaluate SQL Queries: For each provided SQL query, determine its relevance based on:
    - Accuracy: Does the query correctly match the question's intent?
    - Completeness: Does the query retrieve all the necessary information without omitting important details?
    - Efficiency: Is the query optimized for the task, avoiding unnecessary joins or conditions?
3. Select the Most Relevant Query: Choose the query that is the best match for the question.

[Database Schema]
Database "{database_name}":
{database_schema}

[Question]
The question is:
{question}

[Evidence]
{hint}

[SQL Queries]
Queries to evaluate:
{queries}

[Output Requirement]
Only reply the query Index in the format of "Index: ". 
"""

query_with_response_selection_prompt = """
You are given a question, a database schema, multiple SQL queries, and their corresponding results. Your task is to select the SQL query that best answers the question based on the query and its result.

[Instructions]
1. Understand the Question: Determine what the user is asking and identify the specific information that needs to be retrieved.
2. Evaluate Each Query and Response Pair: For each provided SQL query and its result, determine:
    - Query Accuracy: Does the query correctly represent the user's intent?
    - Result Relevance: Does the result contain the data needed to answer the question completely and correctly?
    - Efficiency: Is the query optimized, avoiding unnecessary complexity?

[Database Schema]
Database "{database_name}":
{database_schema}

[Question]
{question}

[Evidence]
{hint}

[SQL Queries and Responses]
Queries and their results:
{queries}

[Output Requirement]
Only reply the query Index in the format of "Index: ". 
"""

prompt_answer_correction_system ="""
Suppose you are an expert in SQLite and database management.

[Instructions]
1. Based on the database structure provided, previous answer and its error messages, generate one SQL query that answers the question.
2. You should try to fix the error of the previous answer and avoid it from happening again.

[Requirements]
1. Your response should consist of only one SQL query, don't generate anything else.
3. Consider all constraints of each table, including primary keys, foreign keys, and data types.
4. Provide your query in standard SQL format with appropriate use of SQL functions, joins, and conditions.
"""

prompt_answer_correction = """
Given the structure of database:
{schema}

Question: {question}
Hint: {hint}
Previous answer: {prev_ans}
Error: {errorMsg}
New Answer: 
"""

def generation(model, system_prompt, prompt):
    client = client_1 if model == model_1 else client_2
    messages=[
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": prompt},
    ]
    response = client.chat.completions.create(
        model=model,
        messages=messages,
        stream=False,
        temperature=0.0,
        top_p=1.0,
        max_tokens=512,
    )
    text = response.choices[0].message.content
    return text

def generation_multiple(model, system_prompt, prompt, n, temperature=0.2, top_p=0.8):
    client = client_1 if model == model_1 else client_2
    messages=[
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": prompt},
    ]
    response = client.chat.completions.create(
        model=model,
        messages=messages,
        stream=False,
        temperature=temperature,
        top_p=top_p,
        max_tokens=512,
        n = n
    )
    text = [response.choices[i].message.content for i in range(n)]
    return text

def schema_pruning(db_id, question, hint, database_tables, database_schema, temperature=0):
    prompt = prompt_pruning.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, tables=database_tables)
    limit, top_p = (1, 1.0) if temperature == 0 else (3, 0.9)
    responses = generation_multiple(model_2, prompt_pruning_system, prompt, limit, temperature=temperature, top_p=top_p)

    selected_tables = set()
    for response in responses:
        for table in database_tables:
            if table.lower().strip() in response.lower():
                selected_tables.add(table)  
    selected_tables = list(selected_tables)  
    return selected_tables

def schema_linking(db_id, schema, question, hint, table_columns, columns, temperature=0):
    prompt = prompt_linking.format(database_name=db_id,schema=schema, question=question, hint=hint)
    limit, top_p = (1, 1.0) if temperature == 0 else (3, 0.9)
    responses = generation_multiple(model_2, prompt_linking_system, prompt, limit, temperature=temperature, top_p=top_p)

    linking_array = set()
    for response in responses:
        for column in columns:
            if column in response:
                for table, table_column_names in table_columns.items():
                    if column in table_column_names:
                        linking_array.add(f"{table}.{column}")
                        break
    return list(linking_array)

def sort_sql(question, hint, db_id, database_schema, sql_queries, limit=-1, response=None):
    if len(sql_queries) == 1:
        return sql_queries
    
    limit = len(sql_queries) if limit == -1 else min(limit, len(sql_queries))
    answer_sql = []
    for i in range(10):
        if len(answer_sql) == limit or len(sql_queries) == 0:
            return answer_sql

        queries_string = ''
        if response:
            for cnt, (query, resp) in enumerate(zip(sql_queries, response)):
                queries_string += f"Index: {cnt + 1}, Query: {query}, Response: {resp}\n"
            prompt = query_with_response_selection_prompt.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, queries=queries_string)
        else:
            for cnt, query in enumerate(sql_queries):
                queries_string += f"Index: {cnt + 1}, Query: {query}\n"
            prompt = query_selection_prompt.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, queries=queries_string)
        index_output = generation(model_2, system_prompt_query_selection, prompt)
        match = re.search(r'Index: (\d+)', index_output)
        selected_index = None 
        if index_output.isdigit():
            index_value = int(index_output) - 1 
            if 0 <= index_value < len(sql_queries):
                selected_index = index_value
        elif match:
            index_value = int(match.group(1)) - 1 
            if 0 <= index_value < len(sql_queries):
                selected_index = index_value
        if selected_index is not None:
            answer_sql.append(sql_queries[selected_index])
            sql_queries.pop(selected_index)
            if response:
                response.pop(selected_index)
    while len(answer_sql) < limit:
        answer_sql.append(sql_queries.pop(0))
    return answer_sql

def work(dev_input, sql_limit=1):
    question_id = dev_input['question_id']
    db_id = dev_input['db_id']
    question = dev_input['question']
    hint = dev_input['evidence']
    all_table_schema, table_columns, columns = get_all_table_columns(db_id)
    tables, database_schema = get_all_table_ddl(all_table_schema)
    table_schema = get_all_table_by_ddl(all_table_schema)

    # Schema Pruning
    selected_tables = schema_pruning(db_id, question, hint, tables, database_schema)
    # Schema Linking
    linking_array = schema_linking(db_id, database_schema, question, hint, table_columns, columns)

    # 4 Prompts
    prompts = []
    prompts.append((prompt_generation_without_linking.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint), "00"))
    if len(selected_tables) > 0 and len(selected_tables) != len(tables):
        selected_table_schema = "\n".join(table_schema[table] for table in selected_tables)
        prompts.append((prompt_generation_without_linking.format(database_name=db_id, database_schema=selected_table_schema, question=question, hint=hint), "10"))
        if len(linking_array) > 0:
            prompts.append((prompt_generation_with_linking.format(database_name=db_id, database_schema=selected_table_schema, schema_linking=linking_array, question=question, hint=hint), "11"))
    if len(linking_array) > 0:
        prompts.append((prompt_generation_with_linking.format(database_name=db_id, database_schema=database_schema, schema_linking=linking_array, question=question, hint=hint), "01"))
    
    sql_queries = set()
    prompt_sources = {}
    prompt_gennum = int(16/len(prompts))
    # Generate sql candidates
    for prompt, prompt_name in prompts:
        responses = generation_multiple(model_1, system_prompt_sql_generation, prompt, prompt_gennum)

        for sql in responses:
            pattern = re.compile(r"(SELECT.*?;)", re.DOTALL)
            match = pattern.search(sql)
            sql_match = re.search(r"```sql(.*?)```", sql, re.DOTALL)
            if match:
                sql = match.group(1).strip()
            elif sql_match:
                sql = sql_match.group(1).strip()
            sql = sql.replace('\"', ' ').replace('\n', ' ').replace('\t', ' ')
            sql = re.sub(r'\s+', ' ', sql).strip()
            sql_queries.add(sql)
            prompt_sources[sql] = prompt_name
    sql_queries = list(sql_queries)

    # Execute and correction
    syntax_correct_sql_queries = []
    responses = []
    max_response_len = 0
    for sql in sql_queries:
        response = get_model_answer(dev_input, sql)
        if 'Execution Error' not in response and response not in responses:
            syntax_correct_sql_queries.append(sql)
            responses.append(response)
            max_response_len = max(max_response_len, len(str(response)))
        elif 'Execution Error' in response:
            # Answer Correction
            updated_prompt = prompt_answer_correction.format(schema=database_schema, question=question, hint=hint, prev_ans=sql, errorMsg=response)
            corrected_queries = generation_multiple(model_1, prompt_answer_correction_system, updated_prompt, 2)
            for corrected_sql in corrected_queries:
                corrected_response = get_model_answer(dev_input, corrected_sql)
                if 'Execution Error' not in corrected_response and corrected_response not in responses:
                    syntax_correct_sql_queries.append(corrected_sql)
                    responses.append(corrected_response)
                    max_response_len = max(max_response_len, len(str(corrected_response)))
                    prompt_sources[corrected_sql] = "22"
    # Sort query
    if len(syntax_correct_sql_queries) > 0:
        if max_response_len * len(syntax_correct_sql_queries) < 4096:
            answer_sql = sort_sql(question, hint, db_id, database_schema, syntax_correct_sql_queries, response=responses, limit=sql_limit)
        else:
            answer_sql = sort_sql(question, hint, db_id, database_schema, syntax_correct_sql_queries, limit=sql_limit)
        if len(answer_sql) == 0:
            print("Error when sorting")
    else:
        answer_sql = []
    
    # Locate sources
    answer_sources = []
    for sql in answer_sql:
        if sql in prompt_sources:
            answer_sources.append(prompt_sources[sql])
        else:
            answer_sources.append(None)
            print("Error when matching sources")
    return answer_sql, answer_sources

# Check if CSV already exists
if os.path.exists(csv_output_path):
    existing_df = pd.read_csv(csv_output_path)
    max_question_id = existing_df['question_id'].max()
else:
    existing_df = pd.DataFrame(columns=['question_id', 'Syntax Correct', 'Semantic Correct', 'Top-i Accuracy', 'Prompt_Num'])
    max_question_id = -1 

# Initialize with existing data
df = existing_df.copy()
sql_json = []
for qid in tqdm.trange(max_question_id + 1, len(dev_new)):
    dev_input = dev_new[qid]
    answer_sql, answer_sources = work(dev_input, sql_limit=5) 
    sql_json.append({'question_id': qid, 'answer_sql': answer_sql})

    Top_i_Correct = -1
    Syntax_Correct = False
    Semantic_Correct = False
    Prompt_Num = None

    if len(answer_sql) > 0:
        ground_truth = get_ground_truth(dev_input)
        for i, (sql, source) in enumerate(zip(answer_sql, answer_sources)):
            model_result = get_model_answer(dev_input, sql)
            if 'Execution Error' not in model_result:
                Syntax_Correct = True
            if ground_truth == model_result:
                Semantic_Correct = True
                Top_i_Correct = i + 1 
                Prompt_Num = source
                break
    
    # Update CSV File
    new_row = [qid, Syntax_Correct, Semantic_Correct, Top_i_Correct, Prompt_Num]
    df.loc[len(df)] = new_row
    df.to_csv(csv_output_path, index=False)

json.dump(sql_json, open(json_output_path, 'w'))