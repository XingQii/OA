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
requestExist request("farmId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from farm where id="&request("farmId"),conn,1,3
  recordSetExist rs

If Request("action")="revise" Then
 requestExistAndAlert Request.Form("farmNumber"),"找不到对应于产品编号的产品！请通过自动填写的产品名称确定正确编号！"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from farm where farmNumber='"&Request.Form("farmNumber")&"'",conn,1,1
  rsExistAndAlert rsBase,"找不到对应的农场编号，请重新填写！"
  rs("farmNumber")=Request.Form("farmNumber")
  rs("farmName")=rsBase("farmNumber")
  rs("farmPlace")=Request.Form("farmPlace")
  rs("farmProductNumber")=Request.Form("farmProductNumber")
  rs("farmRemark")=Request.Form("farmRemark")
  rs.Update

  response.Write "<script>alert('修改成功!');location.href='farmList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">修改农场</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&farmId=<%=request("farmId")%>" method="post">
      <ul class="forminfo">
        <li>
        <label for="farmNumber">农场编号</label>
          <input  type="text" name="farmNumber" id="farmNumber" value="<%=rs("farmNumber")%>" required>
        </li>
        <li>
        <label for="farmPlace">农场所在的位置</label>
        <input  type="text" name="farmPlace" id="farmPlace" value="<%=rs("farmPlace")%>" required>
        </li>
        <li>
          <label for="farmProductNumber">培育产品种数</label>
          <input  type="text" name="farmProductNumber" id="farmProductNumber" value="<%=rs("farmProductNumber")%>" required>
        </li>
        <li>
          <label for="farmName">家庭农场名称</label>
          <input  type="text" name="farmName" id="farmName" readonly required value="<%=rs("farmName")%>">
          <input  type="text" name="id" id="id" value="<%=rs("id")%>" hidden>
        </li>
        <li>
        <label for="farmRemark">详情</label>
        <textarea name="farmRemark" id="farmRemark" cols="90" rows="10"><%=rs("farmRemark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
