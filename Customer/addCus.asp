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
    select{
    border: 1px solid orange;
    height: 30px;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
    $(function () {
    var establishDate=new Date().toJSON().slice(0,10);
    $("#entryDate").attr("value",establishDate);
    });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
If Request("action")="add" Then
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from Customer",conn,1,3
  rsAdd.AddNew
  rsAdd("id")=Request.Form("id")
  rsAdd("name")=Request.Form("name")
  rsAdd("sex")=Request.Form("sex")
  rsAdd("age")=Request.Form("age")
  rsAdd("BuyDate")=Request.Form("BuyDate")
  rsAdd("remark")=Request.Form("remark")
  rsAdd("BuyNumber")=Request.Form("BuyNumber")
  rsAdd.Update

  response.Write "<script>alert('提交成功!');location.href='customerList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加客户</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">

        <li>
          <label for="name">客户姓名</label>
          <input  type="text" name="name" id="name" required>
          </li>
        <li>
          <label for="id">客户编号</label>
          <input  type="text" name="id" id="id" required>
          </li>
        <li>
          <label for="sex">性别</label>
          <select name="sex" id="sex">
          <option value="1">男</option>
          <option value="2">女</option>
</select>
          </li>
        <li>
          <label for="age">年龄</label>
          <input  type="number" name="age" id="age" required>
          </li>
        <li>
        <label for="BuyDate">购买数量</label>
          <input  type="number" name="BuyNumber" id="BuyNumber" required>
        </li>
        <li>
        <label for="BuyDate">购买时间</label>
          <input  type="date" name="BuyDate" id="BuyDate" required>
        </li>
        <li>
        <label for="remark">备注说明</label>
        <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
