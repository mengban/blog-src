---
title: python的类
tags: 
	- python
	- 面向对象
categories: "python学习"
date: 2018-10-11 20:08:00
updated: 2018-10-11 14:06:00
---

### 0 坑的实例
``` python {.line-numbers}
class A:
	a = []
	def foo(self,a):
	    pass
```

``` python {.line-numbers}
class A:	
	def foo(self,a):
	    self.a = []
	    pass
```
**这俩啥区别？**
做该题目时遇到了坑[Binary Tree Path.](https://leetcode.com/problems/binary-tree-paths/description/)

>注意到__init__方法的第一个参数永远是self，表示创建的实例本身，因此，在__init__方法内部，就可以把各种属性绑定到self，因为self就指向创建的实例本身。
有了__init__方法，在创建实例的时候，就不能传入空的参数了，必须传入与__init__方法匹配的参数，但self不需要传，Python解释器自己会把实例变量传进去：


