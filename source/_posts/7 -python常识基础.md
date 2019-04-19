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


def fil(x):
	return abs(x)>2
for item in filter(fil,[1,-2,3,-4]):
	print(item)
# -4
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
> 4.关于*
``` python {.line-numbers}
a = [[]] * 2 
id(a[0])
#2653548226632
id(a[1])
#2653548226632
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

def f(x):
	return abs(x)
for item in map(f,[1,-2,3,-4]):
	print(item)

# 1 2 3 4
```

### 14.赋值
>多重赋值：x=y=z=1
多元赋值：x,y,z=1,3,'a string'
增量赋值：x+=1

### 15.
>sys.argv是传递给python脚本的命令行参数【字符串】列表
argv[0]为该脚本自身路径，其余为命令行参数。
和shell脚本的 $0 $1 $2 $3 $4一样。

### 16.zip 函数
> zip()函数用于将可迭代的对象(如list dict )作为参数，将对象中对应元素进行打包成一个个元组，然后返回由这些元组组成的对象。**返回组成的对象节省了内存**可以使用list()俩将输出对象那个转换为列表.如果各个迭代器元素个数不一样 则返回列表长度于最短对象相同。zip(*zipped) 解压缩。
``` python {.line-numbers}
zipped =  zip([1,2,3],[4,5,6])
zipped
#<zip at 0x16fd026dbc8>
list(zipped)
[(1, 4), (2, 5), (3, 6)]

a,b = zip(*zipped) #error 了 很奇怪

zipped =  zip([1,2,3],[4,5,6]) ##这样就可以 很奇怪
a,b = zip(*zipped)
a
(1,2,3)
b
(4,5,6)

```

### 17 .join()函数
> 用于将**序列中的元素**以指定的字符连接生成一个**新的字符串**。参数可以是元组 列表 字典 字符串。
语法：str.join(sequence)
``` python {.line-numbers}

a = ['1','2','3']
st = ''.join(a)
#'123'

#对于字典类型 只会将key进行连接
seq = {'hello':'nihao','good':2,'boy':3,'doiido':4}
print('-'.join(seq))
# hello-good-boy-doiido
```

### 18 可迭代对象。
>可以直接作用于for循环的数据类型有以下几种：
一类是集合数据类型，如list、tuple、dict、set、str等；
一类是generator，包括生成器和带yield的generator function。
这些可以直接作用于for循环的对象统称为可迭代对象：Iterable。
可以使用isinstance()判断一个对象是否是Iterable对象：

### 19.python中的元组。
> 元组数据结构类似于list 但是元素不能修改类似于string 但是又可以进行拼接 截取操作。

### 20.为什么的大部分语言都是0-based索引。
> 首先明确索引脚标表示的是对首元素的偏移量。基于0-based的脚标表示 这个在汇编语言时代可以直接使用MOV指令比较方便。即下标可以直接等价成MOV值到偏移寄存器里，而基址寄存器里面保存的是数组头的地址，结合这两个就可以寻址取值。在python中  据python之父介绍 使用0-based的原因主要是python的半开区间切片语法与0-based完美契合。Fortan使用1-based。

### 21.python 字符串拼接
>简介两种:
- 1 str1 + str2
- 2 ''.join(['1','2']) 
``` python {.line-numbers}
str1 = "abc"
str2 = 'def'
print(str1 + str1)
# ""abcdef
print(''.join(['1','2'])) 
# '12'
print('a'.join(['1','2']))
#'1a2'
```

### 22.python 格式化输出
1. 整数输出
- %o 八进制
- %d 十进制
- %x 十六进制

``` python {.line-number}
print('%d'%20)
#20
print('%x'%20)
#14
print('%o'%20)
#24

```

2. 浮点数输出
- %f 默认保留小数点后六位。默认进行了四舍五入
- %.3f 保留三位小数点

- %e 保留小数点后六位 以指数形式
- %.3e 保留三位小数 科学计数法

``` python {.line-number}
print('%f'%20)
#20.000000
print('%6.f'%20)
#    20
print('%.6f'%20)
#20.000000
print('%.6e'%20)
#2.000000e+01

print('%.2f'%20.155)
#20.16
print('%.2f'%20.154)
#20.15


```

3. 字符串输出。
- %s 
``` python {.line-number}
print('%s'% 'hello world')
#hello world
print('%20s'% 'hello world')  #右对齐20位
#         hello world
print('%-20s'% 'hello world') #左对齐20位
#hello world
print('%10.2s' % 'hello world')  # 右对齐，取2位
#         he
print('%-10.2s' % 'hello world')  # 左对齐，取2位
#he  

```
- format用法。相对基本格式化采用的%方法，format功能更为强大。
- 不带编号，即“{}”
- 带数字编号，可调换顺序，即“{1}”、“{2}”
- 带关键字，即“{a}”、“{tom}”

``` python {.line-number}

print('{}{}'.format('hello','world'))
#helloworld
print('{} {}'.format('hello','world'))
#hello world
print('{a} {b}'.format(a='hello',b='world'))
#hello world
print('{b} {a}'.format(a='hello',b='world'))
#world hello
print('{0} {1}'.format('hello','world'))
#hello world
print('{1} {0}'.format('hello','world'))
#world hello

```


