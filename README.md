# Feather-SQL

Feather-SQL is a framework designed for NL2SQL tasks, leveraging small large language models on vLLM to efficiently process natural language queries into SQL. The framework utilizes two models with distinct roles:

1. **Chat Model**: Responsible for handling reasoning-related subtasks, such as schema linking and schema pruning.
2. **Fine-tuned Model**: Specially trained for SQL generation.

Existing experimental results demonstrate that under the Feather-SQL framework, 1.5B parameter models can achieve **53.26%** on the **BIRD DEV** dataset.

---

## Environment Setup

To set up the environment, follow these steps:

1. Create one environment for Feather-SQL and activate the environment.
   ```bash
   conda create --name feathersql python=3.10.15
   ```
   ```bash
   conda activate feathersql
   ```
2. Install the required packages by running:
   ```bash
   pip install -r requirement.txt
   ```

---

## Reproduce

### Step 1: Start the vLLM Models

Run two vLLM models using the following commands:

Chat Model (`Qwen/Qwen2.5-1.5B-Instruct`):
```bash
CUDA_VISIBLE_DEVICES=0 nohup vllm serve Qwen/Qwen2.5-1.5B-Instruct --port 8000 > model1_output.log 2>&1 &
```

SQL-Gen Model (`premai-io/prem-1B-SQL`):
```bash
CUDA_VISIBLE_DEVICES=1 nohup vllm serve premai-io/prem-1B-SQL --port 8001 > model2_output.log 2>&1 &
```

**Explanation**:
- `CUDA_VISIBLE_DEVICES=0` and `CUDA_VISIBLE_DEVICES=1` ensure each model is assigned to a specific GPU.
- Logs for each model will be saved in:
  - `model1_output.log` (for Model 1)
  - `model2_output.log` (for Model 2)

---

### Step 2: Configure Paths

Edit the `config.py` file to specify paths for the following files:

- **Input question file**: JSON file composed of NL-questions and corresponding databases.
- **Database**: Directory containing all databases.
- **Output files**:
  - **JSON file**: Produced after all answers are generated.
  - **CSV file**: Updated incrementally during inferencing for evaluation (if ground truth SQL is revealed).

---

### Step 3: Run the Inference Script

Run the `run.py` script in the background to start the inference process:
```bash
nohup python run.py > work.log 2>&1 &
```

**Explanation**:
- The script will run in the background.
- Logs of the process will be saved in `work.log`.

---

## Outputs

The following outputs will be generated during and after execution:

1. **Model Logs**:
   - `model1_output.log`: Log for Model 1 (`Qwen/Qwen2.5-1.5B-Instruct`)
   - `model2_output.log`: Log for Model 2 (`premai-io/prem-1B-SQL`)

2. **Inference Logs**:
   - `work.log`: Log for the inference process

3. **Generated Files**:
   - `results.json`: Final results after all tests.
   - `results.csv`: Incremental results updated during execution.
---