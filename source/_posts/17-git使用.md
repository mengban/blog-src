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

