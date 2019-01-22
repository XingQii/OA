<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script language="JavaScript" src="../js/jquery.js"></script>
  
  <script type="text/javascript">
    $(function(){
      //导航切换
      $(".menuson .header").click(function(){
        var $parent = $(this).parent();
        $(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
        
        $parent.addClass("active");
        if(!!$(this).next('.sub-menus').size()){
          if($parent.hasClass("open")){
            $parent.removeClass("open").find('.sub-menus').hide();
          }else{
            $parent.addClass("open").find('.sub-menus').show();
          }
          
          
        }
      });
      
      // 三级菜单点击
      $('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active");
        $(this).addClass("active");
      });
      
      $('.title').click(function(){
        var $ul = $(this).next('ul');
        $('dd').find('.menuson').slideUp();
        if($ul.is(':visible')){
          $(this).next('.menuson').slideUp();
        }else{
          $(this).next('.menuson').slideDown();
        }
      });
    })
  </script>


</head>

<body style="background:#fff3e1;">
<!--#include virtual = "/index/connDB.asp"-->
<div class="lefttop"><span></span>农产品管理</div>

<dl class="leftmenu">
<dd>
              <div class="title">
                <span><img src="../images/leftico01.png" /></span>农产品网贷化标准
              </div>
              <ul class="menuson">

                <li>
                  <div class="header">
                    <cite></cite>
                    <a href="/Agrifood/standardAdd.asp" target="rightFrame">添加标准</a>

                  </div>
                </li>
                <li>
                  <div class="header">
                    <cite></cite>
                    <a href="/Agrifood/standardList.asp" target="rightFrame">标准列表</a>

                  </div>
                </li>
    </ul>
  </dd>
</dl>

</body>
</html>
