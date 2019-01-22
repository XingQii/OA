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
<!--#include file = "../index/connDB.asp"-->
<%
Dim rsPower
set rsPower=Server.CreateObject("Adodb.Recordset")
rsPower.open "select addProduct,addProductBase from power where loginId="&session("loginId"),conn,1,1

%>
<div class="lefttop"><span></span>信息管理</div>

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
      <span><img src="../images/leftico01.png" /></span>供应商管理
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/supplierManagement/addSupplier.asp" target="rightFrame">添加供应商</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/supplierManagement/supplierList.asp" target="rightFrame">供应商列表</a>

        </div>
      </li>
    </ul>
  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>商家管理
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/dealerManagement/addDealer.asp" target="rightFrame">添加商家</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/dealerManagement/dealerList.asp" target="rightFrame">商家列表</a>

        </div>
      </li>
    </ul>
  </dd>

   <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>客户信息
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Customer/addCus.asp" target="rightFrame">添加客户</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Customer/customerList.asp" target="rightFrame">客户列表</a>

        </div>
      </li>

    </ul>
  </dd>
     <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>工作计划
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Panning/panningAdd.asp" target="rightFrame">添加工作计划</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Panning/panningList.asp" target="rightFrame">工作计划列表</a>

        </div>
      </li>

    </ul>
  </dd>
       <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>网贷化标准添加
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Agrifood/standardAdd.asp" target="rightFrame">添加标准</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Agrifood/standardList.asp" target="rightFrame">标准列表</a>

        </div>
      </li>

    </ul>
  </dd>
<!-------------------------------------监管单位------------------------------------------->

   <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>监管单位
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/regulators/addRegulators.asp" target="rightFrame">添加监管单位</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/regulators/regulatorsList.asp" target="rightFrame">监管单位列表</a>

        </div>
      </li>

    </ul>
  </dd>
  <!-------------------------------------电商企业准入标准-------------------------------------->

    <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>电商企业准入标准
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/standard/addStandard.asp" target="rightFrame">添加标准</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/standard/standardList.asp" target="rightFrame">准入标准列表</a>

        </div>
      </li>

    </ul>
  </dd>
</dl>

</body>
</html>
