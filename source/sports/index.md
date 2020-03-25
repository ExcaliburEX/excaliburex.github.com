---
title: "跑步日记"
date: 2018-04-12 21:52:09 +0800
categories: Life
tags: running
---

&ensp;
<style type="text/css">
	main#main.main{
		margin-top: -95px
	}
	.posts-expand .post-body img{
		padding: 1px;
	}

	.footer{
		display: none !important;
	}

	.post-block .page{
		width: 100%;
		color: #000000;
		background: #000000
	}
 	/*不展示底部*/
 	.footer-inner{
 		display: none !important;
 	}

	.v * {
    	color: #f4f4f4 !important;
	}

	.v .vwrap .vmark .valert .vcode {
    	background: #00050b !important;
	}

 	/*不展示侧栏*/
 	.sidebar{
 		display:none !important;
		 z-index:-1;
 	}


    +mobile() {
        width: 100%;
    }
	}


	.container .main-inner {
    width: 200%;
	
    +tablet() {
        width: 100%;
    }
    +mobile() {
        width: 100%;
    }
}

	.posts-block{
		position:inherit;
		width: 100%;
		margin-top: unset;

	}
    /*修改相册页面内容宽度为全屏*/
	.main-inner{
		width: 100%;
		margin-top: unset;
	}

	/*修改主体页面样式*/
	.main {
    	padding-bottom: 150px;
    	margin-top: 0px;
    	background: #121212;
	}

	/*body体样式*/
	body {
		background-image: unset;
		background-attachment: unset;
		background-size: 100%;
	}

	.header{
		background: rgba(28, 25, 25, 0.6);
		border-bottom: unset;
	}

	.menu .menu-item a{
		font-weight: 300;
   		color: #222;
	}

    .imgbox{
	  width: 100%;
	  overflow: hidden;
	  border-right: 0px solid #bcbcbc;
    }

	.box{
		visibility: visible;
		overflow: auto; 
		zoom: 1;
	}

	.box li{
		float: left;
    	width: 25%;  /*每个框占25%*/
    	position: relative;
    	overflow: hidden;
    	text-align: center;
    	list-style: none;
    	margin: 0;
    	/*display: inline;*/
    	padding: 0;
    	height: 400px;   /*固定高度*/
	}

	.box li span{
		display: block;
    	padding: 4% 7% 10% 7%;
    	min-height: 80px;
    	background: #fff;
    	color: #fff;
    	font-size: 16px;
    	background: #121212;
    	font-weight: 600;
    	line-height: 26px;
    	-webkit-box-sizing: border-box;
    	box-sizing: border-box;
	}

    img.imgitem{
		padding: unset;
		padding: unset;
		border: unset;
		position: relative;
		padding: 0px;
		width: 100%;
		height: 350px;
	}
    iframe.imgitem{
        width:480px !important;
         height:300px !important;
         padding: 0px;
    }
	div#comments.comments.v {
    	border: 0px;
    	margin: auto !important;
    	margin-top: unset;
    	margin-left: unset;
    	margin-right: unset;
    	width: 40%!important;
    	padding-top: 50px;
	}

	div#posts.posts-expand {
    	border: unset;
    	padding: unset;
    	margin-bottom: 10px;
	}

	.valine .vlist .vcard .vcomment-body .vhead .vname{
		color: #fff;
	}
	div#comments.comments.v{
			  width: 50%!important;
	  overflow: hidden;
	  border-right: 0px solid #bcbcbc;
	}

	.valine .vlist .vcard .vcomment-body .text-wrapper .vcomment p{
		width: 50%!important;
		color: #fff;
	}

	.box p{
		display: block;
    	background: #121212;
    	color: #fff;
    	font-size: 12px;
    	font-family: 'SwisMedium';
    	text-align: center;
	}

	.box span strong{
		background: rgba(0,0,0,0.4);
		padding: 20px;
		font-family: serif, sans-serif;
	}

	.posts-expand .post-title {
		display: none;
	}
	.title{
    	display: inline-block;
    	vertical-align: middle;
    	font: 85px/250px 'ChaletComprimeMilanSixty';
    	background-position: left bottom !important;
    	color: #fff;
    	background-size: 100% auto !important; 
		-webkit-background-size: cover; 
		-moz-background-size: cover;
		-o-background-size: cover;
    	width: 100%;
    	text-align: center;
    	border: unset;
    	height: 700px;
    	cursor: unset !important;
    	-webkit-box-sizing: border-box;
    	/*box-sizing: border-box;*/
	}
	.btn-more-posts{
		display: inline-block;
    	vertical-align: middle;
    	font: 85px/250px 'ChaletComprimeMilanSixty';
    	color: #000;
    	width: 100%;
    	text-align: center;
    	border: unset;
    	height: 400px;
    	background-color: #121212;
    	/*-webkit-box-sizing: border-box;*/
    	/*box-sizing: border-box;*/
	}
	div#comments.comments.valine{
		margin-left: 8px;
		width: 98%!important;
	}

