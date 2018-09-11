---
title: python步进切片
tags: 
	- python
	- trick
categories: "python学习"
date: 2018-09-10 17:56:00
---

### 1.python中函数的定义.
```python {.line-numbers}
def funcname(par1,par2):
	pass
	return
```

### 2.在函数体内修改形参会影响实参吗？
- 如果是数字 字符串或者元组，本身就是不可变的，修改形参对函数外的实参也没有影响。
- 如果是列表 list或者字典，那么修改参数内容后，实参的内容也会做出相应改变。
注：修改指修改参数对象内部的值，不包括赋值。**赋值是不影响函数体外的对象的**。这里和C++是不一样的。
``` python {.line-numbers}
def func(num) :
    num[0]+=1
    print('num id:',id(num))
    print('num is:',num)
    print(' l id :',id(l))
    print(' l  is:',l)
    
    num = [2,3,4,5]
    print('num id:',id(num))
    print('num is:',num)
    print(' l id :',id(l))
    print(' l  is:',l)
l = [1,2,3,4]
func(l)  
#num id: 2278800263240
#num is: [2, 2, 3, 4]
# l id : 2278800263240
# l  is: [2, 2, 3, 4]
#num id: 2278800264328
#num is: [2, 3, 4, 5]
# l id : 2278800263240
# l  is: [2, 2, 3, 4]

    
def foo(dic_) :
    #dic_['key'] = 'value2'  # TypeError: 'set' object does not support item assignment
    print(id(dic_))
    print(id(dic))
dic = {'key','value1'}
foo(dic)
# 2278811127880
# 2278811127880
```

### 3. python定义可变参数
 - 1 形式1
 ``` python {.line-numbers}

def foo(*params) :
	# params 在函数里是元组
    print(params,type(params))
	foo(1,2,3)
# (1, 2, 3) <class 'tuple'>
```
- 2 形式2
```python {line-numbers}
def foo(**params) :
	# params在函数里是字典
    print(params,type(params))
foo(x=1,y=2,z=3)
# {'x': 1, 'y': 2, 'z': 3} <class 'dict'>
 ```

