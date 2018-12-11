---
title: Ubuntu系统磁盘相关命令
tags: 
	- 磁盘
	- 运维
categories: "linux"
date: 2018-09-18 19:58:00
---

### 1.swap分区大小.
- 内核空间交换区分利用参数查看命令
``` Bash {.line-numbers}
cat /proc/sys/vm/swappiness

```
cat /proc/sys/vm/swappiness
### 2.调整分区大小.
通过gparted 软件

### 3.查看磁盘命令.
```Bash {.line-numbers}
df -hl
```

### 4.显示隐藏文件
``` Bash {.line-numbers}
ctrl+h
```

### 5.adduser useradd
adduser 会自动创建用户目录。

### 6.fork()函数
>只需记住一点:fork()函数调用一次返回两次。
在父进程中 根据返回值(子进程PID)继续执行
在子进程中 根据返回值(0) 再继续执行。
如下例子  根据短路原则 main作为父进程 会创建子进程1 子进程1创建子进程2。
子进程保存了父进程前的代码状态 并直接运行。 
```C {.line-numbers}
int main()
{
fork()||fork();
}
```