---
title: 在本地VMware的Ubuntu，腾讯云CVM以及阿里云的ECS中搭建IPFS私有网络
date: 2020-09-02 17:02:29
tags:
    - Ubuntu
    - Linux
    - Xshell
    - CVM
    - ECS
    - 虚拟机
    - IPFS
    - 私有网络
categories: Ubuntu
mathjax: true
image: "https://i.loli.net/2020/09/02/RCQMNybPunzY8AS.png"
---


IPFS三部曲，之三。
<!-- more -->


# 0️⃣ 前言
- 连接**腾讯云CVM**，以及**阿里云ECS**可以用**FinalShell**或者**Xshell**，用**Xshell**的教程在这里[保姆级教程——Xshell连接虚拟机中的Ubuntu并通过Xftp传输文件](https://blog.csdn.net/ExcaliburUlimited/article/details/107718611)，连接本地Ubuntu和云端服务器步骤是一样的，只是ip输入的是公网ip。

- 在连接完毕后就可以进行后面的操作。

- 查看三个节点机器的IP地址：
	1. VMware中Ubuntu18.04的IP，即运行
   
		```bash
		ifconfig
		```
		得到
		
		![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806175530875.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)

		这里的`192.168.3.105`便是。

	2. 腾讯云CVM

		![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806175640292.png)
	
		需要用到的就是这里的公网ip：`129.211.103.82`。

	3. 阿里云ECS

		![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806175729830.png)

		需要用到的就是这里的公网ip：`47.96.189.80`。
	
# 1️⃣ 安装`IPFS`
具体请看这篇文章：[一文完全解决——Ubuntu20.04下源码构建安装IPFS环境](https://blog.csdn.net/ExcaliburUlimited/article/details/107717905)
在最后运行：

```bash
ipfs init
```
注意一下输出信息：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806174837562.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
也就是这里生成的`.ipfs`文件在什么位置，不记得可以再运行一遍`ipfs init`即可，这个位置后面要用到。

# 2️⃣ 生成共享Key
- 因为我们要组建的是私有网络，所有节点需要使用相同的**私有key**来加入网络中，我们使用`go-ipfs-swarm-key-gen`工具来生成共享key。我准备把本地的VMware的Ubuntu作为主运行节点，所以在这台Ubuntu上运行如下命令：

```bash
#编译工具
go get github.com/Kubuxu/go-ipfs-swarm-key-gen/ipfs-swarm-key-gen
cd $GOPATH
cd src/github.com/Kubuxu/go-ipfs-swarm-key-gen/ipfs-swarm-key-gen/
go build
# 生成key
./ipfs-swarm-key-gen > /home/excalibur/.ipfs/swarm.key
```
然后分别运行：
- 对腾讯云服务器：
```bash
# 将本地生成的key拷贝到腾讯云服务器上的相同目录下
scp /home/excalibur/.ipfs/swarm.key 192.168.3.105:/home/ubuntu/.ipfs/
```
- 对阿里云服务器：
```bash
# 将本地生成的key拷贝到阿里云服务器上的相同目录下
scp /home/excalibur/.ipfs/swarm.key 47.96.189.80:/root/.ipfs/
```
- 这里有三点需要注意：
	1.  `/home/excalibur/.ipfs/swarm.key`这里面的`/home/excalibur/.ipfs/`是我的`ipfs`配置文件夹，你应该根据自己的位置修改，也就是之前提到的那个目录。
	2. `47.96.189.80:/root/.ipfs/`，这里面前面的`ip`地址要根据你服务器的修改，并且后面的`/root/.ipfs/`也要根据你服务器上的`ipfs`文件夹修改，可以运行`ipfs init`进行查看。
	3. 如果遇到密码输入正确，然而出现`Permissioned denied`的情况，就输入`su`进入管理员模式，重新运行上面两个`scp`命令。

# 3️⃣ 移除默认的`boostrap`节点
- 因为要运行在私有网络上，不进入公网，必须删除其他启动节点信息。在三个节点上分别运行如下命令：

```bash
ipfs bootstrap rm --all
```
# 4️⃣ 添加启动`boostrap`节点信息
- 这里以本地Ubuntu为启动节点，首先在本地节点运行如下命令：

```bash
ipfs id
```
得到：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806192317965.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)

我们需要这里的`hash`值：`QmTADgGT4MaCd3aTpD4vweGLQdWhr8oH8sue43DDioWBXA`，然后再加上之前的本地节点的ip地址：`192.168.3.105`，就得到了所有需要的`bootstrap`信息，然后分别在两台云服务器上运行如下命令：

```bash
ipfs bootstrap add /ip4/192.168.3.105/tcp/4001/ipfs/QmTADgGT4MaCd3aTpD4vweGLQdWhr8oH8sue43DDioWBXA
```
即可将本地节点作为它们的启动节点，自动加入`ipfs`网络。

# 5️⃣ 查看启动状态
- 分别在三个节点上运行：

```bash
ipfs daemon
```
- 然后在任意节点上运行：

```bash
ipfs swarm peers
```
将看到其他网络内节点的运行信息，我这里是在本地Ubuntu上运行的命令，可以看到腾讯云服务器的节点信息，但是阿里云不在😅。
原因在于ECS的安全组设置：打开阿里云服务器设置，首先`网络与安全组`，然后`安全组配置`，然后`配置规则`，`手动添加`三个端口，分别是4001,5001，以及8080，最后ip地址可以是本地Ubuntu地址，或者直接设置成`0.0.0.0/0`。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806212017943.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806192835742.png)
- 也可以运行：

```bash
ipfs stats bitswap
```
可以看到
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806193239567.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0V4Y2FsaWJ1clVsaW1pdGVk,size_16,color_FFFFFF,t_70)
这里的`partners`字段为1，说明当前网络有2个节点。

# 6️⃣ 上传下载测试

- 在本地节点上传一个文件：

```bash
echo helloworld > hello.txt
ipfs add hello.txt 
```
得到：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806193616983.png)
- 可以在云服务器节点查看下载这个文件：

```bash
ipfs cat QmUU2HcUBVSXkfWPUc3WUSeCMrWWeEJTuAgR9uyWBhh9Nf
ipfs get QmUU2HcUBVSXkfWPUc3WUSeCMrWWeEJTuAgR9uyWBhh9Nf
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200806193752298.png)

可见，就很纳爱斯！😁😁😁