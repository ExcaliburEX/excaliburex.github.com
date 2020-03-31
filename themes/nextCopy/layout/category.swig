{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ title }}{% endblock %}

{% block content %}

  {######################}
  {### CATEGORY BLOCK ###}
  {######################}
 
  <div class="post-block category">

    <div id="posts" class="posts-collapse">
      <div class="collection-title">
        <{%- if theme.seo %}h2{% else %}h1{%- endif %}>{#
        #}{{ page.category }}{#
        #}<small>{{ __('title.category') }}</small>
        </{%- if theme.seo %}h2{% else %}h1{%- endif %}>
      </div>

      {%- for post in page.posts %}
        {{ post_template.render(post) }}
      {%- endfor %}
       <style>
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
    background: rgba(255, 255, 240, 1) !important;
    /*background: #fff;*/
    behavior: url(/images/PIE.htc);
    /*border: 1px solid rgba(128, 128, 128, 0.4);*/
    /*   border-left: 1px solid darkgray;
   border-right: 1px solid darkgray;*/
    /*rgba(128, 128, 128, 0.4)*/
  }
</style>

    </div>
  </div>
  {##########################}
  {### END CATEGORY BLOCK ###}
  {##########################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
