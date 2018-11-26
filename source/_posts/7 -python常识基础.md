---
title: python常识基础
tags: 
	- python
	- trick
categories: "python学习"
date: 2018-09-11 9:24:00
updated: 2018-11-16 11:17:00
---
**To be added:目录**

### 1.python求整
```python {.line-numbers}
a = 4//3
a = int(4/3)
```
### 2.位操作
``` python {.line-numbers}
a = 0011 1100
b = 0000 1101
a&b 
# 0000 1100
a|b 
# 0011 1101
a^b 
# 0011 0001
~a 
# 1100 0011
a^a
# 0
a^b^a
# 0
``` 
| 运算符 | 描述 | 示例 |
| ------- | ------- | ------- |
| &  | **按位与运算符**：  参与运算的两个值,如果两个相应位都为1,则该位的结果为1,否则为0. | (a & b) 输出结果 12 ，二进制解释： 0000 1100 |
| \| | **按位或运算符**：  只要对应的二个二进位有一个为1时，结果位就为1。 | (a \| b) 输出结果 61 ，二进制解释： 0011 1101 |
| ^  | **按位异或运算符**：当两对应的二进位相异时，结果为1.   |	(a ^ b) 输出结果 49 ，二进制解释： 0011 0001 |
| ~	 | **按位取反运算符**：对数据的每个二进制位取反,即把1变为0,把0变为1 。 | ~x 类似于 -x-1	(~a ) 输出结果 -61 ，二进制解释： 1100 0011，在一个有符号二进制数的补码形式。 |
| << |	**左移动运算符**：运算数的各二进位全部左移若干位，由 << 右边的数字指定了移动的位数，高位丢弃，低位补0。| a << 2 输出结果 240 ，二进制解释： 1111 0000 |
| >> |	**右移动运算符**：把">>"左边的运算数的各二进位全部右移若干位，>> 右边的数字指定了移动的位数  |	a >> 2 输出结果 15 ，二进制解释： 0000 1111 |

### 3.reduce
>reduce(f,list)函数是python内置的一个高阶函数。会对参数序列中元素进行累积。
函数将一个数据集合（list tuple）等的所有数据进行一下操作：用传给reduce中的function（必须有2个参数），先对集合中的第1,2个元素进行操作，然后将结果再与第3个数据进行function运算，最后得到一个结果。
``` python {.line-numbers}
from functools import reduce  # python3 neeeds 
def add(x,y):
	return x+y
print(reduce(add,[1,2,3,4,5]))
# 15

```

### 4.lambda 
**lambda 表达式通常在需要一个函数，但是又不想费神(233)去命名一个函数时使用，也就是匿名函数。**
``` python {.line-numbers}
add = lambda x,y : x+y
add(1,2)
#3
#-----------
a = [1,-3,2,4]
# key -- 主要是用来进行比较的元素，只有一个参数，具体的函数的参数就是取自于可迭代对象中，指定可迭代对象中的一个元# 素来进行排序。
b = sorted(a,key =lambda x:abs(x)
```

### 5.enumerate
- python 内置函数
- 对于一个可迭代的（iterable）/可遍历的对象（如列表、字符串），enumerate将其组成一个索引序列，利用它可以同时获得索引和值
``` python {.line-numbers}
a =[1,3,4,6]
for index,item in enumerate(a):
	print(index,item)
'''
0 1
1 3
2 4
3 6
'''
```
### 6.set 求交 并 差集
set的遍历是无序的。
不同机器 不同时间跑出的结果都不一样。
- 交集 : x&y
- 并集 : x|y
- 差集 : x-y


### 7.filter 函数

filter函数用于过滤序列，过滤掉不符合条件的元素，python2中返回新列表，python3中返回可迭代对象。

> 用法
filter(function,iterable)

``` python {.line-numbers}
a = filter(lambda x: x % 2 ==0，range(10))
print(a)
#<filter object at 0x0000011BF5D3E518>
for item in a:
	print (item)
pass
# 0 2 4 6 8
```

### 8.python 中的None True False

``` python {.line-numbers}
list1 = []
if list1 == None:
	print("list1 is ",list1)
else:
	print("list1 is NULL")
# list1 is NULL
```

