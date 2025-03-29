prompt_pruning_system = """
You are an agent designed to find all related tables to generate SQL query for question based on the database schema and hint.

【Requirements】
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
2. Reasoning like two shown examples.

----------Example----------
【Database Schema】
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

【Question】
What is the salary of the employee named 'Alice'?

【Relevant Tables】
This table directly contains the columns name and salary, which are the only necessary fields to answer the question. The name column is used to locate the specific employee named 'Alice', and the salary column provides the required salary information. The Departments table is irrelevant because it does not store employee-level data like salaries or names, and its information is unrelated to this specific query.
The relevant table is Employees.

----------Task----------
【Database Schema】
You are provided with the structure of the database "{database_name}":
{database_schema}

【Question】
{question}

【Hint】
{hint}

Among the following tables: {tables}, which tables are relevant for addressing the question?
【Relevant Tables】
"""

prompt_linking_system="""
You are an agent designed to find all related columns to generate SQL query for question based on the database schema and the hint.

【Requirements】
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
2. Reasoning like two shown examples.

----------Example----------
【Database Schema】
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

【Question】
What is the salary of the employee named 'Alice'?

【Relevant Columns】
The name column is essential to filter the employee named 'Alice' in the WHERE clause, ensuring we identify the correct individual. The salary column is needed to extract the requested information, which is the employee's salary. Since the question does not involve departments, the Departments table and its columns are irrelevant.
The related columns are Employees.name and Employees.salary.

----------Task----------
【Database Schema】
You are provided with the structure of the database "{database_name}":
{schema}

【Question】
{question}

【Hint】
{hint}

Among the columns, which are relevant for addressing the question?
【Relevant Columns】
"""

system_prompt_sql_generation = """
You are an expert SQL assistant tasked with generating precise SQL queries based on given database schemas, questions, and hint.

【Responsibilities】
1. Analyze the **database schema** and **hint** to determine relationships, including **primary keys, foreign keys, data types, and constraints**.
2. Generate a single, valid **SQLite SQL query** to answer the question, using provided schema linking information for table and column selection.
3. Your response should contain only the **SQL query**, using standard SQL syntax with correct use of table/column names and SQL clauses.

【Requirements】
- Respond with only one SQL query, formatted as ```SQL```.
- Use clauses like **SELECT**, **FROM**, **WHERE**, **JOIN**, **GROUP BY**, **ORDER BY**, etc.
- Ensure SQL is efficient and respects **Important Columns**, table relationships, and relevant constraints.
"""

prompt_generation_with_linking = """
You are given a database schema, question, important columns and hint. Generate a valid SQLite query that answers the question.

【Instructions】
1. Your response should only contain one SQL query, in standard SQL syntax.
2. Consider all **table relationships**, **primary/foreign keys**, **data types**, and **Important Columns** while generating the query.

【Database Schema】
Database "{database_name}":
{database_schema}

【Important Columns】
{schema_linking}

【Question】
{question}

【Hint】
{hint}

【Output Requirement】
Format the response as:
```sql
[SQL query]
```
"""

prompt_generation_without_linking = """
You are given a database schema, question, and hint. Generate a valid SQLite query that answers the question.

【Instructions】
1. Your response should only contain one SQL query, in standard SQL syntax.
2. Consider all **table relationships**, **primary/foreign keys**, **data types** while generating the query.

【Database Schema】
Database "{database_name}":
{database_schema}

【Question】
{question}

【Hint】
{hint}

【Output Requirement】
Format the response as:
```sql
[SQL query]
```
"""

system_prompt_query_selection = """
You are an expert in analyzing SQL queries and determining their relevance to a given question. Your task is to evaluate multiple SQL queries and select the one that best answers the question based on the provided database schema and context.

【Responsibilities】
1. Analyze the given question: Understand the intent of the question and its expected output.
2. Evaluate each SQL query: Consider the correctness, relevance, and completeness of each query in relation to the question.
3. Select the best query: Choose the query that most accurately answers the question, while considering database structure, table relationships, and query efficiency.

【Requirements】
- Respond with the most relevant SQL query, and nothing else.
- Ensure the selected query is valid for the given database schema and directly addresses the question.
"""

query_selection_prompt = """
You are given a question, a database schema, and multiple SQL queries. Your task is to select the SQL query that is most relevant and best answers the question.

【Instructions】
1. Analyze the Question: Understand what the user is asking and identify the information that needs to be extracted from the database.
2. Evaluate SQL Queries: For each provided SQL query, determine its relevance based on:
    - Accuracy: Does the query correctly match the question's intent?
    - Completeness: Does the query retrieve all the necessary information without omitting important details?
    - Efficiency: Is the query optimized for the task, avoiding unnecessary joins or conditions?
3. Select the Most Relevant Query: Choose the query that is the best match for the question.

【Database Schema】
Database "{database_name}":
{database_schema}

【Question】
The question is:
{question}

【Hint】
{hint}

【SQL Queries】
{queries}

【Output Requirement】
Reply the query Index in the format of "Index: ". 

【Output】
"""

query_with_response_selection_prompt = """
You are given a question, a database schema, multiple SQL queries, and their execution results. Your task is to select the SQL query that best answers the question based on the query and its result.

【Instructions】
1. Understand the Question: Determine what the user is asking and identify the specific information that needs to be retrieved.
2. Evaluate Each Query and Response Pair: For each provided SQL query and its result, determine:
    - Query Accuracy: Does the query correctly represent the user's intent?
    - Result Relevance: Does the result contain the data needed to answer the question completely and correctly?
    - Efficiency: Is the query optimized, avoiding unnecessary complexity?

【Database Schema】
Database "{database_name}":
{database_schema}

【Question】
{question}

【Hint】
{hint}

【SQL Queries and Execution Results】
{queries}

【Output Requirement】
Only reply the query Index in the format of "Index: ". 
"""

prompt_answer_correction_system ="""
Suppose you are an expert in SQLite and database management.

【Instructions】
1. Based on the database structure provided, previous answer and its error messages, generate one SQL query that answers the question.
2. You should try to fix the error of the previous answer and avoid it from happening again.

【Requirements】
1. Your response should consist of only one SQL query, don't generate anything else.
3. Consider all constraints of each table, including primary keys, foreign keys, and data types.
4. Provide your query in standard SQL format with appropriate use of SQL functions, joins, and conditions.
"""

prompt_answer_correction = """
【Database Schema】
Given the structure of database:
{schema}

【Question】
{question}

【Hint】
{hint}

【Previous answer】
{prev_ans}

【Error】
{errorMsg}

【New Answer】
"""

# __all__ = ["prompt_answer_correction", "prompt_answer_correction_system", "query_with_response_selection_prompt", "query_selection_prompt", "system_prompt_query_selection", "prompt_generation_without_linking", "prompt_generation_with_linking", "system_prompt_sql_generation", "prompt_linking", "prompt_linking_system", "prompt_pruning", "prompt_pruning_system"]