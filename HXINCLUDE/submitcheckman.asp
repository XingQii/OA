<!--#INCLUDE HXINCLUDEHEAD.ASP"-->
<%action=request("action")%>
<head>
<title>添加审批人员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>
<tr class="Navigation"><td colspan="3">选择审批人员</td>
  </tr></table><br>

<%
select case action
  case "del"
     WS_WTID=request("WS_WTID")
	 if WS_WTID="" or isnull(WS_WTID) or (WS_WTID<>"" and not isnumeric(WS_WTID)) then
 	   HX_GoBack "非法操作",""
    end if
	conn.execute("delete from HX_WorkFlowTemp where WS_WTID="&WS_WTID)
	 WS_S.HX_Redirect "submitcheckman.asp?action=saveinfo&WSOA=View"
  case "saveinfo"
  if request("WSOA")<>"View" then
    uid=request("uid")
   if uid="" or isnull(uid) then
 	WS_S.HX_Redirect "submitcheckman.asp" 
   end if
   Orderby=" where WS_WorkFlowTempUid="&loginuid&" ORDER BY WS_WorkFlowTempNumber DESC"
  else
   Orderby=" where WS_WorkFlowTempUid="&loginuid&" ORDER BY WS_WorkFlowTempNumber ASC"
  end if 
   ColumnName="":Tablename="HX_WorkFlowTemp"
   set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
 if request("WSOA")<>"View" then 
  if rs.recordcount>0 then
   Num=rs("WS_WorkFlowTempNumber")+1
  else
   Num=1
  end if
  uidarr=split(uid,"|")
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
	   WS_S.HX_Redirect "submitcheckman.asp?action=saveinfo&WSOA=View"
     end if 
    end if
 end if   
%>
<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>
                                <tr class="title"> 
                                  <td width="11%">序号</td>
                                  <td width="26%">批阅人员姓名</td>
                                  <td width="24%">所在部门</td>
                                  <td width="24%">职务</td>
								  <td width="15%">删除</td>
                                </tr>
                                <%
							if rs.recordcount<=0 then
								response.Write "<tr><td colspan=5 class=titletdbg align=center>暂无记录！</td></tr>"
							else
								do until rs.eof
								Call WS_S.HX_OutUserInfo(rs("WS_WorkFlowTempDoManid"))
								%> 
                                <tr class=titletdbg> 
                                  <td width="11%"><%=rs("WS_WorkFlowTempNumber")%></td>
                                  <td width="26%"><%=OutName%></td>
                                  <td width="24%"><%=OutAppointment%>&nbsp;</td>
                                  <td width="24%"><%=Outdepartment%></td>
								  <td width="15%"><a href="?action=del&WS_WTID=<%=rs("WS_WTID")%>">删除</a></td>
                              </tr>
                                <%
								rs.movenext
								loop	
							end if
								WS_S.HX_RSClose rs
								%>
								<tr class="titletdbg">
                                  <td colspan="5" align=right><a href="submitcheckman.asp">继续选择</a>&nbsp;&nbsp;<a href="#" onClick="javascript:window.opener.location.href='../HXWORKFLOW/WorkFlowAddPathList.asp?file=1';window.close();">确定</a>&nbsp;&nbsp;</td>
                                </tr>  
                              </table>
<%
  case else
%>
<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>
  <form action="?action=saveinfo" method="post" name="form1"><%
  set SERS=WS_S.HX_SetRSD("","HX_Department"," order by WS_OrderBy asc")
  if SERS.recordcount>0 then
  do until sers.eof
  %>
  <tr class="titletdbg"><td width="100%">
  <%=sers("WS_DepartmentName")%> 
  </td></tr>
  <%set APRS=WS_S.HX_SetRSD("","HX_Appointment"," where WS_Did="&sers("WS_Did")&" order by WS_OrderBy asc")
     if APRS.recordcount>0 then
	   do until APRS.eof
  %>

   <tr class="titletdbg">
    <td>&nbsp;&nbsp;<font color="#FF0000"><%=APRS("WS_AppointmentName")%></font><%
	set URS=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_department="&sers("WS_Did")&" and WS_Appointment="&APRS("WS_Aid")&" and WS_leave=0 and WS_Uid<>"&loginuid&" order by WS_Uid asc")
	if URS.recordcount>0 then
	  response.write "　　"
	  do until URS.eof
	   response.write "<input type=""radio"" name=""uid"" class=""radio"" value='"&sers("WS_Did")&"|"&APRS("WS_Aid")&"|"&urs("WS_Uid")&"|' id='WSOA"&urs("WS_Uid")&"'><label for='WSOA"&urs("WS_Uid")&"'><font color=blue>"&URS("WS_Name")&"</font></label>&nbsp;&nbsp;"
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
  <tr class="titletdbg">
     <td height=3></td>
  </tr>
 <%
  sers.movenext
  loop
  end if
 %>
   <tr>
     <td height="25" align="right">	   
	   <input name="submit" type="submit" class="button" value=" 确 定 ">
	 <input name="submit" type="button" class="button" value="已选员工" onClick="location.href='submitcheckman.asp?action=saveinfo&WSOA=View';">
	 <input name="submit" type="button" class="button" value=" 关 闭 " onClick="javascript:window.close();">	 </td>
  </tr></form>
</table>
<%end select%>
