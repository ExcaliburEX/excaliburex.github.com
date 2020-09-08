---
title: 保姆级教程Xshell连接虚拟机中的Ubuntu并通过Xftp传输文件
date: 2020-09-02 16:49:16
tags:
    - Ubuntu
    - Linux
    - Xshell
    - Xftp
    - 虚拟机
    - SSH
categories: Ubuntu
mathjax: true
image: "https://i.loli.net/2020/09/02/M1bvOVt2CrPXksD.jpg"
---

IPFS三部曲，之一。
<!-- more -->

# :one: 虚拟机设置
虚拟机——> 设置 ——>网络适配器——> 桥接模式
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731175055796.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)

# :two: 查看ip地址
首先安装`net-tools`(如已安装忽略)，然后用`ifconfig`查看ip地址。命令如下：

```bash
sudo apt install net-tools
ifconfig
```
下图红框中就是我们后面需要的ip地址：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731175901492.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
# :three: 查看`ssh`状态
首先检测`ssh`的状态：

```bash
ps -e | grep ssh
```
没有看到`sshd`就说明未启动，选择下面的一种方式手动启动就好了:

```bash
sudo service sshd start
sudo /etc/init.d/ssh start
```
如果没安装，就直接安装，安装完毕会自动启动：

```bash
sudo apt install openssh-server
```
# :four: 启动`Xshell`进行连接
- 首先输入名称和前文的`inet`后面的`ip`地址：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731180421630.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
- 然后在用户身份验证中，输入用户名和密码，用户名的获取方法是：

```bash
who
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731180949407.png)
我这里，就是：`excalibur`，密码就是`sudo`的密码。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731180838106.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
- 设置完成后，直接连接即可。
# :five: 大功告成
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200731181130563.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
右键连接，用`Xftp`打开，可以通过`Xftp`进行文件传输：
![在这里插入图片描述](https://img-blog.csdnimg.cn/202007311813318.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
直接把左面的主机的文件往虚拟机里面拖就行了。