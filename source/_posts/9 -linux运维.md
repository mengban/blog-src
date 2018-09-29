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