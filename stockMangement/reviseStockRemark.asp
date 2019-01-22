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
    input,input[type="date"]{
    border: none;
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
requestExist request("stockId")
Dim rs
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "select * from stock where id="&request("stockId"),conn,1,3
recordSetExist rs
If Request("action")="revise" Then
  rs("remark")=request.Form("remark")
  rs.Update
  response.Write "<script>alert('修改成功!');location.href='stockList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">投入品入库</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&stockId=<%=request("stockId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="type">投入品类型</label>
          <input type="text" name="type" id="type" value="<%inputType rs("type")%>" readonly>
          </li>
        <li>
          <label for="name">投入品名称</label><input  type="text" name="name" id="name" value="<%=rs("name")%>" required readonly>
        </li>
        <li>
        <label for="lastestDate">最后变化日期</label>
          <input  type="date" name="lastestDate" id="lastestDate" value="<%=rs("lastestDate")%>" required readonly>
        </li>
        <li>
        <label for="source">来源</label>
          <input  type="text" name="source" id="source" value="<%=rs("source")%>" required readonly>
        </li>
        <li>
        <label for="quantity">数量</label>
          <input  type="text" name="quantity" id="quantity" value="<%=rs("quantity")&rs("unit")%>" required readonly>
        </li>
        <li>
        <label for="remark">备注</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
