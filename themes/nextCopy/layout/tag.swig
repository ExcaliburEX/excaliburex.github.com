{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.tag') }}: {{ page.tag }} | {{ title }}{% endblock %}

{% block content %}

  {#################}
  {### TAG BLOCK ###}
  {#################}
  <div class="post-block tag">

    <div id="posts" class="posts-collapse">
      <div class="collection-title">
        <{%- if theme.seo %}h2{% else %}h1{%- endif %}>{#
        #}{{ page.tag }}{#
        #}<small>{{ __('title.tag') }}</small>
        </{%- if theme.seo %}h2{% else %}h1{%- endif %}>
      </div>

      {%- for post in page.posts %}
        {{ post_template.render(post) }}
      {%- endfor %}
    </div>

  </div>


<div class="tag-cloud">
  <!-- <div class="tag-cloud-title">
      {{ _p('counter.tag_cloud', site.tags.length) }}
  </div> -->
  <div class="tag-cloud-tags" id="tags">
    {{ tagcloud({min_font: 16, max_font: 16, amount: 300, color: true, start_color: '#fff', end_color: '#fff'}) }}
  </div>
</div>
<br>

<script type="text/javascript">
   var alltags=document.getElementById('tags');
   var tags=alltags.getElementsByTagName('a');

   for (var i = tags.length - 1; i >= 0; i--) {
     var r=Math.floor(Math.random()*75+130);
     var g=Math.floor(Math.random()*75+100);
     var b=Math.floor(Math.random()*75+80);
     tags[i].style.background = "rgb("+r+","+g+","+b+")";
   }
</script>

<style type="text/css">

  body {
    background: url(/uploads/b7.jpg) !important;
    background-attachment: fixed !important;
    background-position: 50% 50% !important;
    background-size: cover !important;
  }
  div#posts.posts-expand {
    margin-top: 0px;
    margin-bottom: 60px;
    padding: 25px;
    border: 1px solid #fff;
    /*-webkit-border-radius: 8px;*/
    /*-moz-border-radius: 8px;*/
    border-radius: 3px;
    -webkit-box-shadow: #666 0px 0px 10px !important;
    -moz-box-shadow: #666 0px 0px 10px !important;
    box-shadow: #666 0px 0px 10px !important;
    background: rgba(	255,250,205, 1) !important;
    /*background: #fff;*/
    behavior: url(/images/PIE.htc);
    /*border: 1px solid rgba(128, 128, 128, 0.4);*/
    /*   border-left: 1px solid darkgray;
   border-right: 1px solid darkgray;*/
    /*rgba(128, 128, 128, 0.4)*/
  }

    div#posts.posts-expand .tag-cloud a{
   background-color: #f5f7f1;
   border-radius: 6px;
   padding-left: 10px;
   padding-right: 10px;
   margin-top: 18px;

 }

 .tag-cloud a{
   background-color: #f5f7f1;
   border-radius: 4px;
   padding-right: 5px;
   padding-left: 5px;
   margin-right: 5px;
   margin-left: 0px;
   margin-top: 8px;
   margin-bottom: 0px;

 }



 .tag-cloud-tags{
   text-align: left;
   counter-reset: tags;
 }
</style>



  {#####################}
  {### END TAG BLOCK ###}
  {#####################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
