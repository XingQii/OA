<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
  <title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  <style type="text/css">

    .inputs{
    display: inline-block;
    margin: 5px;
    }
    div+section.inputs{
    width: 30%;
    }
    .inputs form{
        vertical-align: middle;

    }
    .inputs select{
    border: 1px solid orange;
    height: 30px;
    }
    .inputs input[type="submit"]{
    height: 30px;
    }
    section,section form{
    display: inline;
    width: 50%;
    vertical-align: middle;
    }
    section input[type="submit"]{
    background-color: orange;
    padding: 0 5px 0 5px;
    vertical-align: middle;
    }
    .tablelist td{
    text-align: center;
    }
    .tablelist input[type="text"]{
    width: 80%;
    text-align: center;
    vertical-align: middle;
    }
    .tablelist select{
    height: 30px;
    border: 1px orange solid;
    }
    .tablelist input[type="submit"]{
    background:none;
    border: none;
    }
  </style>
  <link rel="stylesheet" href="../css/focus.css">
</head>


<body>

<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%Dim rs
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from category",conn,1,3
If request("action")="add" Then
  rs.AddNew
  rs("category")=request.Form("newCategory")
  rs.Update
response.Write "<script>alert('添加成功!');location.href='addCategory.asp';</script>"
End If
If request("action")="update" Then
  rs.close
  rs.open "select * from category where id='"&request("categoryId")&"'",conn,1,3
  If Not rs.Eof Then
    rs("category")=request.Form("updateCategory")
    rs("exist")=request.Form("updateExist")
    rs.Update
  End If
  response.Write "<script>alert('修改成功!');location.href='addCategory.asp';</script>"
End If
If request("action")="search" Then
  rs.close
  rs.open "select * from category where category Like '%"&request.Form("searchText")&"%'",conn,1,1
End If
%>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加产品类别</a></li>
  </ul>
</div>

<section class="inputs">
  <form action="?action=search" method="post">
    <label for="searchText">搜索产品类别：</label>
    <input type="text" name="searchText">
    <input type="submit" value="搜索">
  </form>
</section>
<section class="inputs">
  <form action="?action=add" method="post">
    <label for="newCategory">添加产品类别：</label>
    <input type="text" name="newCategory">
    <input type="submit" value="添加">
  </form>
</section>

<%
if rs.recordcount=0 then
response.write "<div>暂无信息</div>"
else
%>
  <table class="tablelist">
    <tr>
      <th>产品类别名</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
    <tbody>
    <%
    Dim count,caculate
    count=0
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

    <form action="?action=update&categoryId=<%=rs("id")%>" method="post">
    <tr <%
      caculate=count mod 2
      If caculate=0 Then%>
      style="background: #F9ECD9"
      <%End If%>
    >
      <td><input type="text" value="<%=rs("category")%>" name="updateCategory"></td>

      <td>
      <select name="updateExist" id="updateExist">
      <option value="true">可选</option>
      <option value="false" <%If rs("exist")=false Then response.Write "selected='selected'"%>>不可选</option>
</select>
</td>
      <td><input type="submit" value="提交修改"></td>
      
    </tr>
    </form>
    </tbody>
    <%
  
    k=k+1
    if k>=rs.PageSize then Exit Do
    count=count+1
    rs.MoveNext
    Loop%>
  </table>
<div style="text-align:center">
  <%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "evectionApply.asp")
  Response.Write ps
  %>
</div>
<%end if%>


</body>

</html>
