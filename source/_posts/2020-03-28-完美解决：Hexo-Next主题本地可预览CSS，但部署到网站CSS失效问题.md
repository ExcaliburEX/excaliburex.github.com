---
layout: post
title: 完美解决：Hexo Next主题本地可预览CSS，但部署到网站CSS失效问题!
date: 2020-03-28 16:19:05
tags:
    - Hexo
    - css
    - 博客
    - Next
    - custom
categories: 博客
mathjax: true
keywords: 
    - Hexo
    - css
    - 博客
    - Next
    - custom
image: "https://blog-1259799643.cos.ap-shanghai.myqcloud.com/photo-1585255318859-f5c15f4cffe9.jpg"
---


非常折磨人，好在我暂时解决它了。😂
<!-- more -->


<style>
code {
    color: #FF1493 !important;
    font-weight: 800 !important;
}
</style>
# 🌟 前言
&emsp;&emsp;我的<font color = #D2691E>`Hexo`</font>版本是<font color = #D2691E>`3.9.0`</font>，<font color = #D2691E>`Next`</font>主题版本是<font color = #D2691E>`7.5`</font>版本，也就是移除了<font color = #D2691E>`custom`</font>文件的神奇的跨时代的版本。
&emsp;&emsp;我的服务器不是<font color = #D2691E>`github-page`</font>，而是阿里云的<font color = #D2691E>`ECS`</font>服务器，关于如何将<font color = #D2691E>`Hexo`</font>从<font color = #D2691E>`github-page`</font>迁移到阿里云的<font color = #D2691E>`ECS`</font>服务器请看这篇文章：[将博客部署到阿里云服务器上](https://bestzuo.cn/posts/fb6b5822.html)。

&emsp;&emsp;当然一开始觉得这个版本好搓卡，本来想改改样式，不会<font color = #D2691E>`CSS`</font>，上网搜搜就有很多改<font color = #D2691E>`custom`</font>文件的文章，复制复制就可以改成很好看的样式，这下好了，一移除就全部失效了。

&emsp;&emsp;其实不然，在与<font color = #D2691E>`Next`</font>的大坑中摸爬滚打了很久后，

&emsp;&emsp;发现，你可以在<font color = #D2691E>`themes/next/source/css/main.styl`</font>中最后加上一句：
```css
@import "_custom/custom";
```
&emsp;&emsp;然后再在<font color = #D2691E>`themes/next/source/css`</font>目录下新建<font color = #D2691E>`_custom`</font>文件夹，再进去新建<font color = #D2691E>`custom.styl`</font>文件，将网上搜罗到的<font color = #D2691E>`Next`</font>主题的文件都粘贴进去，就可以在本地预览这些新添加的样式了。

&emsp;&emsp;:ok_woman:当然你也许不需要这么麻烦的操作，你甚至可以在<font color = #D2691E>`themes/next/source/css`</font>文件夹中的任何一个`.styl`</font>文件添加你想要的<font color = #D2691E>`css`</font>样式代码都可以在本地预览中生效。

&emsp;&emsp;我想其中的原因在于：主题调用的文件主要来自于<font color = #D2691E>`themes/next/source/css/main.styl`</font>，而这个文件里面全是<font color = #D2691E>`import`</font>语句，即将所有的<font color = #D2691E>`css`</font>文件<font color = #D2691E>`import`</font>进来，也就意味着最后生成的整体的<font color = #D2691E>`main.css`</font>文件不过是将所有的<font color = #D2691E>`css`</font>分文件中的语句按顺序排列罢了，所以你加在哪个文件改变的不过是最后的<font color = #D2691E>`main.css`</font>的语句顺序罢了，但是其提供的效果依然生效。但为了日后修改方便，还是建议找对应的位置添加。

# 1️⃣ 问题陈述
&emsp;&emsp;前言中我也提到了“本地预览生效”的话，意味着，你大可自己定义<font color = #D2691E>`css`</font>样式，也可以将网上的内容复制粘贴，但有一点非常头疼，那就是大多数情况下，你只能成功地进行本地预览，而一旦<font color = #D2691E>`deploy`</font>到服务器上要么就是完全无效，要么就是稀奇古怪，甚至有时候你即使将整个<font color = #D2691E>`/css`</font>文件夹删除，发现<font color = #D2691E>`deploy`</font>后的网站样式完全没有变化。:cry:

&emsp;&emsp;紧接着通过在部署后的页面以及本地预览的页面分别进行<font color = #D2691E>`F12`</font>调试，逐一对比，终于发现了不一样的地方。本地预览时调试页面的<font color = #D2691E>`/css`</font>的文件下的文件名为<font color = #D2691E>`main.css`</font>就跟<font color = #D2691E>`hexo g`</font>生成在<font color = #D2691E>`/public`</font>文件夹下是一模一样的，但是到了部署页面中这个文件名就变为了<font color = #D2691E>`main.css?v=7.3.0`</font>，这多出来的<font color = #D2691E>`?v=7.3.0`</font>百思不得其解。再看看<font color = #D2691E>`main.css`</font>中的文件内容跟我pc里面的<font color = #D2691E>`/public/css/main.css`</font>里面的东西一模一样，但是<font color = #D2691E>`main.css?v=7.3.0`</font>里面莫名其妙的少了几百行，原以为是<font color = #D2691E>`hexo deploy`</font>命令部署的不全，漏了东西，但上阿里云的服务器文件夹里面一看内容跟我本地的一样。并且当我将<font color = #D2691E>`main.css`</font>里面的东西复制到<font color = #D2691E>`main.css?v=7.3.0`</font>时，我想要的部署的页面就跟我本地预览终于一样了，虽然刷新一下就没了，毕竟是网页调试。

