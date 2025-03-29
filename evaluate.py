import pandas as pd
import json
import os
import argparse
import tqdm
from prompts import *
from db_handler import *
from stages import *
from openai import OpenAI

base_dir = os.path.dirname(os.path.abspath(__file__))
question_path = os.path.join(base_dir, "source/test.json")
database_path = os.path.join(base_dir, "source/test_database")
evaluate_results_dir = os.path.join(base_dir, "evaluate_results")
nl_questions = json.load(open(question_path))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Evaluate SQL generation model.")
    parser.add_argument("--model", type=str, required=True, help="Model to evaluate.")
    model = parser.parse_args().model
    model_name = model.split("/")[-1]

    api_key = "your_actual_api_key"
    client = OpenAI(api_key=api_key, base_url="http://localhost:8001/v1")

    csv_output_path = os.path.join(evaluate_results_dir, f"{model_name}-spider.csv")
    json_output_path = os.path.join(evaluate_results_dir, f"{model_name}-spider.json")

    if os.path.exists(csv_output_path):
        existing_df = pd.read_csv(csv_output_path)
        max_question_id = existing_df['question_id'].max()
        sql_json = json.load(open(json_output_path, 'r'))
    else:
        existing_df = pd.DataFrame(columns=['question_id', 'syntax', 'semantic'])
        max_question_id = -1
        sql_json = []

    # Initialize with existing data
    df = existing_df.copy()
    for qid in tqdm.trange(max_question_id + 1, len(nl_questions)):
        nl_question = nl_questions[qid]
        question_id = nl_question['question_id']
        db_id = nl_question['db_id']
        question = nl_question['question']
        hint = nl_question.get('evidence', "")

        all_table_schema, table_columns, columns = get_all_table_columns(db_id)
        tables, database_schema = get_all_table_ddl(all_table_schema)

        prompt = prompt_generation_without_linking.format(database_name=db_id, database_schema=database_schema, question=question, hint=hint)
        messages = [
            {"role": "system", "content": system_prompt_sql_generation},
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

        sql = response.choices[0].message.content
        answer_sql = clean_sql(sql)
        sql_json.append({'question_id': qid, 'answer_sql': answer_sql})

        Syntax_Correct, Semantic_Correct = False, False
        ground_truth = get_ground_truth(nl_question)
        model_result = execute_model_answer(nl_question, answer_sql)
        if 'Execution Error' not in model_result:
            Syntax_Correct = True
            if ground_truth == model_result:
                Semantic_Correct = True
        new_row = [qid, Syntax_Correct, Semantic_Correct]
        df.loc[len(df)] = new_row
        df.to_csv(csv_output_path, index=False)

    json.dump(sql_json, open(json_output_path, 'w'))
    print("SQL answer saved")
