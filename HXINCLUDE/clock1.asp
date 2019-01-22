<!--#INCLUDE HXINCLUDEHEAD.ASP"-->
<%FIELDNAME=request("FIELDNAME")%>
<head>
<title>时钟</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language=javascript>
var parent_window = window.dialogArguments;
function check_form()
{
    var date_time=parent_window.<%=FIELDNAME%>.value;
    var cur_time=form1.hour.value+":"+form1.minite.value+":"+form1.second.value;

    if(parent_window.<%=FIELDNAME%>.value=="")
       parent_window.<%=FIELDNAME%>.value=cur_time;
    else
    {
       var len=date_time.indexOf(" ");
       if(len<0)
          len=date_time.length;
		if(date_time.substr(0,len)!=null){
       		parent_window.<%=FIELDNAME%>.value=cur_time;
			}
    }
    window.close();
}
</script>

<body bgcolor="D4D0C8" scroll="no" style="text-align:center"><br>
<form name="form1">
时间：<select name=hour style="width:50px">
<%for i=0 to 23
if i<=9 then msg="0"&i else msg=i
%><option value=<%=msg%><%if i=hour(now) then response.Write " selected"%>><%=msg%></option><%next%>
</select>
：<select name=minite style="width:50px">
<%for i=0 to 59
if i<=9 then msg="0"&i else msg=i
%><option value=<%=msg%><%if i=minute(now) then response.Write " selected"%>><%=msg%></option><%next%></select>
：<select name=second style="width:50px">
<%for i=0 to 59
if i<=9 then msg="0"&i else msg=i
%><option value=<%=msg%><%if i=second(now) then response.Write " selected"%>><%=msg%></option><%next%></select>
<br>
<br>
<input type=button  onClick="check_form();" value=" 确 定 " class="BigButton">
</form>
</body>
</html>