&emsp;&emsp;那么问题就很清楚了，就是这个<font color = #D2691E>`main.css?v=7.3.0`</font>并不放在服务器端，调用的源头也并不明朗，而且是无法更改的，所以得想办法让部署的页面加载<font color = #D2691E>`main.css`</font>而不是<font color = #D2691E>`main.css?v=7.3.0`</font>。

# 2️⃣ 问题解决
&emsp;&emsp;既然知道问题出在哪里就很简单了，费了一番功夫，终于发现在<font color = #D2691E>`themes/next/layout/_partials/head/head.swig`</font>文件中，有一行语句是这样的：

```css
 &#60link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css?v={{ version }}"&#62
```
&emsp;&emsp;很明显之前多出来的<font color = #D2691E>`?v=7.3.0`</font>就是出自于这里的<font color = #D2691E>`?v={{ version }}`</font>，所以就把这里的<font color = #D2691E>`?v={{ version }}`</font>删除，就可以了。

然后再<font color = #D2691E>`hexo clean && hexo g && hexo d`</font>，查看部署端页面，样式齐全完美！问题解决。:thumbsup::thumbsup::thumbsup:

# 3️⃣ 一些缺点
&emsp;&emsp;这个方法可以完美地解决问题本身，而且绝对不会再出现本地预览与部署端不一样的问题，但是会出现副作用。

&emsp;&emsp;当我以为终于可以愉快地肆无忌惮地玩耍时，又发现一个新的问题。就是我又再次改造了<font color = #D2691E>`css`</font>样式，即在<font color = #D2691E>`/_custom/custom`</font>文件中加入了一些样式，再<font color = #D2691E>`hexo d`</font>发现样式没有变化。再调试发现问题，<font color = #D2691E>`main.css`</font>文件没有变化。思考一下，猜测这个原因应该跟<font color = #D2691E>`main.css?v=7.3.0`</font>问题是一样的，它本身是不可更改的，即使再<font color = #D2691E>`hexo d`</font>新的<font color = #D2691E>`css`</font>文件，其本身不会变化。

&emsp;&emsp;问题的解决方法就是将<font color = #D2691E>`themes/next/layout/_partials/head/head.swig`</font>中的
```diff
- &#60link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css"&#62
+ &#60link rel="stylesheet" href="{{ url_for(theme.css) }}/main1.css"&#62
```
&emsp;&emsp;也就是改成其他名字<font color = #D2691E>`main1`</font>也好<font color = #D2691E>`main2`</font>也好，就是改成跟原来不用的名字。然后继续<font color = #D2691E>`hexo g`</font>就会将生成的那些博客文章页面里面的引用的<font color = #D2691E>`css`</font>文件名改为<font color = #D2691E>`main1.css`</font>文件。

&emsp;&emsp;同时还要将<font color = #D2691E>`/public/css`</font>中的<font color = #D2691E>`main.css`</font>改为<font color = #D2691E>`main1.css`</font>，最后<font color = #D2691E>`hexo d`</font>，发现改动的<font color = #D2691E>`css`</font>样式也生效了。

&emsp;&emsp;当然这也就意味着，以后每次改动<font color = #D2691E>`css`</font>样式，都要将<font color = #D2691E>`main.css`</font>改成新的名字，如<font color = #D2691E>`main2.css`、`main3.css`</font>......。

&emsp;&emsp;建议<font color = #D2691E>`hexo clean && hexo g && hexo d`</font>之前，先备份一下<font color = #D2691E>`/public`</font>文件夹，保留可以回退版本的可能。

&emsp;&emsp;所以建议要么不改<font color = #D2691E>`css`</font>，要么一次性改全。毕竟写<font color = #D2691E>`Hexo`</font>博客，重要的不是好看，而是内容，不是嘛？:wink:

# 4️⃣ 总结
1. 删除<font color = #D2691E>`themes/next/layout/_partials/head/head.swig`</font>中的<font color = #D2691E>`main.css?v={{ version }}`</font>后面的<font color = #D2691E>`?v={{ version }}`</font>
2. 每次修改<font color = #D2691E>`css`</font>后，<font color = #D2691E>`hexo d`</font>之前，改造<font color = #D2691E>`themes/next/layout/_partials/head/head.swig`</font>中的<font color = #D2691E>`main.css`</font>的名字，如<font color = #D2691E>`main2.css`、`main3.css`</font>......。
3. 建议<font color = #D2691E>`hexo clean && hexo g && hexo d`</font>之前，先备份一下<font color = #D2691E>`/public`</font>文件夹，保留可以回退版本的可能。
