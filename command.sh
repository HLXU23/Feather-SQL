#!/bin/bash

# 模型列表
models=(
    # Qwen/Qwen2.5-0.5B-Instruct
    # "deepseek-ai/deepseek-coder-1.3b-instruct"
    # "01-ai/Yi-Coder-1.5B-Chat"
    # "Qwen/Qwen2.5-1.5B-Instruct"
    # "Qwen/Qwen2.5-Coder-1.5B-Instruct"
    # "openbmb/MiniCPM3-4B"
    # nvidia/Nemotron-Mini-4B-Instruct
    # "microsoft/Phi-3-mini-128k-instruct"
    # microsoft/Phi-3.5-mini-instruct
    # tiiuae/Falcon3-3B-Instruct
    # Qwen/Qwen2.5-3B-Instruct
    # NousResearch/Hermes-3-Llama-3.2-3B
    # ibm-granite/granite-3.1-2b-instruct
    # HuggingFaceTB/SmolLM2-1.7B-Instruct
    
    # premai-io/prem-1B-SQL
    # PrunaAI/PipableAI-pip-sql-1.3b-HQQ-1bit-smashed

    # deepseek-ai/deepseek-coder-7b-instruct-v1.5
    # Qwen/Qwen2.5-Coder-7B-Instruct
    # Qwen/Qwen2.5-7B-Instruct
    # neuralmagic/Meta-Llama-3.1-8B-Instruct-FP8
    # Deci/DeciLM-7B
    # tiiuae/Falcon3-7B-Instruct
    # 01-ai/Yi-6B-Chat
    # 01-ai/Yi-Coder-9B-Chat
    # 01-ai/Yi-1.5-6B-Chat
    # allenai/Llama-3.1-Tulu-3-8B
    # HuggingFaceH4/zephyr-7b-alpha

    defog/sqlcoder-7b-2
    # chatdb/natural-sql-7b
    seeklhy/codes-3b-bird-with-evidence
    seeklhy/codes-7b-bird-with-evidence
)

PORT=8000

# 函数：用 Python 检测端口是否可用
wait_for_port() {
    python3 - <<EOF
import socket
import time

port = $1
host = "localhost"

print(f"等待端口 {port} 启动...")
while True:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.connect((host, port))
            print(f"端口 {port} 已准备好！")
            break
        except (ConnectionRefusedError, OSError):
            time.sleep(1)
EOF
}

current_pid=$$
for model in "${models[@]}"; do
    # 提取模型的名称部分
    model_name="${model##*/}"
    model_output_log="${model_name}_output.log"
    model_evaluate_log="${model_name}_evaluate.log"

    echo "启动模型: $model"
    
    # 启动模型服务器
    CUDA_VISIBLE_DEVICES=1 vllm serve "$model" --port $PORT --trust-remote-code --gpu-memory-utilization 0.9  --chat-template chat_template1.jinja > "$model_output_log" 2>&1 &
    pid=$(pgrep -f "vllm serve $model")
    echo "模型启动的 PID: $pid"
    
    # 等待服务器端口准备好
    wait_for_port $PORT

    echo "运行评估脚本: $model"
    python evaluate.py --model "$model" > "$model_evaluate_log" 2>&1
    echo "模型 $model 的评估已完成"

    kill $pid
    echo "停止模型: $model"
    sleep 60
done