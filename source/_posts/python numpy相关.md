---
title: python-向量处理
tags: 
	- python
	- trick
categories: "python学习"
date: 2018-09-06 19:34:36
---

- 1.向量堆叠。
```python {.line-numbers}
x = [1,2,3,1]
m_v = np.vstack([x,x])
#array([[1, 2, 3, 1],
#       [1, 2, 3, 1]])
m_h = np.hstack([x,x])
#array([1, 2, 3, 1, 1, 2, 3, 1])
```

- 2.获取numpy array 数组的最值及其索引。
```python {.line-numbers}
ret = np.where(m_v == np.min(m_v))
print(ret)
#(array([0, 1], dtype=int64), array([0, 0], dtype=int64))  
# tuple 类型数据
ret[0]
#array([0, 1], dtype=int64)
ret[0][1]
#1
```
- 3.numpy 的axis机制
以np.sum()为例:2*3*4的输入 指定在维度axis上进行求和 得到的输出会不会再有该axis。
如np.sum(b,axis = 0)后的shape为3*4
``` python {.line-numbers}
>>> a = np.linspace(1,24,num=24)
>>> a.reshape((2,3,4))
array([[[ 1.,  2.,  3.,  4.],
        [ 5.,  6.,  7.,  8.],
        [ 9., 10., 11., 12.]],

       [[13., 14., 15., 16.],
        [17., 18., 19., 20.],
        [21., 22., 23., 24.]]])
>>> a
array([ 1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10., 11., 12., 13.,
       14., 15., 16., 17., 18., 19., 20., 21., 22., 23., 24.])
>>> b = a.reshape((2,3,4))
>>> b
array([[[ 1.,  2.,  3.,  4.],
        [ 5.,  6.,  7.,  8.],
        [ 9., 10., 11., 12.]],

       [[13., 14., 15., 16.],
        [17., 18., 19., 20.],
        [21., 22., 23., 24.]]])
>>> np.sum(b,axis = 0)
array([[14., 16., 18., 20.],
       [22., 24., 26., 28.],
       [30., 32., 34., 36.]])
>>> np.sum(b,axis = 1)
array([[15., 18., 21., 24.],
       [51., 54., 57., 60.]])
>>> np.sum(b,axis = 2)
array([[10., 26., 42.],
       [58., 74., 90.]])
```
- 4 numpy.reshape
np.reshape(x,(H,W,-1))
其中-1表示自动推断
