import json

# 从 'test.json' 文件读取原始数据
with open('test.json', 'r') as f:
    json_data = json.load(f)

# 遍历每个元素，修改'query'为'SQL'，添加'question_id'，并删除不需要的字段
for idx, item in enumerate(json_data):
    # 将 'query' 字段改为 'SQL'
    item['SQL'] = item.pop('query')
    
    # 添加 'question_id'
    item['question_id'] = idx
    
    # 仅保留 'db_id', 'question', 'SQL' 和 'question_id' 字段
    keys_to_keep = ['db_id', 'question', 'SQL', 'question_id']
    item_keys = list(item.keys())
    for key in item_keys:
        if key not in keys_to_keep:
            del item[key]

# 将修改后的数据转回JSON格式字符串
updated_data = json.dumps(json_data, indent=4)

# 将结果存储到新的文件中（例如 'updated_data.json'）
with open('updated_test.json', 'w') as f:
    f.write(updated_data)

# 输出文件路径或确认消息
print("Updated data has been saved to 'updated_data.json'.")