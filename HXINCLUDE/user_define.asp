<!--#INCLUDE HXINCLUDEHEAD.ASP"-->
<%
GROUP_ID=request("GROUP_ID")
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script Language="JavaScript">
var parent_window = parent.dialogArguments;

function click_user(user_id)
{
  TO_VAL=parent_window.form1.send_no.value;
  targetelement=document.all(user_id);
  user_name=targetelement.name;

  if(TO_VAL.indexOf(","+user_id+",")>0 || TO_VAL.indexOf(user_id+",")==0)
  {
    if(TO_VAL.indexOf(user_id+",")==0)
    {
       parent_window.form1.send_no.value=parent_window.form1.send_no.value.replace(user_id+",","");
       parent_window.form1.TO_NAME.value=parent_window.form1.TO_NAME.value.replace(user_name+",","");
       borderize_off(targetelement);
    }
    if(TO_VAL.indexOf(","+user_id+",")>0)
    {
       parent_window.form1.send_no.value=parent_window.form1.send_no.value.replace(","+user_id+",",",");
       parent_window.form1.TO_NAME.value=parent_window.form1.TO_NAME.value.replace(","+user_name+",",",");
       borderize_off(targetelement);
    }
  }
  else
  {
    parent_window.form1.send_no.value+=user_id+",";
    parent_window.form1.TO_NAME.value+=user_name+",";
    borderize_on(targetelement);
  }
}

function borderize_on(targetelement)
{
 color="#5170A7";
 targetelement.style.borderColor="black";
 targetelement.style.backgroundColor=color;
 targetelement.style.color="white";
 targetelement.style.fontWeight="bold";
}

function borderize_off(targetelement)
{
  targetelement.style.backgroundColor="";
  targetelement.style.borderColor="";
  targetelement.style.color="";
  targetelement.style.fontWeight="";
}

function begin_set()
{
  TO_VAL=parent_window.form1.send_no.value;

  for (step_i=0; step_i<document.all.length; step_i++)
  {
    if(document.all(step_i).className=="menulines")
    {
       user_id=document.all(step_i).id;
       if(TO_VAL.indexOf(","+user_id+",")>0 || TO_VAL.indexOf(user_id+",")==0)
          borderize_on(document.all(step_i));
    }
  }
}

function add_all()
{
  TO_VAL=parent_window.form1.send_no.value;
  for (step_i=0; step_i<document.all.length; step_i++)
  {
    if(document.all(step_i).className=="menulines")
    {
       user_id=document.all(step_i).id;
       user_name=document.all(step_i).name;

       if(TO_VAL.indexOf(","+user_id+",")<0 && TO_VAL.indexOf(user_id+",")!=0)
       {
         parent_window.form1.send_no.value+=user_id+",";
         parent_window.form1.TO_NAME.value+=user_name+",";
         borderize_on(document.all(step_i));
       }
    }
  }
}

function del_all()
{
  for (step_i=0; step_i<document.all.length; step_i++)
  {
    TO_VAL=parent_window.form1.send_no.value;
    if(document.all(step_i).className=="menulines")
    {
       user_id=document.all(step_i).id;
       user_name=document.all(step_i).name;
       if(TO_VAL.indexOf(user_id+",")==0)
       {
          parent_window.form1.send_no.value=parent_window.form1.send_no.value.replace(user_id+",","");
          parent_window.form1.TO_NAME.value=parent_window.form1.TO_NAME.value.replace(user_name+",","");
          borderize_off(document.all(step_i));
       }
       if(TO_VAL.indexOf(","+user_id+",")>0)
       {
          parent_window.form1.send_no.value=parent_window.form1.send_no.value.replace(","+user_id+",",",");
          parent_window.form1.TO_NAME.value=parent_window.form1.TO_NAME.value.replace(","+user_name+",",",");
          borderize_off(document.all(step_i));
       }
    }
  }
}

function set_user()
{
  URL="set_user.asp";
  myleft=(screen.availWidth-600)/2;
  window.open(URL,null,"height=450,width=600,status=1,toolbar=no,menubar=no,location=no,scrollbars=yes,top=150,left="+myleft+",resizable=yes");
}
</script>
<body class="bodycolor" topmargin="0" leftmargin="0" onLoad="begin_set()">

<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>
<%
Orderby=" where WS_Userid="&LoginUID
if WS_S.HX_Isnum(GROUP_ID) then Orderby=Orderby&" and WS_UGID="&GROUP_ID
Orderby=Orderby&" order by WS_Orderby asc"
set rs=WS_S.HX_SetRSD("","HX_UserGroup",Orderby)	 
if rs.recordcount>0 then
%>
<tr class=title><td colspan="2" align="center"><%=rs("WS_UserGroupName")%></td>
</tr>
<tr class="titletdbg">
  <td onClick="javascript:add_all();" style="cursor:hand" align="center" colspan="2">全部添加</td>
</tr>
<tr class="titletdbg">
  <td onClick="javascript:del_all();" style="cursor:hand" align="center" colspan="2">全部删除</td>
</tr><%
	set urs=WS_S.HX_SetRSD("","HX_UserList"," where WS_Userid="&LoginUID&" and WS_UGID="&rs("WS_UGID")&" order by WS_Orderby asc")
	if urs.recordcount>0 then
		do until urs.eof
	%>
	<tr id="<%=trim(urs("WS_UserListMoblie"))%>" name="<%=trim(urs("WS_UserListName"))%>" bgcolor="#F1F1F1" onClick="javascript:click_user('<%=trim(urs("WS_UserListMoblie"))%>')" class="menulines" style="cursor:hand" align="center">
	  <td><%=trim(urs("WS_UserListName"))%></td><td><%=trim(urs("WS_Content"))%></td>
	</tr>
	<%
		urs.movenext
		loop
	end if
	urs.close:set urs=nothing
end if
rs.close:set rs=nothing%>
</table>
</body>
</html>