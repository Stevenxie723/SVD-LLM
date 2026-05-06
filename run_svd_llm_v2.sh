COMPRESSION_RATIO=0.2
HUGGINGFACE_MODEL_REPO=huggyllama/llama-7b
WHITENING_SAMPLE_NUMBER=256
WHITENING_DATASET=wikitext2
SAMPLING_SEED=3
MODEL_SEQ_LEN=2048
COMPRESSED_MODEL_SAVING_PATH=/work/u7656954/SVD-LLM/compressed_models

export HF_HOME=/work/u7656954/huggingface-cache

python SVDLLM.py \
    --step 6 \
    --ratio $COMPRESSION_RATIO \
    --model $HUGGINGFACE_MODEL_REPO \
    --whitening_nsamples $WHITENING_SAMPLE_NUMBER \
    --dataset $WHITENING_DATASET \
    --seed $SAMPLING_SEED \
    --model_seq_len $MODEL_SEQ_LEN \
    --save_path $COMPRESSED_MODEL_SAVING_PATH \
    --run_low_resource \
    --use_fp32_profiling