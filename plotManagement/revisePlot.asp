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

  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("plotId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from plotProductName where id="&request("plotId"),conn,1,3
  recordSetExist rs

If Request("action")="revise" Then
 requestExistAndAlert Request.Form("productName"),"找不到对应于产品编号的产品！请通过自动填写的产品名称确定正确编号！"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from productBase where name='"&Request.Form("productBase")&"'",conn,1,1
  rsExistAndAlert rsBase,"找不到对应的基地名称，请重新填写！"
  rs("plotNumber")=Request.Form("plotNumber")
  rs("productBaseId")=rsBase("id")
  rs("productId")=Request.Form("productId")
  rs("remark")=Request.Form("remark")
  rs.Update

  response.Write "<script>alert('修改成功!');location.href='plotList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">修改地块</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&plotId=<%=request("plotId")%>" method="post">
      <ul class="forminfo">
        <li>
        <label for="plotNumber">地块编号</label>
          <input  type="text" name="plotNumber" id="plotNumber" value="<%=rs("plotNumber")%>" required>
        </li>
        <li>
        <label for="productBase">所在生产基地</label>
        <input  type="text" name="productBase" id="productBase" value="<%=rs("baseName")%>" required>
        </li>
        <li>
          <label for="productNumber">当前培育产品编号</label>
          <input  type="text" name="productNumber" id="productNumber" value="<%=rs("number")%>" required>
        </li>
        <li>
          <label for="productName">当前培育产品名称</label>
          <input  type="text" name="productName" id="productName" readonly required value="<%=rs("productName")%>">
          <input  type="text" name="productId" id="productId" value="<%=rs("productId")%>" hidden>
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