@media (max-width: 767px){
	.box li {
    	width: 100%;
    	height: auto;
	}
	.title {
    	height: 200px;
	}

	.posts-expand .post-body img{
		box-sizing: none;
		padding: 0px !important;
	}

	.box span {
    	min-height: 80px;
    	border-right: unset;
    	font-size: 17px;
	}
	.box p{
    	border-right: unset;
    	font-size: 12px;
	}

	.posts-expand {
    	margin: unset;
	}
	div#comments.comments.v {
    	width: 96%;
    	padding-top: 50px;
	}
}

@media (min-width: 1300px){
	.container .main-inner{
		width: 100%;
	}
}

</style>

<!-- <font color=white>主体部分 -->
<div id="box" class="box"></div>

<script type="text/javascript">

function loadXMLDoc(xmlUrl) 
{
	try //Internet Explorer
	{
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
	}
	catch(e)
	{
	  try //Firefox, Mozilla, Opera, etc.
	    {
		  xmlDoc=document.implementation.createDocument("","",null);
	    }
	  catch(e) {alert(e.message)}
	}
	
	try 
	{
		  xmlDoc.async=false;
		  xmlDoc.load(xmlUrl);
	}
	catch(e) {
		try //Google Chrome  
		  {  
			var chromeXml = new XMLHttpRequest();
			chromeXml.open("GET", xmlUrl, false);
			chromeXml.send(null);
			xmlDoc = chromeXml.responseXML.documentElement; 				
			//alert(xmlDoc.childNodes[0].nodeName);
			//return xmlDoc;    
		  }  
		  catch(e)  
		  {  
			  alert(e.message)  
		  }  		  	
	}
	return xmlDoc; 
}

xmlDoc=loadXMLDoc("https://sport-1259799643.cos.ap-shanghai.myqcloud.com");

var urls = xmlDoc.getElementsByTagName('Key');
var date = xmlDoc.getElementsByTagName('LastModified');
var wid = 350;
var showNum = 21; //每个相册一次展示多少照片
if ((window.innerWidth) > 1200) { wid = (window.innerWidth * 3) / 18;}
var box = document.getElementById('box');
var i = 0;

var content = new Array();
var tmp=0;
var kkk=-1;
for (var t = 0; t < urls.length ; t++) {
	var bucket=urls[t].innerHTML;
	var length=bucket.indexOf('/');
	if(length===bucket.length-1){
		kkk++;
		content[kkk]=new Array();
		content[kkk][0]={'url':bucket,'date':date[t].innerHTML.substring(0,10)};
		tmp=1;
	}
	else {
		content[kkk][tmp++]={'url':bucket.substring(length+1),'date':date[t].innerHTML.substring(0,10)};
	}
}

