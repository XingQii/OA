<!--#INCLUDE HXINCLUDEHEAD.ASP"-->
<%
formname="form1"
action=request("action")
WS_Appointment=trim(request("WS_Appointment"))
WS_DepartmentName=trim(request("WS_DepartmentName"))
checkuser=request("checkuser")
response.Write WS_DepartmentName
%>
<head>
<title>选择办公用品名</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="D4D0C8" scroll="no">
<table width="99%" cellspacing=1 cellpadding=2 align="center" id="SearchNone">
 <form action="" method="post" name="<%=formname%>">
<tr><td>
<table cellpadding="0" cellspacing="0" style="width:100%;height:445px;table-layout:fixed;">
  <tr>
    <td bgcolor="#EEEEEE" valign="top">
	<div style="width:100%;height:445px;overflow:hidden;position:absolute;">
        <div style="position:absolute;left:0px;top:0px;overflow:visible;">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
     <td height=5><hr width="100%"></td>
   </tr>
 <%
  aaa=1
  %>
   <tr>
    <td><table width="98%" border="0" cellspacing="0" cellpadding="2" align="center">
  <%
  set URS=WS_S.HX_SetRSD("","MJ_OfficeName"," order by WS_ONID asc")
	if URS.recordcount>0 then	  
	  do until URS.eof
	   response.write "<tr><td><input name='Uid"&aaa&"' type='hidden' value='"&urs("WS_ONID")&"'><input type='radio' name='name' value="&urs("WS_OfficeName")&" id='WSOA"&aaa&"'><label for='WSOA"&urs("WS_ONID")&"'><font color=blue>"&URS("WS_OfficeName")&"</font></label>&nbsp;&nbsp;</td></tr>"
	   URS.movenext
	   loop
	   end if 
     %>
</table>
</td>
  </tr>
  <tr>
     <td height=5><hr width="100%"></td>
   </tr>
</table></div></div></td>
<td width="16" background="../HXimages/Scroll/scroll_bg.gif">
      <table cellpadding="0" cellspacing="0" height="100%" width="100%">
        <tr>
          <td height="16"><img src="../HXimages/Scroll/scroll1.gif" width="16" height="16" id="scrollUp"></td>
        </tr>
        <tr>
          <td valign="top"><img src="../HXimages/Scroll/scroll_slide.gif"
          id="scrollSlide" style="margin-top:0px; cursor:hand;"></td>
        </tr>
        <tr>
          <td height="16"><img src="../HXimages/Scroll/scroll3.gif" width="16" height="16" id="scrollDown"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</td></tr>
  <tr>
     <td height=25 align="right">
	 <input name="button" type="button" value=" 确 定 " onClick="select_man();">　 
	 </td>
   </tr>
  </form>
</table>
 <script language="javascript">
function select_man()
{

obj = document.getElementsByName("name");
for(i=0;i<obj.length;i++){
if(obj[i].checked){
t=obj[i].value;	
break;
                   }
                          }
 opener.<%=formname%>.WS_<%=checkuser%>Name.value=t;
 window.close();
}
function func_select_all1()
{
     for (i=document.fr.WS_Appointment.options.length-1; i>=0; i--)
     document.fr.WS_Appointment.options(i).selected=true;
 }
 
function func_cancel_all1()
{
     for (i=document.fr.WS_Appointment.options.length-1; i>=0; i--)
     document.fr.WS_Appointment.options(i).selected=false;
 }
 
 function func_select_all2()
 { 
   for (i=document.fr.WS_DepartmentName.options.length-1; i>=0; i--) 
   document.fr.WS_DepartmentName.options(i).selected=true;
 }
 function func_cancel_all2()
 { 
   for (i=document.fr.WS_DepartmentName.options.length-1; i>=0; i--) 
   document.fr.WS_DepartmentName.options(i).selected=false;
 }

</script>
<script language="javascript">
var scrollInterval = 10;
var scrollHeight = 100; //高度，注意如果修改这个值，table中也要相应的修改
var scrollTimer;
var scrollBtn;
var mouseInit;
var slideInit;
function uncScroll(oBtn, nStep)
{
  var content = oBtn.parentNode.parentNode.parentNode.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0];
  var slide = oBtn.parentNode.parentNode.parentNode.rows[1].cells[0].childNodes[0];
  var h = content.clientHeight;
  if (h <= scrollHeight)
    return;
  content.style.pixelTop += nStep;
  if (content.style.pixelTop > 0)
    content.style.pixelTop = 0;
  if (content.style.pixelTop+h < scrollHeight)
    content.style.pixelTop = scrollHeight - h;
  var m = -content.style.pixelTop*(slide.parentNode.clientHeight-slide.clientHeight)/(h-scrollHeight);
  slide.style.marginTop = m + "px";
}
function uncSlide(oSlide)
{
  var content = oSlide.parentNode.parentNode.parentNode.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0];
  var h = content.clientHeight;
  if (h <= scrollHeight)
    return;
  var m = slideInit + (event.y - mouseInit);
  if (m < 0)
    m = 0;
  if (m > oSlide.parentNode.clientHeight-oSlide.clientHeight)
    m = oSlide.parentNode.clientHeight-oSlide.clientHeight;
  oSlide.style.marginTop = m + "px";
  content.style.pixelTop = -m*(h-scrollHeight)/(oSlide.parentNode.clientHeight-oSlide.clientHeight);
}
  

</script>
<script for="scrollUp" event="ondragstart">
  return false;
</script>
<script for="scrollUp" event="onmousedown">
  this.src='../HXimages/Scroll/scroll1-1.gif';
  setCapture();
  scrollBtn = this;
  scrollTimer = setInterval("uncScroll(scrollBtn, 2)", scrollInterval);
</script>
<script for="scrollUp" event="onmouseup">
  this.src='../HXimages/Scroll/scroll1.gif';
  clearInterval(scrollTimer);
  releaseCapture();
</script>
<script for="scrollDown" event="ondragstart">
  return false;
</script>
<script for="scrollDown" event="onmousedown">
  setCapture();
  scrollBtn = this;
  this.src='../HXimages/Scroll/scroll3-1.gif';
  scrollTimer = setInterval("uncScroll(scrollBtn, -2)", scrollInterval);  
</script>
<script for="scrollDown" event="onmouseup">
  clearInterval(scrollTimer);
  this.src='../HXimages/Scroll/scroll3.gif';
  releaseCapture();
</script>
<script for="scrollSlide" event="ondragstart">
  return false;
</script>
<script for="scrollSlide" event="onmousedown">
  setCapture();
  this.src='../HXimages/Scroll/scroll_slide-1.gif';
  slideInit = parseInt(this.style.marginTop);
  mouseInit = event.y;
</script>
<script for="scrollSlide" event="onmousemove">
  if (event.button)
    uncSlide(this);
</script>
<script for="scrollSlide" event="onmouseup">
  releaseCapture();
  this.src='../HXimages/Scroll/scroll_slide.gif';
</script>