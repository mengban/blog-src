---
title: python字符串相关操作
tags: 
	- momenta
	- 实习
categories: "心路"
date: 2018-10-06 11:08:00
updated: 2018-08-16 14:06:00
---

## Momenta World Cup比赛小结

### 北京时间2018.08.07 20:07

刚从五道口吃饭回来，到今天，二十多天的Momenta无人车足球赛算是告一段落，论文明天再写，先写此文做个小总结。
此次比赛规则很简单：类似于世界杯，双方各执一车，上下半场各20分钟，进球多者为胜者。
比赛物力&人力：
* turtlebot3智能小车一台
* 运算平台: 树莓派*2
* 传感器：camera*2
* 控制器与电机
* 其他结构部件
* 数据集：带标签图片10W张
* 算力：每组TITANX * 8
* 队友：程煜钧-北交博三 冯昊-清华大二 余唯民-清华大三 闫坤-北航大二 本人-北邮研一
我扮演角色：类似酱油
比赛结果：第五名
---

### 收获及感想：

>**1. 关于Momenta**
这家公司真的技术好牛逼。
这家公司的Mentor真的好年轻。
这家公司真的好人性化。
这家公司福利真的好。
Dinner talker 分别见到了创始人旭东 Faster-RCNN作者 少卿。
旭东很年轻，但是有这个年龄不该有的深邃，无论是言谈与对话上。
少卿腼腆，书生气质很重。说话比较轻 谈起NN比较话多。
各种Mentor 其中底层至芯片代码，应用至NN的大牛 与我同龄。
拿过各种机器学习的冠军的李翔  比我大三年而已，问其本科事迹，10年已经在玩AI。那时我在写51。
总之 Momenta人才年轻 很有创造力 假以时日 定能执国内无人驾驶行业牛耳。

>**2. 关于自己**
好菜。
真的好菜。
这次比赛，队里代码主要由低年级的小兄弟写的，我就在旁边给点how to的建议，想起自己大二那年全国电赛写无人机C代码了场景了，非常类似。
小兄弟们码力很强，至少比同时的我强。也让我认识到自己码力的不足，我比他们大三届啊 这三年我写都了啥代码？为何码力长进这么差？
这次深刻认识到了自己的不足之处 同龄的他们已经在Momenta做Mentor了 而我还在搬着砖。

>**3. 关于未来：**
就要研二了，研三就要实习。充电时间就剩一年，到时如何让把自己卖出一个好价钱是个大问题。
研二Todolist：
>1. 刷算法。Java Python。提高码力。
>2. 刷Linux。熟悉生产环境。
>3. 多写blog 多做总结。
>4. 认真做事。每一件小事。
>5. 多刷leetcodee 年入百万。。。
>6. 看书。
                             
![xx](http://wx2.sinaimg.cn/mw690/005B3ViFly1fua81aaagsj30hr0ffjru.jpg) 

### 先这样吧

``` C {.line-numbers}
#define TRUE FALSE
```

