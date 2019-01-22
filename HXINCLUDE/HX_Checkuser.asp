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
<head>
<title>选择员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="D4D0C8" scroll=no>
<div style="overflow:auto; width:500px; height:450px;" >
<table width="99%" cellspacing=1 cellpadding=2 align="center">

  <%
  checkuser=request("checkuser")
  set SERS=WS_S.HX_SetRSD("","HX_Department"," order by WS_OrderBy asc")
  if SERS.recordcount>0 then
  do until sers.eof
  %>
  <tr><td width="100%">
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
	   response.write "<input type=""radio"" name=""uid"" class=""radio"" onclick=""javascript:window.opener.document.form1.WS_"&checkuser&"Uid.value='"&URS("WS_Uid")&"';window.opener.document.form1.WS_"&checkuser&"Name.value='"&sers("WS_DepartmentName")&APRS("WS_AppointmentName")&URS("WS_Name")&"';window.close();"" id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
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
     <td height=5><hr width="100%"></td>
   </tr>
 <%
  sers.movenext
  loop
  end if
 %>
</table>
</div>