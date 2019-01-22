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
    table-layout:fixed;
    }
    
  input[type="button"],form input[type=submit]{
  background-color: orange;
  width: 10%;
  height: 30px;
  vert-align: middle;
  margin: 5px;
  }
  section{
  margin-left: 2%;
  }
  section form select{
  width: 10%;
  }
  input,select{
    cursor: pointer;
    height: 28px;
    border: orange 1px solid;
  }
  .forminfo input[type="submit"]{
  background-color: #f74f1d	;
  border: none;
  }

  select{
  border: 1px solid orange;
  height: 30px;
  }
  </style>

<link rel="stylesheet" href="/css/focus.css">
</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<!--#include file="../index/pagination.asp" -->
<%Dim rs,rsLevel
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from dealer order by id desc",conn,1,1


%>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">商家列表</a></li>
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
    <th>商家名称</th>
    <th>商家类型</th>
    <th>销售产品类别</th>
    <th>是否合作</th>
    <th>级别</th>
    <th>查看详情</th>
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
	Do while not rs.EOF %>
     <tr>
    <td><%=rs("dealerName")%></td>
    <td><%dealerType rs("dealerType")%></td>
    <td><%=rs("productType")%></td>

    <td><%Select Case rs("whetherCooperation")
    Case true response.Write "是"
    Case false response.Write "否"
    End Select%></td>

    <td><%getLevel rs("level")%></td>
     <td>
       <a href="dealerDetail.asp?dealerId=<%=rs("id")%>">查看详情</a>
      <a href="updateDealer.asp?dealerId=<%=rs("id")%>">修改</a>

     </td>
    </tr>
  <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		Loop
		%>
     
  </tbody>
</table>
<div style="text-align:center">
  	<%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "")
			Response.Write ps
		%>
</div>
<%end if%>
<!--#include virtual = "/index/functions.asp"-->

</body>
</html>
