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
<!--#include file = "../index/connDB.asp"-->
<%
Dim rsPower
set rsPower=Server.CreateObject("Adodb.Recordset")
rsPower.open "select addProduct,addProductBase from power where loginId="&session("loginId"),conn,1,1

%>
<div class="lefttop"><span></span>��Դ�ܲ�����</div>

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
      <span><img src="../images/leftico01.png" /></span>����
    </div>
    <ul class="menuson">
      <%If rsPower("addProduct")<>0 Then%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/batch/addBatch.asp" target="rightFrame">�������</a>
        </div>
      </li>
      <%End If%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/batch/batchList.asp" target="rightFrame">�����б�</a>

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
      <span><img src="../images/leftico01.png" /></span>��Դ����
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/sourceProcess/productList.asp" target="rightFrame">�����Դ����</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/sourceProcess/processList.asp" target="rightFrame">��Դ�����б�</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/sourceManagement/productList.asp" target="rightFrame">�鿴��Դ��Ϣ</a>

        </div>
      </li>

    </ul>
  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��ҵ����
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/workManagement/productList.asp" target="rightFrame">�����ҵ</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/workManagement/workList.asp" target="rightFrame">��ҵ�б�</a>

        </div>
      </li>

    </ul>
  </dd>
</dl>

</body>
</html>
