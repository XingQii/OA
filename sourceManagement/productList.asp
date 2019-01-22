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

     section{
     margin: 5px 0 5px 2%;
     }
     section input[type="submit"],section input[type="button"]{
     background-color: orange;
     padding: 0 8px 0 8px;
     margin-left: 1%;
     width: 14%;
     }
     section select{
     border: orange 1px solid;
     height:30px ;
     width: 10%;
     }


  </style>


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%
  Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from product where exist=1",conn,1,1

If request("action")="search" Then
  rs.close
  Dim strSearch
  strSearch="select * from product where 1=1"
  If request.Form("searchSourceNumber")<>"" Then
    strSearch=strSearch&" And sourceNumber Like '%"&request.Form("searchSourceNumber")&"%'"
  End If
  If request.Form("searchProduct")<>"" Then
    strSearch=strSearch&" And name Like '%"&request.Form("searchProduct")&"%'"
  End If
  If request.Form("searchProductNumber")<>"" Then
    strSearch=strSearch&" And number Like '%"&request.Form("searchProductNumber")&"%'"
  End If
  If request.Form("searchSourceCategory")<>"" Then
    strSearch=strSearch&" And category Like '%"&request.Form("searchSourceCategory")&"%'"
  End If
  strSearch=strSearch&" order by id desc"
  rs.open strSearch,conn,1,1
End If
%>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">产品列表</a></li>
  </ul>
</div>
<!--
<section>
  <input type="button" onclick="location.href='productList.asp?action=produceSoNo'" value="生成缺失溯源码">
</section>-->

<section>
  <form action="?action=search" method="post">
  <label for="searchSourceNumber">溯源码：</label>
  <input type="text" name="searchSourceNumber" id="searchSourceNumber"  value="<%=request.Form("searchSourceNumber")%>">
  <label for="searchProduct">产品名称：</label>
  <input type="text" name="searchProduct" id="searchProduct"  value="<%=request.Form("searchProduct")%>">
  <label for="searchProductNumber">产品编号：</label>
  <input type="text" name="searchProductNumber" id="searchProductNumber"  value="<%=request.Form("searchProductNumber")%>">
  <label for="searchSourceCategory">产品类型：</label>
  <input type="text" name="searchSourceCategory" id="searchSourceCategory"  value="<%=request.Form("searchSourceCategory")%>">

  <input type="submit" value="搜索">
  </form>
</section>
 <%
		if rs.recordcount=0 then
	  response.write "<div>暂无信息</div>"
	else
	%>

<table class="tablelist">
  <thead>
  <tr>
    <th>溯源码</th>
    <th>产品名称</th>
    <th>产品编号</th>
    <th>被查询次数</th>
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
    <td><%=rs("sourceNumber")%></td>
    <td><%=rs("name")%></td>
    <td><%=rs("number")%></td>
    <td><%=rs("searchTimes")%></td>
    <td>
    <a href="../product/productDocument.asp?productId=<%=rs("id")%>&action=checkDoc">查看档案</a>
    </td>
    </tr>
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
<!--#include virtual = "/index/functions.asp"-->

</body>
</html>
