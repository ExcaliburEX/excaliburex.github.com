<div class="copyright">{#
#}{%- set current = date(Date.now(), "YYYY") %}{#
#}{%- if theme.footer.beian.enable %}{#
#}  {{ next_url('http://www.beian.miit.gov.cn', theme.footer.beian.icp + ' ') }}{#
#}




{%- endif %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }}</span>






  {%- if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>

  {%- endif %}

  {%- if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total') }} &asymp;</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>

  {%- endif %}
</div>

{%- if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}{#
  #}{%- if theme.footer.powered.version %} v{{ hexo_env('version') }}{%- endif %}{#
 #}</div>
{%- endif %}

{%- if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
  
{%- endif %}

{%- if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}{#
  #}{%- if theme.footer.theme.version %} v{{ version }}{%- endif %}{#
#}</div>
{%- endif %}

{%- for inject_item in theme.injects.footer %}s
  {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
{%- endfor %}

<div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">全站共 {{ totalcount(site) }} 字</span>
</div>

<div class="run_time" style=" text-align:center;">
  <span id="timeDate">载入天数...</span><span id="times">载入时分秒...</span>
  <script>
    var now = new Date(); 
    function createtime() { 
        var grt= new Date("08/06/2019 00:00:00");//此处修改你的建站时间或者网站上线时间 
        now.setTime(now.getTime()+250); 
        days = (now - grt ) / 1000 / 60 / 60 / 24; dnum = Math.floor(days); 
        hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); hnum = Math.floor(hours); 
        if(String(hnum).length ==1 ){hnum = "0" + hnum;} minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum); 
        mnum = Math.floor(minutes); if(String(mnum).length ==1 ){mnum = "0" + mnum;} 
        seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum); 
        snum = Math.round(seconds); if(String(snum).length ==1 ){snum = "0" + snum;} 
        document.getElementById("timeDate").innerHTML = "本站已安全运行 "+dnum+" 天 "; 
        document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒"; 
    } 
    setInterval("createtime()",250);
  </script>

<div class="BbeiAn-info">
  {{ __('皖ICP备') }} -
    <a target="_blank" href="http://www.miitbeian.gov.cn/" style="color:#f0d784"  rel="nofollow">19020907</a> <!--a标签中增加nofollow属性，避免爬虫出站。-->| 
	<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=32050802011200" style="color:#f0d784;text-decoration:none;padding-left:30px;background:url(https://s1.ax1x.com/2018/09/29/ilmwIH.png) no-repeat left center" rel="nofollow">{{ __('苏公网安备 32050802011200号') }}</a>	  <!--这里将图标作为了背景，以使得能和后面的文字在同一行-->
</div>


