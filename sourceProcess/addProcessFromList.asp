<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>

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
    .forminfo input[type="date"]{
      width: 10%;
    }
    .forminfo input[type="time"]{
      width: 8%;
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
    .forminfo input{
    width: 30%;
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
    border: orange 1px solid;
    height: 30px;
    }
    #productName,#productNumber{
    border: none;
    }
    .forminfo label{
    width: 10%;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
  $(function () {
  var date=new Date().toJSON().slice(0,10);
  var time=new Date().toJSON().slice(11,16);
  $("#date").attr("value",date);
  $("#time").attr("value",time);
  });
  </script>

</head>

<body>
<!--#include File = "../index/connDB.asp"-->
<%
requestExist request("productId")

Dim rsProduct
set rsProduct=Server.CreateObject("ADODB.Recordset")
rsProduct.open "select * from product where id="&request("productId")&" And exist=1",conn,1,1
recordSetExist rsProduct

If Request("action")="add" Then
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from process",conn,1,3
  rsAdd.AddNew
  rsAdd("productId")=request("productId")
  rsAdd("process")=Request.Form("process")
  rsAdd("date")=Request.Form("date")
  rsAdd("time")=Request.Form("time")
  rsAdd("processLog")=Request.Form("processLog")
  rsAdd.Update
  alertAJump "提交成功！","processList.asp"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加溯源流程</a></li>
  </ul>
  </div>
    <form action="?action=add&productId=<%=request("productId")%>" method="post">
      <ul class="forminfo">
        <li>
          <label for="productNumber">产品编号</label>
          <input  type="text" name="productNumber" id="productNumber" required value="<%=rsProduct("number")%>" readonly>
        </li>
        <li>
          <label for="productName">产品名称</label>
          <input  type="text" name="productName" id="productName" readonly required value="<%=rsProduct("name")%>">
        </li>
        <li>
        <label for="process">流程类别</label>
          <input  type="text" name="process" id="process" required>
        </li>
        <li>
        <label for="time">时间</label>
          <input  type="date" name="date" id="date" required>
          <input  type="time" name="time" id="time" required>
        </li>
        <li>
        <label for="processLog">流程记录</label>
        <textarea name="processLog" id="processLog" cols="90" rows="20"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>
<script>
</script>
</html>
