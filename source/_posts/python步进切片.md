---
title: python步进切片
tags: 
	- python
	- trick
categories: "python学习札记"
date: 2018-09-02 21:56:00
---
切片操作对python中所有可以索引的对象都可以切片操作

1.带步进正向切片

默认步进为1
``` python{.line-numbers}
In[24]: a = '123456789'
In[25]: a[0:8]
Out[25]: 
'12345678'
```

指定步进
``` python{.line-numbers}
In[26]: a[0:8:2]
Out[26]: 
'1357'
```

带步进遍历
``` python{.line-numbers}
In[33]: a[::2]
Out[33]: 
'13579'
```

2.带步进反向切片
``` python{.line-numbers}
In[27]: b = [12,34,56,78,90]
In[34]: b[::-1]
Out[34]: 
[90, 78, 56, 34, 12]
```

``` python{.line-numbers}
In[35]: b[::-2]
Out[35]: 
[90, 56, 12]
```

切片：
``` python{.line-numbers}
seq[start:end:step]
#开始索引，结束索引，步长
#含左不含右
```





