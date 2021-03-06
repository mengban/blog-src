---
title: python步进切片
tags: 
	- python
	- trick
categories: "python学习"
date: 2018-09-02 21:56:00
---

切片操作对python中所有可以索引的对象都可以切片操作。
切片操作符中的第一个数（冒号之前）表示切片开始的位置，第二个数（冒号之后）表示切片到哪里结束，第三个数（冒号之后）表示切片间隔数。如果不指定第一个数，Python就从序列首开始。如果没有指定第二个数，则Python会停止在序列尾。
### 1.带步进正向切片

默认步进为1
``` python {.line-numbers}
a = '123456789'
print(a[0:8])
'12345678'
```

指定步进
``` python {.line-numbers}
print(a[0:8:2])
'1357'
```

带步进遍历
``` python {.line-numbers}
print(a[::2]) 
'13579'
```

### 2.带步进反向切片
``` Python {.line-numbers}
b = [12,34,56,78,90]
print(b[::-1])
[90, 78, 56, 34, 12]
```

``` Python {.line-numbers}
print(b[::-2])
[90, 56, 12]
```
### 3.样例

| 元素 |  | 1 | 2 | 3 | 4 | 5 |  |
| -------   | -------   | -------   | -------   |-------   |-------   | -------   | ------- |
| 索引 | None|  0 | 1 | 2 | 3 | 4 | None |
| 索引 | None| -5 | -4 | -3  | -2 |  -1 | None| 
```Python {.line-numbers}
a = [1,2,3,4,5]
print(a[0:None:1])
1 2 3 4 5

print(a[-1:None:-1])
5 4 3 2 1

print(a[::-1])
5 4 3 2 1
```


---
seq [start: end: step]
有以下规律：
- 元素有两个索引。
- 含strat，不含end。
- 步进1是左->右，-1是右->左。角标起始按照方向确定始终。
- 两端各有None，也可作角标。 
---





