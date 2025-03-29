from openai import OpenAI
from config import api_key, url_chat, url_sql, model_sql, model_chat

client_1 = OpenAI(api_key=api_key, base_url=url_chat)
client_2 = OpenAI(api_key=api_key, base_url=url_sql)

def generation(model, system_prompt, prompt):
    client = client_1 if model == model_chat else client_2
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
    client = client_1 if model == model_chat else client_2
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