



{% macro render(display_toc) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {%- set display_toc = theme.toc.enable and display_toc %}

      {%- if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview-wrap">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {%- endif %}

      <div class="site-overview-wrap sidebar-panel{%- if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{%- endif %}">
        <div class="site-overview">

          {{ partial('_partials/sidebar/site-overview.swig', {}, {cache: theme.cache.enable}) }}
          
          {%- for inject_item in theme.injects.sidebar %}
            {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
          {%- endfor %}
        </div>
      </div>

      {%- if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <div class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {%- set next_toc_number = theme.toc.number %}
            {%- if page.toc_number !== undefined %}
              {%- set next_toc_number = page.toc_number %}
            {%- endif %}
            {%- set next_toc_max_depth = page.toc_max_depth|default(theme.toc.max_depth)|default(6) %}
            {%- set toc = toc(page.content, { "class": "nav", list_number: next_toc_number, max_depth: next_toc_max_depth }) %}

            {%- if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {%- endif %}

          </div>
        </div>
      <!--/noindex-->
      {%- endif %}

      {%- if theme.back2top.enable and theme.back2top.sidebar %}
        <div class="back-to-top motion-element">
          <i class="fa fa-arrow-up"></i>
          {%- if theme.back2top.scrollpercent %}
            <span id="scrollpercent"><span>0</span>%</span>
          {%- endif %}
        </div>
      {%- endif %}

  {% if site.tags.length > 1 %}
<script type="text/javascript" charset="utf-8" src="/js/tagcloud.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/tagcanvas.js"></script>
<div class="widget-wrap">
    <h3 class="widget-title">Tag Cloud</h3>
    <div id="myCanvasContainer" class="widget tagcloud">
        <canvas width="250" height="250" id="resCanvas" style="width=100%">
            {{ list_tags() }}
        </canvas>
    </div>
</div>
{% endif %}


    </div>
  </aside>
  <div id="sidebar-dimmer"></div>
{% endmacro %}



<div id="days"></div>
<script>
function show_date_time(){
    window.setTimeout("show_date_time()", 1000);
    BirthDay=new Date("05/27/2017 15:13:14");
    today=new Date();
    timeold=(today.getTime()-BirthDay.getTime());
    sectimeold=timeold/1000
    secondsold=Math.floor(sectimeold);
    msPerDay=24*60*60*1000
    e_daysold=timeold/msPerDay
    daysold=Math.floor(e_daysold);
    e_hrsold=(e_daysold-daysold)*24;
    hrsold=setzero(Math.floor(e_hrsold));
    e_minsold=(e_hrsold-hrsold)*60;
    minsold=setzero(Math.floor((e_hrsold-hrsold)*60));
    seconds=setzero(Math.floor((e_minsold-minsold)*60));
    document.getElementById('days').innerHTML="已运行 "+daysold+" 天 "+hrsold+" 小时 "+minsold+" 分 "+seconds+" 秒";
}
function setzero(i) {
    if (i<10) {
        i="0" + i
    };
    return i;
}
show_date_time();
</script>



