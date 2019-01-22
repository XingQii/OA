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
requestExist request("standardId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from firmStandard where id="&request("standardId"),conn,1,3
  recordSetExist rs

If Request("action")="revise" Then
 requestExistAndAlert Request.Form("standardNumber"),"找不到对应于编号的监管单位！请通过自动填写确定正确编号！"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from firmStandard where standardNumber='"&Request.Form("standardNumber")&"'",conn,1,1
  rsExistAndAlert rsBase,"找不到对应的监管单位编号，请重新填写！"
  rs("standardNumber")=Request.Form("standardNumber")
  rs("standardName")=rsBase("standardNumber")
  rs("standardName")=Request.Form("standardName")
  rs("standardRemark")=Request.Form("standardRemark")
  rs.Update

  response.Write "<script>alert('修改成功!');location.href='standardList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">修改准入标准</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&standardId=<%=request("standardId")%>" method="post">
      <ul class="forminfo">
        <li>
        <label for="standardNumber">准入标准编号</label>
          <input  type="text" name="standardNumber" id="standardNumber" value="<%=rs("standardNumber")%>" required>
        </li>
        <li>
        <label for="standardName">准入标准名称</label>
        <input  type="text" name="standardName" id="standardName" value="<%=rs("standardName")%>" required>
        </li>
        <li>
        <label for="standardRemark">详情</label>
        <textarea name="standardRemark" id="standardRemark" cols="90" rows="10"><%=rs("standardRemark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
