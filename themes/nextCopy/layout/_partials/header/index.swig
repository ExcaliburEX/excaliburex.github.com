{{ partial('_partials/header/brand.swig', {}, {cache: theme.cache.enable}) }}

{%- set hasSearch = theme.algolia_search.enable || theme.local_search.enable %}

<nav class="site-nav">
  {{ partial('_partials/header/menu.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.scheme === 'Muse' || theme.scheme === 'Mist' %}
    {% include 'sub-menu.swig' %}
  {%- endif %}

  {%- if hasSearch %}
    <div class="site-search">
      {{ partial('_partials/search/index.swig', {}, {cache: theme.cache.enable}) }}
    </div>
  {%- endif %}
</nav>

{%- for inject_item in theme.injects.header %}
  {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
{%- endfor %}

<!-- 打字礼花及震动特效 -->
<script type="text/javascript" src="https://qianling-1254036047.cos.ap-chengdu.myqcloud.com/js/activate-power-mode.js"></script>
<script>
  POWERMODE.colorful = true; // ture 为启用礼花特效
  POWERMODE.shake = true; // false 为禁用震动特效
  document.body.addEventListener('input', POWERMODE);
</script>
