import os

url_chat = "http://localhost:8000/v1"
url_sql = "http://localhost:8000/v1"
model_chat = "Qwen/Qwen2.5-1.5B-Instruct"
model_sql = "Qwen/Qwen2.5-1.5B-Instruct"
api_key = "sk-"

base_dir = os.path.dirname(os.path.abspath(__file__))
question_path = os.path.join(base_dir, "source/dev.json")
database_path = os.path.join(base_dir, "source/dev_database")
json_output_path = os.path.join(base_dir, "result/qwen-Feather-12.json")
csv_output_path = os.path.join(base_dir, "result/qwen-Feather-12.csv")