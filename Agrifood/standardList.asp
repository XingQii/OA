<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    td{
    text-align: center;
  
    width: 100%;
    word-break: keep-all;
    white-space:nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    }
    tbody tr:nth-child(even){
    background: #F9ECD9;
    }
    .tablelist th{
    vertical-align: middle;
    text-align: center;
  
    }
    table{
    table-layout: fixed;
    }
  </style>


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%Dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from netStandard where exist=1 ",conn,1,1
%>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">网贷标准列表</a></li>
  </ul>
</div>
 <%
		if rs.recordcount=0 then
	  response.write "<div>暂无信息</div>"
	else
	%>

<table class="tablelist">
  <thead>
  <tr>
    <th>网贷化标准编号</th>
    <th>网贷化标准类别</th>
    <th>网贷人性别</th>
    <th>网贷人年龄</th>
    <th>网贷时间</th>
    <th>备注说明</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
     <%
		i=0
		rs.PageSize =12 '每页记录条数
		iCount=rs.RecordCount '记录总数
		iPageSize=rs.PageSize
		maxpage=rs.PageCount 
		page=request("page")  
		if Not IsNumeric(page) or page="" then
			page=1
		else
			page=cint(page)
		end if  
		if page<1 then
			page=1
		elseif  page>maxpage then
			page=maxpage
		end if  
		rs.AbsolutePage=Page
	k=0
	do while not rs.EOF
%>
<%
  Dim I   
  For I=1 To  rs.PageCount 
    if rs.EOF then Exit for
      Response.write"<tr>"
      Response.Write"<td>"&rs("id")&"</td>"
      Response.Write"<td>"&rs("name")&"</td>"
      Response.Write"<td>"&rs("sex")&"</td>"
      Response.Write"<td>"&rs("age")&"</td>"
      Response.Write"<td>"&rs("date")&"</td>"
      Response.Write"<td>"&rs("remark")&"</td>"
      Response.Write"<td>"&"<a href='standardDetail.asp?ID="&rs("id")&"'"&">查看</a><a href='standardRevise.asp?Id="&rs("id")&"'"&"> 修改</a></td>"
      Response.write"</tr>"
  Next
%>
    <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		loop
		%>
     
  </tbody>
</table>
<div style="text-align:center">
  	<%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "leavelist.asp")
			Response.Write ps
		%>
</div>
  <%end if%>

</body>
</html>
