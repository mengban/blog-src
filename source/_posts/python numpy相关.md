---
title: python-list删除
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


