<!--#INCLUDE FILE="HXINCLUDEHEAD.ASP"-->
<%
dim WS_department
formname=request("formname")
action=request("action")
WS_Appointment=trim(request("WS_Appointment"))
WS_DepartmentName=trim(request("WS_DepartmentName"))
checkuser=request("checkuser")
WS_department=trim(request("WS_department"))
ColumnName="":Tablename="HX_CustomerSegment":action=request("action"):Orderby=" order by WS_OrderBy"
set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
%>
<head>
<title>选择员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="D4D0C8">
<table width="99%" cellspacing=1 cellpadding=2 align="center" id="SearchNone">
<form>
     <tr>
	 <td>
	 选择客户类别<select name="Cid">
	               <option value="">请选择客户类别</option>
				   <%if rs.recordcount>0 then
			     do while not rs.eof
			   %>
				<option value="<%=rs("id")%>"><%=rs("WS_CustomerSegment")%></option>
				<%
				rs.movenext
				loop
				end if%>
	 </select>
	 <input type="hidden" value="<%=formname%>" name="formname">
	 <input type="hidden" value="<%=WS_Appointment%>" name="WS_Appointment">
	 <input type="hidden" value="<%=WS_DepartmentName%>" name="WS_DepartmentName">
	 <input type="hidden" value="<%=checkuser%>" name="checkuser">
	 <input type="hidden" value="<%=WS_department%>" name="WS_department">
	 </td>
	 </tr>
	 <tr>
	 <td>
	 <input type="submit" value=" 搜索 " class="button">
	 </td>
	 </tr>
</form>
 <form action="" method="post" name="<%=formname%>">
 <div style="width:100%;height:170px;overflow:hidden;position:absolute;"> 
        <div style="position:absolute;left:0px;top:0px;overflow:visible;"> 

  <tr><td>
 <%
  dim y
  y=1
  aaa=1
  sql=" where 1=1"
  if trim(request("Cid"))<>"" then
  sql=sql&" and id="&request("Cid")&""
  end if
  set SERS=WS_S.HX_SetRSD("","HX_CustomerSegment",sql)
  if SERS.recordcount>0 then
  do until sers.eof
  %> 
  <tr><td width="100%"><font size="2"> 
  <%=sers("WS_CustomerSegment")%></font>
  </td></tr>

   
   <tr> 
    <td> <div id="div<%=y%>"><table><tr><td>
<%
    set URS=WS_S.HX_SetRSD("","MJ_CustomerInformation"," where WS_DepartmentID="&LOGdepartment&" and Cid="&sers("id")&"   order by id asc")
	if URS.recordcount>0 then
	  response.write "　　"
	  do until URS.eof
	   response.write "<input name='Uid"&aaa&"' type='hidden' value='"&urs("id")&"'><input type='checkbox' name='name"&aaa&"' value="&urs("UnitName")&" id='WSOA"&urs("id")&"'><label for='WSOA"&urs("id")&"'><font color=blue>"&URS("UnitName")&"</font></label>&nbsp;&nbsp;"
	   aaa=aaa+1
	  URS.movenext
	  loop
	  response.Write"<input type='checkbox' name='checkbox' id='checkall1' value='Check All' onClick='mm1("&y&")' align='absmiddle' class='radio'><label for='checkall1'>全选</label>"
	end if
	%>	
	</td> 
  </tr ></table>
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
 
 %>

  <tr>
     <td height=25 align="right"><input type="checkbox" name="checkbox" id="checkall1" value="Check All" onClick="mm()" align="absmiddle" class="radio"><label for="checkall1">全选</label>
	 <input name="button" type="button" value=" 确 定 " onClick="select_man();">　 
	 </td>
   </tr>
   </td>
   </tr>
   </div>
   </div>
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
opener.<%=formname%>.WS_<%=checkuser%>Name.value=t;
opener.<%=formname%>.WS_<%=checkuser%>ID.value=u;
window.close()
}

function mm()
{
   var a = document.<%=formname%>.getElementsByTagName("input");
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
function mm1(y)
{
   if(y==1)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==8)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==9)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==10)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==11)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==12)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==13)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==14)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==15)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
   if(y==16)
   {
   var a = document.getElementById("div"+y).getElementsByTagName("input");
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
