---
title: 热门文章 
date: 2019-08-06 16:36:32
comments: false
keywords: 
  - top
  - 文章阅读量排行榜
description: 博客文章阅读量排行榜
---
&ensp;
<style>

div#top{
   margin-top: 80px;
   margin-bottom: 100px;
   padding: 25px;
   border: 1px solid #fff;
   /*-webkit-border-radius: 8px;*/
   /*-moz-border-radius: 8px;*/
   border-radius: 3px;
   -webkit-box-shadow: #666 0px 0px 10px;
   -moz-box-shadow: #666 0px 0px 10px;
   box-shadow: #666 0px 0px 10px;
   background: rgba(243, 242, 238, 1);
   /*background: #fff;*/
   behavior: url(/images/PIE.htc);
   /*border: 1px solid rgba(128, 128, 128, 0.4);*/
/*   border-left: 1px solid darkgray;
   border-right: 1px solid darkgray;*/
   /*rgba(128, 128, 128, 0.4)*/
     
</style>



<div id="top"></div>
<script src="https://cdn1.lncld.net/static/js/av-core-mini-0.6.4.js"></script>
<script>AV.initialize("u4vO2zGHJKiMhlMhYbgBgq1E-gzGzoHsz", "XRdJWVzmRfYF0uw6oUQztM7B");</script>
<script type="text/javascript">
  var time=0
  var title=""
  var url=""
  var query = new AV.Query('Counter');
  query.notEqualTo('id',0);
  query.descending('time');
  query.limit(15);
  query.find().then(function (todo) {
    for (var i=0;i<15;i++){
      var result=todo[i].attributes;
      time=result.time;
      title=result.title;
      url=result.url;
      var content="<p>"+"<font color='#1C1C1C'>"+"【文章热度:"+time+"℃】"+"</font>"+"<a href='"+"https://kemo.xyz"+url+"'>"+title+"</a>"+"</p>";
      document.getElementById("top").innerHTML+=content
    }
  }, function (error) {
    console.log("error");
  });
</script>