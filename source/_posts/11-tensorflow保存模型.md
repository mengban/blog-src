---
title: tensorflow 模型保存
tags: 
	- DL
	- tf
categories: "tensorflow"
date: 2018-09-18 19:58:00
---

### 1. tensorflow模型保存
``` python {.line-numbers}
import tensorflow as tf
##################################################3
w1 = tf.Variable(tf.constant(1.0), name='w1')
w2 = tf.Variable(tf.constant(2.0), name='w2')
tf.add_to_collection('vars', w1)
tf.add_to_collection('vars', w2)
saver = tf.train.Saver()

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    w1 = tf.add(w1, w2)
    saver.save(sess,'./my-model')

```
#### 以上代码生成了3个文件
- 1.my-model.ckpt.data-00000-of-00001
- 2.my-model.ckpt.index
- 3.my-model.ckpt.meta

### 2.模型加载
``` python {.line-numbers}
with tf.Session() as sess:
    saver = tf.train.Saver()
    saver.restore(sess, "./my-model.ckpt")
```
**尽管以上代码中指定的文件名字并没有声明，但是通过saver还是可以自动加载出模型的。**

