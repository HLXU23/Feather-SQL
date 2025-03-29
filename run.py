import pandas as pd
import json
import re
import tqdm
import os
import logging
from prompts import *
from config import *
from generation import generation_multiple
from db_handler import *
from stages import *
# logging.getLogger("transformers").setLevel(logging.ERROR)

nl_questions = json.load(open(question_path))

def work(dev_input, sql_limit=1):
    db_id = dev_input['db_id']
    question = dev_input['question']
    hint = dev_input.get("evidence", "")
    all_table_schema, table_columns, columns = get_all_table_columns(db_id)
    tables, database_schema = get_all_table_ddl(all_table_schema)
    table_schema = get_all_table_by_ddl(all_table_schema)

    # Schema Pruning
    selected_tables = schema_pruning(db_id, question, hint, tables, database_schema)

    # Schema Linking
    linking_array = schema_linking(db_id, database_schema, question, hint, table_columns, columns)

    # 4 Prompts
    prompts = []
    prompts.append(prompt_generation_without_linking.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint))
    if len(selected_tables) > 0 and len(selected_tables) != len(tables):
        selected_table_schema = "\n".join(table_schema[table] for table in selected_tables)
        prompts.append(prompt_generation_without_linking.format(database_name=db_id, database_schema=selected_table_schema, question=question, hint=hint))
        if len(linking_array) > 0:
            prompts.append(prompt_generation_with_linking.format(database_name=db_id, database_schema=selected_table_schema, schema_linking=linking_array, question=question, hint=hint))
    if len(linking_array) > 0:
        prompts.append(prompt_generation_with_linking.format(database_name=db_id, database_schema=database_schema, schema_linking=linking_array, question=question, hint=hint))
    
    # Generate sql candidates
    sql_queries = set()
    prompt_gennum = int(12/len(prompts))
    for prompt in prompts:
        responses = generation_multiple(model_sql, system_prompt_sql_generation, prompt, prompt_gennum)
        for sql in responses:
            sql = clean_sql(sql)
            sql_queries.add(sql)
    sql_queries = list(sql_queries)

    # Execute and correction
    syntax_correct_sql_queries = []
    results = []
    max_result_len = 0

    for sql in sql_queries:
        result = execute_model_answer(dev_input, sql)
        if 'Execution Error' not in result and len(result) > 0 and result not in results:
            syntax_correct_sql_queries.append(sql)
            results.append(result)
            max_result_len = max(max_result_len, len(str(result)))
        elif 'Execution Error' in result:
            # Answer Correction
            updated_prompt = prompt_answer_correction.format(schema=database_schema, question=question, hint=hint, prev_ans=sql, errorMsg=result)
            queries = generation_multiple(model_sql, prompt_answer_correction_system, updated_prompt, 2)
            for sql in queries:
                result = execute_model_answer(dev_input, sql)
                if 'Execution Error' not in result and len(result) > 0 and result not in results:
                    syntax_correct_sql_queries.append(sql)
                    results.append(result)
                    max_result_len = max(max_result_len, len(str(result)))

    # Sorting
    if len(syntax_correct_sql_queries) > 0:
        if max_result_len * len(syntax_correct_sql_queries) < 4500:
            answer_sql = sorting(question, hint, db_id, database_schema, syntax_correct_sql_queries, response=results, limit=sql_limit)
        else:
            answer_sql = sorting(question, hint, db_id, database_schema, syntax_correct_sql_queries, limit=sql_limit)
    else:
        answer_sql = []
    
    return answer_sql

if os.path.exists(json_output_path):
    with open(json_output_path, 'r') as f:
        sql_json = json.load(f) 
    df = pd.read_csv(csv_output_path)
    max_qid = max(item['question_id'] for item in sql_json) if sql_json else -1
else:
    sql_json = []  
    df = pd.DataFrame(columns=['question_id', 'syntax', 'semantic'])
    max_qid = -1 

df = df.copy()
for qid in tqdm.trange(max_qid + 1, len(nl_questions)):
    nl_question = nl_questions[qid]
    answer_sql = work(nl_question)
    answer = answer_sql[0] if len(answer_sql) != 0 else ""
    sql_json.append({'question_id': qid, 'answer_sql': answer})

    with open(json_output_path, 'w') as json_file:
        json.dump(sql_json, json_file, indent=4)
    
    # Continual evaluation
    # Note: comment this part if no ground truth revealed
    Syntax_Correct, Semantic_Correct = False, False
    ground_truth = get_ground_truth(nl_question) 
    model_result = execute_model_answer(nl_question, answer)
    if 'Execution Error' not in model_result:
        Syntax_Correct = True
        if ground_truth == model_result:
            Semantic_Correct = True
    new_row = [qid, Syntax_Correct, Semantic_Correct]
    df.loc[len(df)] = new_row
    df.to_csv(csv_output_path, index=False)