---
title: shell 变量含义
tags: 
	- shell
	- trick
categories: "linux"
date: 2018-09-12 11:35:00
---

### 1.shell变量
linux中shell变量$#,$@,$0,$1,$2的含义解释
| 参数形式          |           含义 |
| -------           | -------       |
|$0| 当前脚本文件名|
|$n| 传递给脚本或函数的参数。代表第n个参数。n不能大于10。
|$#| 传递给脚本或者函数的参数个数。|
|$*| 传递给脚本或函数的所有参数。|
|$@| 同上。被双引号(" ")包含时，与 $* 稍有不同。|
|$?| 上个命令的退出状态或者函数返回值。 |
|$$| 当前shell进程ID。|
``` Bash {.line-numbers}
#!/bin/bash
echo "File Name: $0"
echo "First Parameter : $1"
echo "First Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"
### 
./test.sh one two
# File Name : ./test.sh
# First Parameter : one
# Second Parameter : two
# Quoted Values: one two
# Quoted Values: one twp
# Total Number of Parameters : 2
```


### 2.提取文件名

${}用于字符串的读取，提取和替换功能，可以使用${} 提取字符串
``` Bash
1、提取文件名
# var=/dir1/dir2/file.txt
# echo ${var##*/}
file.txt

2、提取后缀
# var=/dir1/dir2/file.txt
# echo ${var##*.}
txt

3、提取不带后缀的文件名，分两步
# var=/dir1/dir2/file.txt
# tmp=${var##*/}
# echo $tmp
file.txt
# echo ${tmp%.*}
file

5、提取目录
# var=/dir1/dir2/file.txt
# echo ${var%/*}
/dir1/dir2

6、
# var=/dir1/dir2/file.txt
# echo ${var%%.*}
/dir1/dir2/file

7、
# var=/dir1/dir2/file.tar.gz
# echo ${var#*.}
tar.gz
```
8、${}总结
${}的使用是变量的提取和替换等操作；
\#：表示从左边算起第一个
%：表示从右边算起第一个
\##：表示从左边算起最后一个
%%：表示从右边算起最后一个
换句话来说，＃总是表示左边算起，％总是表示右边算起。

*：表示要删除的内容，对于#和##的情况，它位于指定字符（例子中的'/'和'.'）的左边，表于删除指定字符及其左边的内容；对于%和%%的情况，它位于指定字符（例子中的'/'和'.'）的右边，表示删除指定字符及其右边的内容。这里的'*'的位置不能互换，即不能把*号放在#或##的右边，反之亦然。

使用文件目录的专有命令basename和dirname
1、提取文件名，注意：basename是一个命令，使用$(), 而不是${}
``` Bash
# var=/dir1/dir2/file.txt
# echo $(basename $var)
file.txt

2、提取不带后缀的文件名
# var=/dir1/dir2/file.txt
# echo $(basename $var .txt)
file

3、提取目录
# var=/dir1/dir2/file.txt
# dirname $var
/dir1/dir2
# echo $(dirname $var)
/dir1/dir2
# dir=/dir1/dir2/
# dirname $dir
/dir1
```