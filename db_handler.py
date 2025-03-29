import sqlite3
import multiprocessing
from config import database_path

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

import re

def clean_sql(sql):
    pattern = re.compile(r"(SELECT.*?;)", re.DOTALL)
    match = pattern.search(sql)
    sql_match = re.search(r"```sql(.*?)```", sql, re.DOTALL)
    if match:
        sql = match.group(1).strip()
    elif sql_match:
        sql = sql_match.group(1).strip()
    sql = sql.replace('\"', ' ').replace('\n', ' ').replace('\t', ' ')
    sql = re.sub(r'\s+', ' ', sql).strip()
    return sql

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

def execute_model_answer_work(dev_input, sql, queue):
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

def execute_model_answer(dev_input, sql):
    queue = multiprocessing.Queue()
    p = multiprocessing.Process(target=execute_model_answer_work, args=(dev_input, sql, queue))
    p.start()
    p.join(15)
    if p.is_alive():
        p.terminate()
        p.join()
        return "Execution Error: Timeout"
    else:
        return queue.get()