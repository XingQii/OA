<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
  .select-box{

    width: 10%;
  }
  input[type="date"],.select-box{
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
  datalist{
    height: 28px;
    border: orange 1px solid;
  }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
  $(function () {
  var dateNow=new Date().toJSON().slice(0,10);
  var timeNow=new Date().toJSON().slice(0,16);
  $("#dateStart").attr("value",dateNow);
  $("#dateEnd").attr("value",dateNow);  $("#timeStart").attr("value",timeNow.slice(11,16));
  $("#timeEnd").attr("value",timeNow.slice(11,16));
  
  });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
Dim rsBatch
set rsBatch=Server.CreateObject("ADODB.Recordset")
rsBatch.open "select batch from batch",conn,1,1

If Request("action")="add" Then

Dim rsBatchId
set rsBatchId=Server.CreateObject("ADODB.Recordset")
rsBatchId.open "select id from batch where batch='"&Request.Form("batch")&"'",conn,1,1
rsExistAndAlert rsBatchId,"找不到输入的批次，请重新输入！"
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from product",conn,1,3
  rsAdd.AddNew
  rsAdd("name")=Request.Form("name")
  rsAdd("number")=Request.Form("number")
  rsAdd("category")=Request.Form("category")
  rsAdd("batchId")=rsBatchId("id")
  rsAdd("detail")=Request.Form("detail")
  rsAdd("sourceNumber")=produceRND
  rsAdd.Update

  response.Write "<script>alert('提交成功!');location.href='productList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加产品</a></li>
  </ul>
  </div>

  
  <form action="?action=add" method="post">
    <ul class="forminfo">

    <li>
      <label for="name">产品名称</label><input  type="text" name="name" id="name" required>
      </li>
    <li>
      <label for="number">产品编号</label><input  type="text" name="number" id="number" required>
      </li>
    <li><label for="category">产品类型</label>
      <input  type="text" name="category" id="category" required>
    </li>
    <li>
    <label for="batch">产品批次</label>
    <input list="batch" name="batch">
    <datalist id="batch">
    <%Do while Not rsBatch.Eof%>
      <option value="<%=rsBatch("batch")%>">
    <%rsBatch.MoveNext
    Loop
    %>
    </datalist>
    </li>
    <li>
    <label for="detail">详情</label>
    <textarea name="detail" id="detail" cols="90" rows="10"></textarea>
    </li>
    <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
    </ul>

  </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
