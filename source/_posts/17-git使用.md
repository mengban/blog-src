---
title: git的使用
tags: 
	- git
	- 开源
categories: "Git"
date: 2018-11-05 9:13:00
updated: 2018-11-05 9:13:00
---

### 1.如何参与开源项目
- 1.开通自己github账户，在PC端安装git环境。
- 2.fork开源项目到仓库。
- 3.clone远程forked项目到本地。
- 4.添加上游
- 5.同步远程原始项目到本地
``` Bash
git fetch upstream
```

- 6.合并项目。
``` Bash
git merge upstream/master
```
- 7.接下来正常add commit即可。

### 2.不小心添加了过大文件
如果不小心添加了过大文件到暂存区，无论是删除本地文件还是修改.gitingnore文件都是比较棘手的。
比较简单的做法是：
 - 1. git log查看commit日志
 - 2. git reset XXX 重装到某一提交状态。其中XXX为你某次提交的唯一ID如
 commit aa534e5ae59ac5b0df1e20dde8409c2f5d32b015，可以通过git log看到。只需输入前四位即可完成reset。
 然后只需正常输出 git add commit push等命令。  