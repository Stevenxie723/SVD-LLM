#!/usr/bin/env bash

#SBATCH --account=MST114546
#SBATCH --partition=normal
#SBATCH --job-name=svd-llm-v2
#SBATCH --dependency=singleton
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err
#SBATCH --switches=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gpus-per-node=1
#SBATCH --mem=90G
#SBATCH --mail-user=stevenxie42@gmail.com
#SBATCH --mail-type=ALL

COMPRESSION_RATIO=0.2
HUGGINGFACE_MODEL_REPO=meta-llama/Meta-Llama-3-8B
WHITENING_SAMPLE_NUMBER=256
WHITENING_DATASET=wikitext2
SAMPLING_SEED=3
MODEL_SEQ_LEN=4096
COMPRESSED_MODEL_SAVING_PATH=/work/u7656954/SVD-LLM/compressed_models

pixi run python SVDLLM.py \
    --step 6 \
    --ratio $COMPRESSION_RATIO \
    --model $HUGGINGFACE_MODEL_REPO \
    --whitening_nsamples $WHITENING_SAMPLE_NUMBER \
    --dataset $WHITENING_DATASET \
    --seed $SAMPLING_SEED \
    --model_seq_len $MODEL_SEQ_LEN \
    --save_path $COMPRESSED_MODEL_SAVING_PATH
    # --run_low_resource
    # --use_fp32_profiling