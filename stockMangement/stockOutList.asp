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
    div.ltitle{
    line-height: 40px;
    font-weight: bold;
    margin-left: 12px;
    color: #dc4e00;
    background-color: orange;
    }


  </style>


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%Dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from stockOut where exist=1 ",conn,1,1
%>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">出库记录</a></li>
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
    <th>投入品类型</th>
    <th>投入品名称</th>
    <th>投入日期</th>
    <th>对应产品编号</th>
    <th>来源</th>
    <th>数量</th>
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
     <tr>
    <td><%call inputType(rs("type"))%></td>
    <td><%=rs("name")%></td>
    <td><%=rs("stockOutDate")%></td>
    <td><%=rs("productNumber")%></td>
    <td><%=rs("source")%></td>
    <td><%=rs("quantity")&rs("unit")%></td>
    <td><a href="stockOutDetail.asp?stockOutId=<%=rs("id")%>">查看</a>
    <a href="reviseStockOut.asp?stockOutId=<%=rs("id")%>">修改</a></td>
    </tr>
    <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		loop
		%>
<!--#include virtual = "/index/functions.asp"-->
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
