
<!DOCTYPE HTML>
<html>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

  function runClock() {

  theTime = window.setTimeout("runClock()", 5000);
  main.sendAjax("message.asp?t="+new Date().getTime(), "GET", nop);
  }
  function nop(val)
  {
  document.getElementById('messagenum').innerHTML="����Ϣ"+val;
  if(val>0){
  	  document.getElementById("messagenum").style.visibility ="visible";
  	}else {
  	  document.getElementById("messagenum").style.visibility="hidden";
  	}
  }

</script>
<script type="text/javascript">
var count=0;

  $(function(){
  //���������л�
  $(".nav li a").click(function(){
  $(".nav li a.selected").removeClass("selected");
  $(this).addClass("selected");
  });
  });
</script>
<style>
#topRight{
  float: right;
  display: inline;
  width: 13%;
  background-color: #cc6600;
  border-radius:20px ;
  margin-top: 1%;
  margin-right: 1%;
  color: white;
  padding: 10px 0px 10px 10px;
}
section>section{
  display: inline;
  color: white;
}
section>section:last-child a{
	color: white;
}
section>img{
  display: inline;
  vertical-align: bottom;
}
#messagenum{
	border-radius: 20px;
	background-color: orange;
	animation: flicker 500ms infinite ;
	color: white;
	text-align: center;
	margin: 0 1% 0 1% ;
	display: inline;
	padding: 7%;
}
@keyframes flicker {
	from{background: none}
	to{background-color: #FFA500}
}
</style>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script src="../js/jquery.js"></script>
</head>

<body style="background:url(../images/topbg.gif) repeat-x;">
<!--#include file = "connDB.asp"-->
<!--
<div class="topleft">
  <a href="home.html" target="_parent"><img src="../images/logo.png" title="ϵͳ��ҳ" /></a>
</div>-->

<ul class="nav">
  <li onclick="tz('index')" ><a href="../index/left.asp" target="leftFrame"><img src="../images/icon01.png" title="������Ϣ����" /><h2>������Ϣ����</h2></a></li>

  <li onclick="tz('stock')" ><a href="../stockMangement/left.asp" target="leftFrame"><img src="../images/icon01.png" title="������" /><h2>������</h2></a></li>

  <li onclick="tz('workInfo')" ><a href="../workInfoManagement/left.asp" target="leftFrame"><img src="../images/icon01.png" title="��Ϣ����" /><h2>��Ϣ����</h2></a></li>

  <li onclick="tz('inspection')" ><a href="../qualityInspectionManagement/left.asp" target="leftFrame"><img src="../images/icon01.png" width="45px" height="45px"  title="����������"  id="work-management"/><h2>����������</h2></a></li>
   <li onclick="tz('source')" ><a href="../sourceManagement/left.asp" target="leftFrame"><img src="../images/icon01.png" width="45px" height="45px"  title="��Դ�ܲ�����"  id="work-management"/><h2>��Դ�ܲ�����</h2></a></li>
  <li onclick="tz('staff')" ><a href="../staffManagement/left.asp" target="leftFrame"><img src="../images/icon01.png" width="45px" height="45px"  title="Ա������"  id="work-management"/><h2>Ա������</h2></a></li>
 <!--
<li onclick="tz(2)"  id="project-before"><a href="../project-before/left.asp" target="leftFrame" ><img src="../images/icon02.png" title="ģ�͹���" /><h2>��Ŀ</h2></a></li>-->
<li onclick="tz('backstage')"  id="project-before"><a href="../backstageManagement/left.asp" target="leftFrame" ><img src="../images/icon01.png" title="��̨����" /><h2>��̨����</h2></a></li>

<!--  <li onclick="tz(4)" ><a href="../work-management/left.asp" target="leftFrame"><img src="../images/icon16.png" width="45px" height="45px" title="�칫����"  id="work-management"/><h2>�칫����</h2></a></li>
  <li onclick="tz(5)"  id="system-setting"><a href="../system-setting/left.asp" target="leftFrame"><img src="../images/icon06.png" title="ϵͳ����" /><h2>ϵͳ����</h2></a></li>-->
</ul>
<section id="topRight">
<img src="../images/user.png" alt="user">
  <section><%=session("username")%></section>
   <a href="#" target="rightFrame">
  <a href="#" target="rightFrame">
<section id="messagenum" onclick="tz('inform');">
  </section></a>
  <section>
  <a href="../login.asp?action=signOut" target="_parent">�˳�</a>
</section>
</section>


<script>
  function tz(i)
  {
  if(i=='index')
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';
  
  }
  if(i=="workInfo")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='left.asp';
  parent.document.getElementById('rightFrame').src='../workInfoManagement/left.asp';

  }
  if(i=="inform")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='left.asp';
  parent.document.getElementById('rightFrame').src='../personalWorkManage/personalInformList.asp';

  }
  if(i=="stock")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../stockMangement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';
  
  }
  if(i=="workInfo")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../workInfoManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';

  }
  if(i=="inspection")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../qualityInspectionManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';

  }
  if(i=="staff")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../staffManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';
  
  }
  if(i==5)
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../qualityInspectionManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';
  
  }
  if(i=="source")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../sourceManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';

  }
  if(i=="backstage")
  {
  //alert(window.parent.document.getElementById('leftFrame'));
  parent.document.getElementById('leftFrame').src='../backstageManagement/left.asp';
  parent.document.getElementById('rightFrame').src='index.asp';

  }
  }
  runClock();
</script>

</body>
</html>
