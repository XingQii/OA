<!--#INCLUDE FILE="HXINCLUDEHEAD.ASP"-->
<%
formname=request("formname")
action=request("action")
WS_Appointment=trim(request("WS_Appointment"))
WS_DepartmentName=trim(request("WS_DepartmentName"))
checkuser=request("checkuser")
%>
<head>
<title>选择员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="D4D0C8" scroll="no">
<table width="99%" cellspacing=1 cellpadding=2 align="center">
 <form action="" method="post" name="fr"> <tr>
 <input name="formname" type="hidden" value="<%=formname%>">
 <input name="action" type="hidden" value="search">
    <td>
	<input type='radio' name='SearchBar' value='0' id='SearchBar' onClick="Elementdisplay('SearchBarNone');Elementdisplaynone('SearchNone');Elementdisplay('Searchsubmit');"><label for=SearchBar>搜索</label>
	<input type='radio' name='SearchBar' value='1' checked id='SearchBar1' onClick="Elementdisplaynone('SearchBarNone');Elementdisplay('SearchNone');Elementdisplaynone('Searchsubmit');"><label for=SearchBar1>不搜索</label>
	<input name="search" type="submit" id=Searchsubmit style='display:none;' value=" 搜 索 ">
    <input type="button" name="history" value=" 返 回 " onClick="location.href='HX_Selectuser.asp?formname=<%=formname%>';">
	 <input name="button" type="button" value=" 确 定 " onClick="select_man();"></td>
  </tr>
  <tr id=SearchBarNone style='display:none;'>
    <td>
	<table width="100%"  border="0" cellspacing="１" cellpadding="３">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>按 职 位 查 询</strong></td>
    <td></td>
    <td><strong>按 部 门 查 询</strong></td>
  </tr>
  <tr>
    <td width="44%">
      <select name='WS_Appointment' MULTIPLE style='width:200;height:400'>
                                <%
								if DataBaseType=1 then
									set aprs=WS_S.HX_SetRSD("WS_AppointmentName","HX_Appointment","")
								else
									set aprs=WS_S.HX_SetRSD("distinct WS_AppointmentName","HX_Appointment","")
								end if
							    if aprs.recordcount>0 then								
								do until aprs.eof
							  %>
                                <option value="<%=aprs(0)%>"><%=aprs(0)%></option>
                                <%
								aprs.movenext
								loop
								end if
							   call WS_S.HX_RSClose(aprs)
								%>
                </select>
    </td>
    <td width="4%">&nbsp;</td>
    <td width="52%"><select name='WS_DepartmentName' MULTIPLE style='width:200;height:400'>
                                <%
								if DataBaseType=1 then
								    set aprs=WS_S.HX_SetRSD("WS_DepartmentName","HX_Department","")
								else
									set aprs=WS_S.HX_SetRSD("distinct WS_DepartmentName","HX_Department","")
								end if
							    if aprs.recordcount>0 then								
								do until aprs.eof
							  %>
                                <option value="<%=aprs(0)%>"><%=aprs(0)%></option>
                                <%
								aprs.movenext
								loop
								end if
							   call WS_S.HX_RSClose(aprs)
								%>
                </select></td>
  </tr>
    <tr>
    <td>
      <input type='button' value=' 全 选 ' onclick='func_select_all1();'>
	  <input type='button' value=' 取 消 ' onclick='func_cancel_all1();'>
    </td>
    <td></td>
    <td>
      <input name='button' type='button' onClick='func_select_all2();' value=' 全 选 '>
	  <input type='button' value=' 取 消 ' onclick='func_cancel_all2();'>
    </td>
  </tr>
</table>
</td>
  </tr></form>
</table>
<table width="99%" cellspacing=1 cellpadding=2 align="center" id="SearchNone">
 <form action="" method="post" name="<%=formname%>">
<tr><td>
<table cellpadding="0" cellspacing="0" style="width:100%;height:445px;table-layout:fixed;">
  <tr>
    <td bgcolor="#EEEEEE" valign="top">
	<div style="width:100%;height:445px;overflow:hidden;position:absolute;">
        <div style="position:absolute;left:0px;top:0px;overflow:visible;">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	
