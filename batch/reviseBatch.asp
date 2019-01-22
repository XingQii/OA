<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
  input[type="date"]{
    top: 3px;
    cursor: pointer;
    height: 28px;
    border: orange 1px solid;
  }

  form li{
    margin: 25px 0 25px 40px;
  }
  input[type="date"],input[type="time"]{
    width: 10%;
  }
  input{
    width: 5%;
    vertical-align: middle;
  }
  form li:last-child{
    width: 70%;
    text-align: center;
  }
  input[type="checkbox"]{
    width: auto;
    margin: auto;
  }
  section{
    display: inline;
    vertical-align: middle;
    text-align: left;
  }

  input[type=checkbox]{
    width:2%;
  }
  .forminfo li section{
    width: 100%;
  }
  .forminfo label{
  width: 10%;
  }
  .forminfo input{
  width: 20%;
  }
  input::-webkit-inner-spin-button {
    display: none;
  }
  form{
    margin-top: 2%;
  }
  textarea{
  border: 1px solid orange;
  }
  .forminfo input[type="submit"]{
  background-color: #f74f1d	;
  border: none;
  }

  select{
  border: 1px solid orange;
  height: 30px;
  width: 15%;
  }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
  $(function () {
  var establishDate=new Date().toJSON().slice(0,10);
  });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
Dim rsProductBase
set rsProductBase=Server.CreateObject("ADODB.Recordset")
rsProductBase.open "select * from productBase",conn,1,1
Dim rs
requestExist request("batchId")
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "select * from batch where id="&request("batchId"),conn,1,3
recordSetExist rs
If Request("action")="revise" Then
  requestExistAndAlert Request.Form("productBaseId"),"请选择有效的生产基地！"
  rs("batch")=Request.Form("batch")
  rs("breed")=Request.Form("breed")
  rs("productBaseId")=Request.Form("productBaseId")
  rs("remark")=Request.Form("remark")
  rs.Update

  response.Write "<script>alert('修改成功!');location.href='batchList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">修改批次</a></li>
  </ul>
  </div>

  
  <form action="?action=revise&batchId=<%=rs("id")%>" method="post">
    <ul class="forminfo">

    <li>
      <label for="batch">批次</label><input type="text" name="batch" value="<%=rs("batch")%>" id="batch" required>
      </li>
    <li>
      <label for="breed">品种</label><input type="text" name="breed" value="<%=rs("breed")%>" id="breed" required>
      </li>
    <li><label for="productBaseId">生产基地</label>
      <select name="productBaseId" id="productBaseId">
      <option value="">选择生产基地</option>
      <%Do While Not rsProductBase.Eof%>
      <option value="<%=rsProductBase("id")%>" <%ifSelected rsProductBase("id"),rs("productBaseId")%> ><%=rsProductBase("name")%></option>
      <%rsProductBase.MoveNext
      Loop%>
</select>
    </li>
    <li>
    <label for="remark">详情</label>
    <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
    </li>
    <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
    </ul>

  </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
