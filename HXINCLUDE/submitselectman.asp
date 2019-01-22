<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
option explicit
response.buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
const Dir=1
%>
<!--#INCLUDE FILE="HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="HX_MD5.ASP"-->
<!--#INCLUDE FILE="HX_SETCOOKIE.ASP"-->
<%
action=request("action")
if action="saveinfo" then
   uid=request("uid")
   if uid="" or isnull(uid) then
 	WS_S.HX_Redirect "submitselectman.asp" 
   end if
   ColumnName="":Tablename="HX_WorkFlowTemp"
   uidsarr=split(uid,",")
   for ii=0 to ubound(uidsarr)
   Orderby=" where WS_WorkFlowTempUid="&loginuid&" ORDER BY WS_WorkFlowTempNumber DESC"
  set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
  if rs.recordcount>0 then
   Num=rs("WS_WorkFlowTempNumber")+1
  else
   Num=1
  end if  
   uidarr=split(uidsarr(ii),"|")
   if uidarr(2)<>"" and isnumeric(uidarr(2)) then
    set trs=WS_S.HX_SetRSD(ColumnName,Tablename," where WS_WorkFlowTempUid="&loginuid&" and WS_WorkFlowTempDoManid="&uidarr(2))
     if trs.recordcount<=0 then
       rs.addnew
       rs("WS_WorkFlowTempUid")=loginuid
       rs("WS_WorkFlowTempNumber")=Num
       rs("WS_WorkFlowTempDoManid")=uidarr(2)
       rs("WS_WorkFlowTempAppointment")=uidarr(1)
       rs("WS_WorkFlowTempDepartment")=uidarr(0)
       rs.update
     end if 
    end if
	next
	response.Write "<script>window.opener.location.href='../HXWORKFLOW/WorkFlowAddPathList.asp?file=2';window.close();</script>"
	response.End   
end if
%>
<head>
<title>添加审批人员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<table width="480"  border="0" cellspacing="1" cellpadding="0" align=center bgcolor="#115F8F">
  <tr>
    <td colspan="2" bgcolor=ffffff><table width="480"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" background="../hximages/titleline.gif"><font class="fontmenu">选择审批人员</font></td>
  </tr>
</table>
<table width="99%" cellspacing=1 cellpadding=2 align="center">
 <form action="?action=saveinfo" method="post" name="form1">
  <%  
  set SERS=WS_S.HX_SetRSD("","HX_Department"," order by WS_OrderBy asc")
  if SERS.recordcount>0 then
  do until sers.eof
  %>
  <tr><td width="100%"><font size="2"> 
  <%=sers("WS_DepartmentName")%>
  </td></tr>
  <%set APRS=WS_S.HX_SetRSD("","HX_Appointment"," where WS_Did="&sers("WS_Did")&" order by WS_OrderBy asc")
     if APRS.recordcount>0 then
	   do until APRS.eof
  %>

   <tr>
    <td>&nbsp;&nbsp;<font color="#FF0000"><%=APRS("WS_AppointmentName")%></font><%
	set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0 and WS_Uid<>"&loginuid&" order by WS_Uid asc")
	if URS.recordcount>0 then
	  response.write "　　"
	  do until URS.eof
	   response.write "<input type='checkbox' name='Uid'value='"&sers("WS_Did")&"|"&APRS("WS_Aid")&"|"&urs("WS_Uid")&"|' id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
	   aaa=aaa+1
	  URS.movenext
	  loop
	end if
	%>	
	</td>
  </tr>
  <%    APRS.movenext
        loop
     end if
 %>
  <tr>
     <td height=5></td>
  </tr>
 <%
  sers.movenext
  loop
  end if
 %>
   <tr>
     <td height=25 align="right"><input type="checkbox" name="checkbox" id="checkall" value="Check All" onClick="mm()" align="absmiddle" class="radio"><label for="checkall">全选</label>
	 <input name="button" type="submit" class="button" value=" 确 定 ">　 
	 </td>
   </tr>
 </form>
</table></td>
  </tr>
</table>
<script language=javascript>
function mm()
{
   var a = document.getElementsByTagName("input");
   if(a[0].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
}
</script>