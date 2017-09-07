﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>江西六丰信息科技有限公司</title>
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/indexdata - 副本.js" type="text/javascript"></script>
        <script type="text/javascript">
			//整体布局的实现
            var tab = null;
            var accordion = null;
            var tree = null;
            $(function ()
            {
                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-34,space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();

                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });
				
				$("#accordion2").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                //树
                $("#tree1").ligerTree({
                    data : indexdatal,
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
					btnClickToToggleOnly:false,
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });

                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
     </script> 
<style type="text/css"> 
    body,html{height:100%;background:#0000CD}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:black;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:60px; line-height:31px; background:#3B7CBA repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#000000; padding-left:35px; line-height:26px; no-repeat: 10px 5px;margin-top:5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 

	#nav-little{
	padding-top:10px;
	padding-bottom:10px;
    list-style: outside none none;
    position: absolute;
    transition: opacity 1s ease 0s;
	border-left:1px #E9E9E9 solid;
	border-right:1px #E9E9E9 solid;
	border-bottom:1px #E9E9E9 solid;
	margin-top:13px;
	margin-right:10px;
	border-radius:5px;
	width:140px;
	display:none;
}
 </style>
</head>
<body style="padding:0px;background:#3385C6;">  
<div id="pageloading"></div>  
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo"><img src="${pageContext.request.contextPath}/images/companylogo.png"></img></div>
    <div class="l-topmenu-welcome">
        <span style="color:#E2ECF5">欢迎登陆,${name}</span>
		<span class="space">|</span>
		<span><img src="${pageContext.request.contextPath}/images/sun.png"></img></span>
		<span class="space">|</span>
		<span><img src="${pageContext.request.contextPath}/images/shezhi.png"></img></span>
		<span class="space">|</span>
		<span>
			<img src="images/default_img.png"></img>
		</span>
    </div> 
</div>
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="left"  title="功能列表" id="accordion1"> 
                     <div title="功能列表" class="l-scroll">
                         <ul id="tree1" style="margin-top:3px;"/>
                    </div>
        </div>
		
        <div position="center" id="framecenter"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="./welcome_main"></iframe>
            </div> 
        </div> 
        
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;background:#3385C6">
            Copyright © 技术支持单位：江西六丰信息科技有限公司
    </div>
    <div style="display:none"></div>
</body>
</html>
