---
title: python-list相关
tags: 
	- python
	- trick
categories: "python学习"
date: 2018-09-03 20:42:36
updated: 2018-09-07 20:37:36
---
## 1.python list删除的四种方式。

### 1. 使用del。
```python{.line-numbers}
a = [1,2,3,4,5]
del a
del a[0]
```

### 2.使用pop。
```python {.line-numbers}
a = [1,2,3,4,5]
a.pop()  ##默认pop最后一个元素
a.pop(0)
```
### 3.使用remove。
```python {.line-numbers}
a = [1,2,3,4,5]
a.remove(3) # 删除值为3的元素 当有多个3 只删第一个3。
```
- pop与remove的区别是 pop根据脚标删除，remove根据元素的值进行删除。

### 4.使用切片的方式。
```python {.line-numbers}
a = [1,2,3,4,5]
a = a[::2]
print(a)
1 3 5
```
## 2.python list的常用函数
```python {.line-numbers}
a.index(2)
# 1
```
## 3.list的复制
### 1.
```python {.line-numbers}
a = [1,3,2,4]
b = a
b.pop(0)
print(a)
# [3,2,4]

a = [1,3,2,4]
b = a[:]
b.pop(0)
print(a)
# [1,3,2,4]
```


