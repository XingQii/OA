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
<!--#include virtual = "/index/connDB.asp"-->
<div class="lefttop"><span></span>����������</div>

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
      <span><img src="../images/leftico01.png" /></span>����������
    </div>
    <ul class="menuson">
      
      <li>
        <div class="header">
          <cite></cite>
          <a href="/qualityInspectionManagement/addCertificate.asp" target="rightFrame">���������֤�ļ�</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/qualityInspectionManagement/certificateList.asp" target="rightFrame">������֤�ļ��б�</a>

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
<!--      <li>
        <div class="header">
          <cite></cite>
          <a href="/product/product&stageList.asp" target="rightFrame">��Ʒ���׶μ�¼</a>

        </div>
      </li>-->
 <dd>
    <div class="title">
      <span><img src="../images/leftico01.png" /></span>����¼
    </div>
    <ul class="menuson">

      <li>
        <div class="header">
          <cite></cite>
          <a href="/inspectionManagement/addInspection.asp" target="rightFrame">��Ӽ���¼</a>

        </div>
      </li>
      <li>
        <div class="header">
          <cite></cite>
          <a href="/inspectionManagement/inspectionList.asp" target="rightFrame">����¼�б�</a>

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
</dl>

</body>
</html>
