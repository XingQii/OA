<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script language="JavaScript" src="../js/jquery.js"></script>
  
  <script type="text/javascript">
    $(function(){
      //�����л�
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
      
      // �����˵����
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
<!--#include file = "connDB.asp"-->
<%
Dim rsPower
set rsPower=Server.CreateObject("Adodb.Recordset")
rsPower.open "select addProduct,addProductBase from power where loginId="&session("loginId"),conn,1,1

%>
<div class="lefttop"><span></span>������Ϣ����</div>

<dl class="leftmenu">
<!--  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��Ʒ�������
    </div>
    <ul class="menuson">
      
      <li>
        <div class="header">
          <cite></cite>
          <a href="/categroy/addCategory.asp" target="rightFrame">��Ӳ�Ʒ����</a>
        </div>
      </li>
    </ul>
  </dd>-->
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>ũҵ��������
    </div>
    <ul class="menuson">
      <%If rsPower("addProduct")<>0 Then%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/product/addProduct.asp" target="rightFrame">��Ӳ�Ʒ</a>
        </div>
      </li>
      <%End If%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/product/productList.asp" target="rightFrame">��Ʒ�б�</a>

        </div>
      </li>
<!--      <li>
        <div class="header">
          <cite></cite>
          <a href="/product/product&stageList.asp" target="rightFrame">��Ʒ���׶μ�¼</a>

        </div>
      </li>-->

    </ul>
  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��������
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/productBase/addProductBase.asp" target="rightFrame">�����������</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/productBase/productBaseList.asp" target="rightFrame">�������ؼ�¼</a>

        </div>
      </li>

    </ul>
  </dd>  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>�ؿ����
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/plotManagement/addPlot.asp" target="rightFrame">��ӵؿ�</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/plotManagement/plotList.asp" target="rightFrame">�ؿ��б�</a>

        </div>
      </li>

    </ul>
  </dd>
  <!-------------------------------------��ͥũ������--------------------------------------->
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��ͥũ������
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/farmManagement/addFarm.asp" target="rightFrame">���ũ��</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/farmManagement/farmList.asp" target="rightFrame">��ͥũ���б�</a>

        </div>
      </li>

    </ul>
  </dd>

</dl>

</body>
</html>
