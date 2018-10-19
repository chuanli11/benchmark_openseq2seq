Benchmark OpenNMT
===

This repo contains scripts to benchmark the training speed of OpenSeq2Seq on different machines.

To run the benchmark, use this command

```
./batch_benchmark.sh <model_type> <min_num_gpu> <max_num_gpu> <batch_size_per_gpu>
cat summary-<model_type>.md
```

The script will spin multiple runs with number of gpus increased from `min_num_gpu` to `max_num_gpu`. Results will be saved as `summary-<model_type>.md` file.

* `model_type`: Check folder `example_configs/text2text/en-de`. For example, use `en-de-nmt-small-fp32` and `en-de-nmt-small-fp16` to train a small nmt with single or mixed precision. 
* `min_num_gpu`: default to 1.
* `max_num_gpu`: default to 8.
* `batch_size_per_gpu`: default to 128

 
