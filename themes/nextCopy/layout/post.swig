{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ page.title }} | {{ title }}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
    {{ partial('_macro/post.swig', {post: page}) }}
    <script type="text/javascript" src="/js/src/linkcard.js"></script>
  </div>
<script type="text/javascript" src="/js/src/linkcard.js"></script>
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
  <script type="text/javascript" src="/js/src/linkcard.js"></script>
{% endblock %}

