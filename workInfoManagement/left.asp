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
<div class="lefttop"><span></span>��Ϣ����</div>

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
      <span><img src="../images/leftico01.png" /></span>��Ӧ�̹���
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/supplierManagement/addSupplier.asp" target="rightFrame">��ӹ�Ӧ��</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/supplierManagement/supplierList.asp" target="rightFrame">��Ӧ���б�</a>

        </div>
      </li>
    </ul>
  </dd>
  <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>�̼ҹ���
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/dealerManagement/addDealer.asp" target="rightFrame">����̼�</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/dealerManagement/dealerList.asp" target="rightFrame">�̼��б�</a>

        </div>
      </li>
    </ul>
  </dd>

   <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>�ͻ���Ϣ
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Customer/addCus.asp" target="rightFrame">��ӿͻ�</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Customer/customerList.asp" target="rightFrame">�ͻ��б�</a>

        </div>
      </li>

    </ul>
  </dd>
     <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>�����ƻ�
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Panning/panningAdd.asp" target="rightFrame">��ӹ����ƻ�</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Panning/panningList.asp" target="rightFrame">�����ƻ��б�</a>

        </div>
      </li>

    </ul>
  </dd>
       <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��������׼���
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="../Agrifood/standardAdd.asp" target="rightFrame">��ӱ�׼</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="../Agrifood/standardList.asp" target="rightFrame">��׼�б�</a>

        </div>
      </li>

    </ul>
  </dd>
<!-------------------------------------��ܵ�λ------------------------------------------->

   <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>��ܵ�λ
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/regulators/addRegulators.asp" target="rightFrame">��Ӽ�ܵ�λ</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/regulators/regulatorsList.asp" target="rightFrame">��ܵ�λ�б�</a>

        </div>
      </li>

    </ul>
  </dd>
  <!-------------------------------------������ҵ׼���׼-------------------------------------->

    <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>������ҵ׼���׼
    </div>
    <ul class="menuson">
      <%If rsPower("addProductBase")<>0 Then%>

      <li>
        <div class="header">
          <cite></cite>
          <a href="/standard/addStandard.asp" target="rightFrame">��ӱ�׼</a>

        </div>
      </li>
      <%End If%>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/standard/standardList.asp" target="rightFrame">׼���׼�б�</a>

        </div>
      </li>

    </ul>
  </dd>
</dl>

</body>
</html>
