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