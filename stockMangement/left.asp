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
<div class="lefttop"><span></span>库存管理</div>

<dl class="leftmenu">
<!--  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>产品分类管理
    </div>
    <ul class="menuson">
      
      <li>
        <div class="header">
          <cite></cite>
          <a href="/categroy/addCategory.asp" target="rightFrame">添加产品分类</a>
        </div>
      </li>
    </ul>
  </dd>-->
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>投入品管理
    </div>
    <ul class="menuson">
      
      <li>
        <div class="header">
          <cite></cite>
          <a href="/stockMangement/addStockIn.asp" target="rightFrame">投入品入库</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/stockMangement/addStockOut.asp" target="rightFrame">投入品出库</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/stockMangement/stockList.asp" target="rightFrame">投入品库存</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/stockMangement/stockInList.asp" target="rightFrame">入库记录</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/stockMangement/stockOutList.asp" target="rightFrame">出库记录</a>

        </div>
      </li>
    </ul>
  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>装箱管理
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/packing/addPaking.asp" target="rightFrame">产品单个装箱</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/packing/choosePackingList.asp?BOS=1" target="rightFrame">大箱列表</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/packing/choosePackingList.asp?BOS=2" target="rightFrame">小箱列表</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/packing/packingList.asp" target="rightFrame">装箱记录</a>

        </div>
      </li>
    </ul>
  </dd>
   <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>发货管理
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/shipManagement/addSingleShip.asp" target="rightFrame">单个发货</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/shipManagement/addBoxShip.asp" target="rightFrame">整箱发货</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/shipManagement/shipList.asp" target="rightFrame">发货记录</a>

        </div>
      </li>
    </ul>
  </dd>
</dl>

</body>
</html>
