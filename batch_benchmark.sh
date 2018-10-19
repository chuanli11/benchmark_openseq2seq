#!/bin/bash -e

MODEL_TYPE=${1:-'en-de-nmt-small'}

MIN_NUM_GPU=${2:-1}
MAX_NUM_GPU=${3:-2}

BATCH_SIZE_PER_GPU=${4:-128}

SUMMARY_FILE="summary-${MODEL_TYPE}.md"

echo "Summary" > $SUMMARY_FILE

for num_gpus in `seq ${MAX_NUM_GPU} -1 ${MIN_NUM_GPU}`; do
  output_file="${MODEL_TYPE}-${num_gpus}gpu.log"
  python run.py \
         --config_file="./example_configs/text2text/en-de/${MODEL_TYPE}.py" \
         --batch_size_per_gpu=${BATCH_SIZE_PER_GPU} \
         --num_gpus=${num_gpus} \
         --print_samples_steps=200 \
         --print_loss_steps=100 \
         --max_steps=300 |& tee "$output_file"
  rm -rf ${MODEL_TYPE}
  objects_per_sec=$(cat $output_file |grep "Avg objects per second:" | awk '{ print $6 }')
  echo "${num_gpus}gpu: ${objects_per_sec} objects per sec.">> $SUMMARY_FILE
done




