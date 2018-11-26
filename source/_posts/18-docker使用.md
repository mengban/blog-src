---
title: docker的使用
tags: 
	- docker
	- 开源
categories: "docker"
date: 2018-11-08 9:13:00
updated: 2018-11-08 9:13:00
---

### 1.保存修改的容器至镜像。
``` Bash
docker commit {id 前3位即可} your/name
docker save -o 要保存的文件名  要保存的镜像
```
### 2.加载镜像命令
``` Bash
docker load < filename 
```
### 3.加载镜像之后 便可以通过加载的镜像创建容器并进入容器