<%  
  if WS_DepartmentName<>"" then
  aaa=1
  DepartmentNamearr=split(WS_DepartmentName,",")
  for i=0 to ubound(DepartmentNamearr)
  orderby=""
  if trim(DepartmentNamearr(i))<>"" then orderby=orderby&" where WS_DepartmentName='"&trim(DepartmentNamearr(i))&"'"
  orderby=orderby&" order by WS_OrderBy asc"
  set SERS=WS_S.HX_SetRSD("","HX_Department",orderby)
  if SERS.recordcount>0 then
  do until sers.eof
  %>
  <tr><td>
  <%=sers("WS_DepartmentName")%>
  </td></tr>
  
   <tr>
    <td><table width="98%" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr>
    <td>
	<%
  if WS_Appointment<>"" then ''''''''''''''职位不为空
   Appointmentarr=split(WS_Appointment,",")
   for ii=0 to ubound(Appointmentarr)
   orderby=" where WS_Did="&sers("WS_Did")&" and WS_AppointmentName='"&trim(Appointmentarr(ii))&"' order by WS_OrderBy asc"   
   set APRS=WS_S.HX_SetRSD("","HX_Appointment",orderby)
     if APRS.recordcount>0 then
	   do until APRS.eof
    set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0 order by WS_Uid asc")
	if URS.recordcount>0 then	  
	  do until URS.eof
	   response.write "<input name='Uid"&aaa&"' type='hidden' value='"&urs("WS_Uid")&"'><input type='checkbox' name='name"&aaa&"' value="&urs("WS_Name")&" id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
	   if aaa mod 6=0 then response.Write "<br>"
	   aaa=aaa+1
	  URS.movenext
	  loop
	end if
	   APRS.movenext
        loop
     end if
	next 
	
 else	''''''''''''''''''''''''''''''''''职位为空 
     orderby=" where WS_Did="&sers("WS_Did")&" order by WS_OrderBy asc"
     set APRS=WS_S.HX_SetRSD("","HX_Appointment",orderby)
     if APRS.recordcount>0 then
	   do until APRS.eof
     set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0 order by WS_Uid asc")
	 if URS.recordcount>0 then	  
	  do until URS.eof
	   response.write "<input name='Uid"&aaa&"' type='hidden' value='"&urs("WS_Uid")&"'><input type='checkbox' name='name"&aaa&"' value="&urs("WS_Name")&" id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
	   if aaa mod 6=0 then response.Write "<br>"
	   aaa=aaa+1
	  URS.movenext
	  loop
	end if
	   APRS.movenext
        loop
     end if
	end if 
	
%></td>
  </tr>
</table></td>
  </tr>
  <tr>
     <td height=5><hr width="100%"></td>
   </tr>
 <%
  sers.movenext
  loop
  end if
  next
else  ''部门为空
 dim y
  y=0 
  aaa=1
  set SERS=WS_S.HX_SetRSD("","HX_Department"," order by WS_OrderBy asc")
  if SERS.recordcount>0 then
  do until sers.eof
  %>

  <tr><td width="100%">
  <%=sers("WS_DepartmentName")%>
  </td></tr>
   <tr>
    <td><div id="from<%=y%>"><table width="98%" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr>
    <td><%
 if WS_Appointment<>"" then 
  Appointmentarr=split(WS_Appointment,",")
  for i=0 to ubound(Appointmentarr)
  orderby=" where WS_Did="&sers("WS_Did")&" and WS_AppointmentName='"&trim(Appointmentarr(i))&"' order by WS_OrderBy asc"
  set APRS=WS_S.HX_SetRSD("","HX_Appointment",orderby)
     if APRS.recordcount>0 then
	   do until APRS.eof
        set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0 order by WS_Uid asc")
		if URS.recordcount>0 then		  
		  do until URS.eof
		   response.write "<input name='Uid"&aaa&"' type='hidden' value='"&urs("WS_Uid")&"'><input type='checkbox' name='name"&aaa&"' value="&urs("WS_Name")&" id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
		   if aaa mod 6=0 then response.Write "<br>"
		   aaa=aaa+1
		  URS.movenext
		  loop
	end if
	   APRS.movenext
        loop
     end if
 	next 
else
  orderby=" where WS_Did="&sers("WS_Did")&" order by WS_OrderBy asc"
  set APRS=WS_S.HX_SetRSD("","HX_Appointment",orderby)
     if APRS.recordcount>0 then
	   do until APRS.eof  
  set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0  order by WS_Uid asc")
	if URS.recordcount>0 then	  
	  do until URS.eof
	   response.write "<input name='Uid"&aaa&"' type='hidden' value='"&urs("WS_Uid")&"'><input type='checkbox' name='name"&aaa&"' value="&urs("WS_Name")&" id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
	   if aaa mod 6=0 then response.Write "<br>"
	   aaa=aaa+1
	  URS.movenext
	  loop
	end if 
	  APRS.movenext
        loop
		response.Write"<input type='checkbox' name='checkbox' id='checkall1' value='Check All' onClick='mm1("&y&")' align='absmiddle' class='radio'><label for='checkall1'>全选</label>"
     end if
end if%></td>
  </tr>
</table>
</div>
</td>
  </tr>
  <tr>
     <td height=5><hr width="100%"></td>
   </tr>

 <%
 y=y+1
  sers.movenext
  loop
  end if
end if  
 %></table></div></div></td>
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
     <td height=25 align="right"><input type="checkbox"  name="checkbox" id="checkall1" value="Check All" onClick="mm()" align="absmiddle" class="radio"><label for="checkall1">全选</label>
	 <input name="button" type="button" value=" 确 定 " onClick="select_man();">　 
	 </td>
   </tr>
  </form>
</table>
 <script language="javascript">
function select_man()
{

t=""
u=""
a=""
<% for  n=1 to aaa-1%>
if(<%=formname%>.name<%=n%>!=null)
{

if(<%=formname%>.name<%=n%>.checked==true && <%=formname%>.name<%=n%>.value!=null)
{
	if(t!="") {t+="、";u+="|";}
	{t+=<%=formname%>.name<%=n%>.value;u+=<%=formname%>.Uid<%=n%>.value;}
}
}
<%next%>
t=t+"、";
u="|"+u+"|";
if(t=="、"){
	alert("请选择职位或部门后点“搜索”按钮");

}else{
	opener.<%=formname%>.WS_<%=checkuser%>Name.value=t;
	opener.<%=formname%>.WS_<%=checkuser%>Uid.value=u;
	window.close();
 }
}

function mm()
{
   var a = document.<%=formname%>.getElementsByTagName("input");
   var b = document.getElementById("checkall1");
   if(b.checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
}
function mm1(y)
{
   
   if(y==0)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==1)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==2)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==3)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==4)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==5)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==6)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }
   if(y==7)
   {
   var a = document.getElementById("from"+y).getElementsByTagName("input");
   if(a[1].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
   }

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