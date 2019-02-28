---
title: GPU问题集锦
tags: 
	- tensorflow
categories: "gpu"
date: 2018-12-27 17:26:00
updated: 2018-12-27 17:35:00
---


### 1. [Windows] failed to create cublas handle: CUBLAS_STATUS_ALLOC_FAILED

以下可以解决问题 但是会有内存不足的W
``` python {.line-numbers}
config = tf.ConfigProto()
config.gpu_options.allow_growth = True #创建session的时候允许显存增长
session = tf.Session(config=config)

```
*Allocator (GPU_0_bfc) ran out of memory trying to allocate 1019.25MiB. The caller indicates that this is not a failure, but may mean that there could be performance gains if more memory were available.*

如果你是使用 GPU 版 TensorFlow 的话，并且你想在显卡高占用率的情况下（比如玩游戏）训练模型，那你要注意在初始化 Session 的时候为其分配固定数量的显存，否则可能会在开始训练的时候直接报错退出：

``` python {.line-numbers}
gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.333)  
sess = tf.Session(config=tf.ConfigProto(gpu_options=gpu_options))  

```