for (var i = 0; i < content.length; i++) {

	var conBox=document.createElement("div");
	conBox.id='conBox'+i;
	box.appendChild(conBox);
	var item=document.createElement("div");
	var title=content[i][0].url;
	item.innerHTML="<button class=title style=background:url(https://sport-1259799643.cos.ap-shanghai.myqcloud.com/" + title + "封面.jpg"+");background-repeat:no-repeat;><span style=display:inline;><strong style=color:#f0f3f6; >" + title.substring(0,title.length - 1) + "</strong></span></button>";
	conBox.appendChild(item);

        for (var j = 1; j < content[i].length && j < showNum+1; j++) {
	        var con=content[i][j].url;
		var item=document.createElement("li");
		if(con.substring(0,con.length-4) != "封面"){
			item.innerHTML="<div class=imgbox id=imgbox style=height:"+wid+"px;><iframe class=imgitem src=https://sport-1259799643.cos.ap-shanghai.myqcloud.com/" + title + con +" alt=" + con + "></div><span>" + con.substring(0,con.length-4);
			conBox.appendChild(item);
		}
	}
	if(content[i].length > showNum){
		var moreItem=document.createElement("button");
		moreItem.className = "btn-more-posts";
		moreItem.id = "more" + i;
		moreItem.value = showNum + 1;
		let cur = i;
		moreItem.onclick = function (){
			moreClick(this,cur,content[cur],content[cur][0].url);
		}
		moreItem.innerHTML="<span style=display:inline;><strong style=color:#f0f3f6;>加载更多</strong></span>";
		conBox.appendChild(moreItem);
	}
}

function moreClick(obj,cur,cont,title){
	var parent = obj.parentNode;
	parent.removeChild(obj);
	var j=obj.value;
	var begin=j;
	for ( ; j < cont.length && j < Number(showNum) + Number(begin); j++) {
		var con=cont[j].url;
		var item=document.createElement("li");	
		item.innerHTML="<div class=imgbox id=imgbox style=height:"+wid+"px;><iframe class=imgitem src="+xmllink+'/'+title+con+"  alt="+con+"></div><span>"+con.substring(0,con.length-4)+"</span><p>上传于"+cont[j].date+"</p>";
		parent.appendChild(item);
		var v=item.getElementsByTagName('iframe');
		v[0].id=imgid;
		imgid++;
	}
	if(cont.length > j){
		obj.value=j;
		parent.appendChild(obj);
	}
}
</script>




# <font color=white>2017</font>
- <font color=white>10.13 8圈。</font>
- <font color=white>10.14 7圈。</font>
- <font color=white>10.22 8圈。</font>
- <font color=white>10.24 8圈。</font>
- <font color=white>10.31 10圈。</font>
- <font color=white>11.1 10圈。</font>
- <font color=white>11.2 10圈。</font>
- <font color=white>11.6 10圈。</font>
- <font color=white>11.8 11圈。</font>
- <font color=white>11.9 11圈。</font>
- <font color=white>11.16 11圈。</font>
- <font color=white>11.31 10圈。</font>
- <font color=white>12.4 10圈。</font>
- <font color=white>12.5 10圈。</font>

# <font color=white>2018</font>
- <font color=white>3.25 9圈。</font>
- <font color=white>3.26 10圈。</font>
- <font color=white>3.28 10圈。</font>
- <font color=white>4.2 10圈。</font>
- <font color=white>4.9 10圈。</font>
- <font color=white>4.11 9圈。</font>

## <font color=white>11.8</font>
![](https://i.loli.net/2017/12/09/5a2b7004279b6.png)
## <font color=white>11.9</font>

![](https://i.loli.net/2017/11/09/5a04662d39261.jpg)

## <font color=white>11.16</font>
![](https://i.loli.net/2017/12/09/5a2b7004279b6.png)

## <font color=white>11.30</font>
![](https://i.loli.net/2017/12/09/5a2b7024517c4.png)

## <font color=white>12.4</font>

![](https://i.loli.net/2017/12/09/5a2b7049f4195.png)

## <font color=white>12.5</font>
![](https://i.loli.net/2017/12/09/5a2b707d1a0cc.png)

## <font color=white>2018.3.28</font>
![](https://i.loli.net/2018/04/12/5ace342dbd4ad.png)
## <font color=white>2018.4.2</font>

![](https://i.loli.net/2018/04/12/5ace3474d1adc.png)

## <font color=white>2018.4.9</font>
![](https://i.loli.net/2018/04/12/5ace34a1bb8f1.jpg)

## <font color=white>2018.4.11</font>
![](https://i.loli.net/2018/04/12/5ace34c0a2e58.jpg)
