---
title: TCP/UDP 共占同一端口
tags: 
	- 计算机网络
	- TCP/UDP
categories: "计算机网络"
date: 2018-12-10 09:50:00
updated: 2018-12-10 09:50:00
---
## TCP/UDP 共用端口问题。
### 1.TCP UDP 可以共同占用一个端口号吗?
> 首先明确一点 端口是一种抽象的软件结构（包括一些数据结构和I/O缓冲区）。
应用程序（即进程）通过系统调用与某端口建立连接（binding）后，传输层传给该端口的数据都被相应进程所接收，相应进程发给传输层的数据都通过该端口输出。在TCP/IP协议的实现中，端口操作类似于一般的I/O操作，进程获取一个端口，相当于获取本地唯一的I/O文件，可以用一般的读写原语访问之。 
类似于文件描述符，每个端口都拥有一个叫端口号（port   number）的整数型标识符，用于区别不同端口。由于TCP/IP传输层的两个协议TCP和UDP是完全独立的两个软件模块，因此各自的端口号也相互独立，如TCP有一个255号端口，UDP也可以有一个255号端口，二者并不冲突。 

### 2.为什么一个80端口可以建立很多连接?

一个TCP连接需要由四元组来形成，即(src_ip,src_port,dst_ip,dst_port)。假设有客户端建立了连接(src_ip1,src_port1,dst_ip1,dst_port1)，那么，如果我们还有listen在(src_ip1,src_port1)，那么当(dst_ip1,dst_port1)发送消息过来，系统应该把消息给谁？所以就说明了客户端占用了某一端口时，该端口就不能被其它进程listen了。

那么，对于有些童鞋，可能还有这样的疑问，是否一台机器就只能建立65535个连接了（端口16位限制）？非也，一个连接由四元组(src_ip,src_port,dst_ip,dst_port)形式，那么当(src_ip,src_port)一定时，变化的(dst_ip,dst_port)就可以建立更多连接了。
所以一台机器可以建立**最多65535个连接是大错特错的**。所有的一切都可以用四元组原理来分析即：**一个TCP连接需要由四元组来形成，即(src_ip,src_port,dst_ip,dst_port),只要四个元素的组合中有一个元素不一样，那就可以区别不同的连接**。

### 3.承接2问 为什么还会出现端口被占的情况？？

这个问题问的好。默认情况下 一个网络应用程序的套接字绑定了一个端口 这时候别的套接字就无法使用这个端口。这个就是为什么我们实际应用过程中经常会出现 端口已经被使用的情况。

但是 在实际网络编程过程中，socket有一个 SO_REUSEADDR 选项。该选项可以用在以下四种情况下。 (摘自《Unix网络编程》卷一，即UNPv1)

>1、当有一个有相同本地地址和端口的socket1处于TIME_WAIT状态时，而你启动的程序的socket2要占用该地址和端口，你的程序就要用到该选项。
2、SO_REUSEADDR允许同一port上启动同一服务器的多个实例(多个进程)。但每个实例绑定的IP地址是不能相同的。在有多块网卡或用IP Alias技术的机器可以测试这种情况。
3、SO_REUSEADDR允许单个进程绑定相同的端口到多个socket上，但每个socket绑定的ip地址不同。这和2很相似，区别请看UNPv1。
4、SO_REUSEADDR允许完全相同的地址和端口的重复绑定。但这只用于UDP的多播，不用于TCP。




