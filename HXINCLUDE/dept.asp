<!--#INCLUDE HXINCLUDEHEAD.ASP"-->
<title>选择分组</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%orderby=" where 1=1"
if SystemUser<>1 then orderby=orderby&" and WS_Did=" & LOGdepartment
orderby=orderby&" order by WS_Orderby asc"
set ders=WS_S.HX_SetRSD("","HX_Department",Orderby)	 
%>
<script language="JavaScript">
var CUR_ID="<%if ders.recordcount>0 then response.write ders("WS_Did") else response.write "1" %>";
function clickMenu(ID)
{
    targetelement=document.all(CUR_ID);
    if(ID==CUR_ID)
    {
       if (targetelement.style.display=="none")
           targetelement.style.display='';
       else
           targetelement.style.display="none";
    }
    else
    {
       targetelement.style.display="none";
       targetelement=document.all(ID);
       targetelement.style.display="";
    }

    CUR_ID=ID;
}
</script>
<body>
<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>
<%
if ders.recordcount>0 then
	do until ders.eof
%>
<tr class=title onClick="clickMenu('<%=ders("WS_Did")%>')" style="cursor:hand" title="点击伸缩列表">
<td><%=ders("WS_DepartmentName")%></td>
</tr>
<tr class=titletdbg><td id="<%=ders("WS_Did")%>" style="display:none">
<%set rs=WS_S.HX_SetRSD("","HX_Appointment"," where WS_Did="&ders("WS_Did")&" order by WS_OrderBy asc")	 
if rs.recordcount>0 then%>
<table border="0" cellspacing="1" width="100%">
<%do until rs.eof%>
<tr class=titletdbg>
  <td onClick="parent.user.location='user_Department.asp?WS_Did=<%=ders("WS_Did")%>&WS_Aid=<%=rs("WS_Aid")%>';" style="cursor:hand" align=center><%=rs("WS_AppointmentName")%></td>
</tr><%
	rs.movenext
	loop
%>
</table><%end if
rs.close:set rs=nothing%>
</td></tr><%
	ders.movenext
	loop
end if
ders.close:set ders=nothing
%>
<tr class=title><td>自定义</td>
</tr>
<%
set rs=WS_S.HX_SetRSD("","HX_UserGroup"," where WS_Userid="&LoginUID&" order by WS_Orderby asc")	 
if rs.recordcount>0 then
	do until rs.eof
%>
<tr class=titletdbg>
  <td onClick="parent.user.location='user_define.asp?GROUP_ID=<%=rs("WS_UGID")%>';" style="cursor:hand" align=center><%=rs("WS_UserGroupName")%></td>
</tr><%
	rs.movenext
	loop
end if
rs.close:set rs=nothing

%>
</table>

</body>
</html>
