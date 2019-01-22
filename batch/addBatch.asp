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


If Request("action")="add" Then
  requestExistAndAlert Request.Form("productBaseId"),"请选择有效的生产基地！"
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from batch",conn,1,3
  rsAdd.AddNew
  rsAdd("batch")=Request.Form("batch")
  rsAdd("breed")=Request.Form("breed")
  rsAdd("productBaseId")=Request.Form("productBaseId")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update

  response.Write "<script>alert('提交成功!');location.href='batchList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加批次</a></li>
  </ul>
  </div>

  
  <form action="?action=add" method="post">
    <ul class="forminfo">

    <li>
      <label for="batch">批次</label><input type="text" name="batch" id="batch" required>
      </li>
    <li>
      <label for="breed">品种</label><input type="text" name="breed" id="breed" required>
      </li>
    <li><label for="productBaseId">生产基地</label>
      <select name="productBaseId" id="productBaseId">
      <option value="">选择生产基地</option>
      <%Do While Not rsProductBase.Eof%>
      <option value="<%=rsProductBase("id")%>"><%=rsProductBase("name")%></option>
      <%rsProductBase.MoveNext
      Loop%>
</select>
    </li>
    <li>
    <label for="remark">详情</label>
    <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
    </li>
    <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
    </ul>

  </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