判断对象是否为None 主要由以下写法：
``` python {.line-numbers}
if X is None:
	pass
if not X：
	pass
# 当X为None,  False, 空字符串"", 0, 空列表[], 空字典{}, 空元组()这些时，not X为真，即无法分辨出他们之间的不同。
if not X:
	pass

```

> 在Python中，None、空列表[]、空字典{}、空元组()、0等一系列代表空和无的对象会被转换成False。除此之外的其它对象都会被转化成True。


> - None是一个特殊的常量.
> - None和False不同。
> - None不是0。
> - None不是空字符串。
> - None和任何其他的数据类型比较永远返回False。
> - None有自己的数据类型NoneType。
> - 你可以将None复制给任何变量，但是你不能创建其他NoneType对象。

### 9.牛逼的sum函数。
sum()的语法是：

>sum(iterable,start)

The sum() function adds start and items of the given iterable from left to right.

---
sum()参数：
**iterable**- iterable (list, tuple, dict etc) whose item's sum is to be found. Normally, items of the iterable should be numbers.
可以是list 元组 字典等可迭代对象。
**start** (optional) - this value is added to the sum of items of the iterable. The default value of start is 0 (if omitted)
默认为0.也可以是[]等。
``` python {.line-numbers}
a = [[1,3,5,7,9],[2,4,6,8]]
x = sum(a,[])
print(x)
# [1 3 5 7 9 2 4 6 8]
```

### 10. 单引号 双引号 三引号
> - 1.单引号和双引号是通用的。
> - 2.在要表达的字符串中有单引号出现时使用双引号方便。
> - 3.在要表达的字符串中有单引号出现时使用单引号方便。
> - 4.三引号的出现是直接可以做在引号内回车。当然还可以做注释块啦。
> - 5.1234均体现了python的任性化。
``` python {.line-numbers}
str1 = " I'm OK, thank u"
str2 = 'Hello,MI "Fans"'
str3 = ''' Are
You
OK
'''
print(str1,str2,str3)
'''
I'm OK, thank u
Hello,MI "Fans"
Are
You
OK
'''
```

### 11. python 赋值 浅拷贝 深拷贝 
> 1.直接赋值。其实就是对象的引用。(别名)。赋值引用，都指向同一个对象。
> 2.浅拷贝。拷贝父对象，不会拷贝父对象的内部子对象。两者是一个独立的对象，但他们的子对象还是指向统一对象（是引用）。
> 3.深拷贝。copy模块的deepcopy()方法，完全拷贝了父对象个其子对象。两者是完全独立的。
``` python {.line-numbers}
import copy
a = [1,2,3,[4,5,6]]
b = a.copy()
a[3].append(7)
c = copy.deepcopy(a)
print(a,b,c)
print(id(a),id(b),id(c))
# [1, 2, 3, [4, 5, 6, 7]] [1, 2, 3, [4, 5, 6, 7]] [1, 2, 3, [4, 5, 6, 7]]
# 2164258934920 2164258672008 2164258840008
print(id(a[1]),id(b[1]))
1616669792 1616669792
```

### 12.装饰函数
参见[装饰函数](https://foofish.net/python-dec>orator.html)。写的是真好。

### 13.map/reduce函数。起源于Google鼎鼎大名 Map/Reduce论文。
>python中map()、filter()、reduce()这三个都是应用于序列的内置函数。
map(function, iterable, …)
map()函数接收两个参数，一个是函数，一个是序列，map将传入的函数依次作用到序列的每个元素，并把结果作为新的**list**(python2.7) **Iterator**(python3 使用之前需要list化)返回。
stackoverflow上有人说可以这样理解map()：
``` python {.line-numbers}
map(f, iterable)
#基本上等于：
[f(x) for x in iterable]
```

### 14.赋值
>多重赋值：x=y=z=1
多元赋值：x,y,z=1,3,'a string'
增量赋值：x+=1

### 15.
>sys.argv是传递给python脚本的命令行参数【字符串】列表
argv[0]为该脚本自身路径，其余为命令行参数。
和shell脚本的 $0 $1 $2 $3 $4一样。