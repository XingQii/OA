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
    border: orange 1px solid;
    height: 30px;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
    $(function () {
    var stockOutDate=new Date().toJSON().slice(0,10);
    });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
If Request("action")="add" Then
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from stockIn",conn,1,3
  rsAdd.AddNew
  rsAdd("type")=Request.Form("type")
  rsAdd("name")=Request.Form("name")
  rsAdd("stockInDate")=Request.Form("stockInDate")
  rsAdd("source")=Request.Form("source")
  rsAdd("quantity")=Request.Form("quantity")
  rsAdd("unit")=Request.Form("unit")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update
  Dim rsStock
  set rsStock=Server.CreateObject("ADODB.Recordset")
  rsStock.open "select * from stock where type="&Request.Form("type")&" And name='"&Request.Form("name")&"'",conn,1,3
  If Not rsStock.Eof Then
    rsStock("quantity")=rsStock("quantity")+Request.Form("quantity")
  Else
    rsStock.close
    rsStock.open "select top 1 * from stock",conn,1,3
    rsStock.AddNew
    rsStock("type")=Request.Form("type")
    rsStock("name")=Request.Form("name")
    rsStock("lastestDate")=Request.Form("stockInDate")
    rsStock("source")=Request.Form("source")
    rsStock("quantity")=Request.Form("quantity")
    rsStock("unit")=Request.Form("unit")
    rsStock.update
  End If
  response.Write "<script>alert('提交成功!');location.href='stockList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">投入品入库</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">

        <li>
          <label for="type">投入品类型</label>
          <select name="type" id="type">
          <option value="1">肥料</option>
          <option value="2">农药</option>
          <option value="3">饲料</option>
</select>
          </li>
        <li>
          <label for="name">名称</label><input  type="text" name="name" id="name" required>
        </li>
        <li>
        <label for="stockInDate">入库日期</label>
          <input  type="date" name="stockInDate" id="stockInDate" required>
        </li>
        <li>
        <label for="source">来源</label>
          <input  type="text" name="source" id="source" required>
        </li>
        <li>
        <label for="quantity">数量</label>
          <input  type="number" name="quantity" id="quantity" required>
        </li>
        <li>
        <label for="unit">数量单位</label>
          <input  type="text" name="unit" id="unit" required>
        </li>
        <li>
        <label for="remark">备注</label>
        <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
