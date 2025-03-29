from config import *
from generation import *
from prompts import *
import re

def schema_pruning(db_id, question, hint, database_tables, database_schema, temperature=0):
    prompt = prompt_pruning.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, tables=database_tables)
    limit, top_p = (1, 1.0) if temperature == 0 else (3, 0.9)
    responses = generation_multiple(model_chat, prompt_pruning_system, prompt, limit, temperature=temperature, top_p=top_p)

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
    responses = generation_multiple(model_chat, prompt_linking_system, prompt, limit, temperature=temperature, top_p=top_p)

    linking_array = set()
    for response in responses:
        for column in columns:
            if column in response:
                for table, table_column_names in table_columns.items():
                    if column in table_column_names:
                        linking_array.add(f"{table}.{column}")
                        break
    return list(linking_array)

def sorting(question, hint, db_id, database_schema, sql_queries, limit=-1, response=None):
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
                queries_string += f"Index: {cnt + 1}, Query: {query}, Execution Result: {resp}\n"
            prompt = query_with_response_selection_prompt.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, queries=queries_string)
        else:
            for cnt, query in enumerate(sql_queries):
                queries_string += f"Index: {cnt + 1}, Query: {query}\n"
            prompt = query_selection_prompt.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint, queries=queries_string)
        output = generation(model_chat, system_prompt_query_selection, prompt)

        match = re.search(r'Index: (\d+)', output)
        selected_index = None
        if output.isdigit():
            index_value = int(output) - 1 
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