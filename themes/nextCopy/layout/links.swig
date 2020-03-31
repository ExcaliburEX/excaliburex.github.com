{% block content %}
  {######################}
  {### LINKS BLOCK ###}
  {######################}



    <div id="links">

        <style>
            .container .main-inner {
                width: 1100px;
            }
            .links-content{
                margin-top:1rem;
            }
            
            .link-navigation::after {
                content: " ";
                display: block;
                clear: both;
            }



            .card {
                width: 45%;
                font-size: 1rem;
                padding: 10px 20px;
                border-radius: 4px;
                transition-duration: 0.15s;
                margin-bottom: 1rem;
                display:flex;
                background-image: linear-gradient(to right, #eea2a2 0%, #bbc1bf 19%, #57c6e1 42%, #b49fda 79%, #7ac5d8 100%);
}
@-webkit-keyframes hue {
    from {
        -webkit-filter: hue-rotate(0deg);
    }
    to {
        -webkit-filter: hue-rotate(-360deg);
    }
}
            img.ava{
                animation: none !important; 
                animation-play-state:paused !important;
            }

            a.fancybox.fancybox.image{
                                animation: none !important; 
                animation-play-state:paused !important;
            }

 
            @media(max-width: 1400px){
                .card{
                    width: 40% !important;
                }
            }
            .card:nth-child(odd) {
                float: left;
            }
            .card:nth-child(even) {
                float: right;
            }
            .card:hover {
                transform: scale(1.1);
                box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
            }
            .card a {
                border:none; 
            }
            .card .ava {
                width: 4rem!important;
                height: 4rem!important;
                margin:0!important;
                margin-right: 1em!important;
                border-radius:4px;
                animation-play-state:paused !important; 
-webkit-animation-play-state:paused !important; 
animation-play-state: paused|running !important;
            vertical-align: center !important;
                
            }
            .card .card-header {
                font-style: italic;
                overflow: hidden;
                width: 100%;
            }
            .card .card-header a {
                font-style: normal;
                color: #2bbc8a;
                font-weight: bold;
                text-decoration: none;
            }
            .card .card-header a:hover {
                color: #d480aa;
                text-decoration: none;
            }



            .card .card-header .info {
                font-style:normal;
                color:#8A2BE2;
                    -webkit-background-clip: text;
    background-clip: text;
                min-width: 0;
                overflow: hidden;
                white-space: nowrap;
            background-image: linear-gradient(to top, #fcc5e4 0%, #fda34b 15%, #ff7882 35%, #c8699e 52%, #7046aa 71%, #0c1db8 87%, #020f75 100%);
    animation: hue 4s infinite linear;
      animation-duration: 2s;
      animation-timing-function: cubic-bezier(1,1,1,1);
      animation-delay: 0s;
      animation-iteration-count: infinite;
      animation-direction: normal;
      animation-fill-mode: none;
      animation-play-state: running;
      animation-name: hue;
    font-size: 18px !important;
    font-weight: 700;
    vertical-align: -1px;
}


    .card .card-header .info {
        background-image: -webkit-linear-gradient(left,	#8B008B, #E6D205 25%,	#1E90FF 50%, 	#00FF00 75%, #147B96);
        -webkit-text-fill-color: transparent;
        -webkit-background-clip: text;
        -webkit-background-size: 200% 100%;
        -webkit-animation: masked-animation 1s infinite linear;
    }

@-webkit-keyframes masked-animation {
    0%  { background-position: 0 0;}
    100% { background-position: -100% 0;}
}


            span.focus-links {
                font-style: normal;
                margin-left: 10px;
                position: unset;
                left: 0;
                padding: 0 7px 0 5px;
                font-size: 11px;
                border-color: #42c02e;
                border-radius: 40px;
                line-height: 24px;
                height: 22px;
                color: #fff !important;
                background-color: #42c02e;
                display: inline-block;
                 color: #FF1493 !important;
                    animation: hue 10s infinite linear;
          background-image: linear-gradient(to right, #e4afcb 0%, #b8cbb8 0%, #b8cbb8 0%, #e2c58b 30%, #c2ce9c 64%, #7edbdc 100%);
      animation-duration: 2s;
      animation-timing-function:cubic-bezier(0.8,  1, 1, 0.8);
      animation-timing-function: linear;
      animation-delay: 0s;
      animation-iteration-count: infinite;
      animation-direction: normal;
      animation-fill-mode: none;
      animation-play-state: running;
      animation-name: hue;
    
            }
 @-webkit-keyframes hue {
    from {
        -webkit-filter: hue-rotate(0deg);
    }
    to {
        -webkit-filter: hue-rotate(90deg);
    }
}




            a.nick{
           
    -webkit-background-clip: text;
    background-clip: text;
        font-size: 22px !important;
 background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);
    animation: hue 2s infinite linear;
      animation-duration: 2s;
      background-image: linear-gradient(to top, #c471f5 0%, #fa71cd 100%);
      animation-delay: 0s;
      animation-iteration-count: infinite;
      animation-direction: normal;
      animation-fill-mode: none;
      animation-play-state: running;
      animation-timing-function:cubic-bezier(0.8,  1, 1, 0.8);
      animation-name: hue;
    font-weight: 1000 !important;
    vertical-align: -1px;
}
@-webkit-keyframes hue {
    from {
        -webkit-filter: hue-rotate(0deg);
    }
    to {
        -webkit-filter: hue-rotate(-360deg);
    }
}

            a.sss{
           
    -webkit-background-clip: text;
    background-clip: text;

 background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);
    animation: hue 4s infinite linear;
      animation-duration: 2s;
      animation-timing-function: cubic-bezier(1,1,1,1);
      animation-delay: 0s;
      animation-iteration-count: infinite;
      animation-direction: normal;
      animation-fill-mode: none;
      animation-play-state: running;
      animation-name: hue;
    font-size: 15px;
    font-weight: 700;
    vertical-align: -1px;
}
@-webkit-keyframes hue {
    from {
        -webkit-filter: hue-rotate(0deg);
    }
    to {
        -webkit-filter: hue-rotate(-360deg);
    }
}

            span.focus-links:hover{
                background-color: #318024;
            }

            .friends-btn{
                text-align: center;
                color: #555!important;
                background-color: #fff;
                border-radius: 3px;
                font-size: 15px;
                box-shadow: inset 0 0 10px 0 rgba(0,0,0,.35);
                border: none!important;
                transition-property: unset;
                padding: 0 15px;
                margin: inherit;
            }

            .friends-btn:hover{
                color: rgb(255, 255, 255) !important;
                border-radius: 3px;
                font-size: 15px;
                box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.35);
                background-image: linear-gradient(90deg, #a166ab 0%, #ef4e7b 25%, #f37055 50%, #ef4e7b 75%, #a166ab 100%);
                margin: inherit;
                }
            }
        </style>
        <div class="links-content">
            <div class="link-navigation">

                {% for link in theme.mylinks %}
                 
                    <div class="card">   
                       <img class="ava" src="{{ link.avatar }}"/>
                        <div class="card-header">
                        <div><a href="{{ link.site }}" target="_blank" class = "nick"> {{ link.nickname }}</a> <a href="{{ link.site }}" class="sss"><span class="focus-links">关注</span></a></div>
                        <div class="info">{{ link.info }}</div>
                        </div>
                    </div>
                
                {% endfor %}

            </div>
            {{ page.content }}
            </div>
        </div>
<script type="text/javascript">
var randnum=function(n){return Math.round(Math.random()*n)},hexify=function(n){return("0"+parseInt(n).toString(16)).slice(-2)},randex=function(){return"#"+hexify(randnum(255))+hexify(randnum(255))+hexify(randnum(255))},blender=function(){return Math.round(Math.random())?"radial-gradient(circle at "+randnum(100)+"% "+randnum(100)+"%, "+randex()+", "+randex()+")":"linear-gradient("+randnum(360)+"deg, "+randex()+", "+randex()+")"};$(".card").css("background-image",blender());
$(".card").each(function(){var n=blender();
$(this).hover(function(){$(this).css("background-image",n)},function(){$(this).css("background-image",n)})}
),$(".card").click(function()
{var n=$(this).children(".card-header").children("div").children("a").attr("href");window.location.href=n});
$("a.nick").css("font-color",function(){var str = "#";var arr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"];for (var i = 0; i < 6; i++) {
var num = parseInt(Math.random() * 16);str += arr[num];}return str;});

</script>
  {##########################}
  {### END LINKS BLOCK ###}
  {##########################}
{% endblock %}