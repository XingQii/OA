<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  <link rel="stylesheet" href="/css/focus.css">
  <style type="text/css">
    html{
      background-color: #F9ECD9;
    }
    div+ul{
      border: solid 1px orange;
      width: 90%;
      margin:1% auto;
      background-color: #FFFFF0;
      padding-top: 2%;

    }
    div+ul li{
      padding:1% 0 1% 5%;
    }
    label{
      display: block;
      float: left;
      vertical-align: middle;
      width: 7%;
    
    }
    select,textarea{
      margin-left: 3%;
    }
    input[type="submit"],input[type='button']{
      background-color:orange ;

      width: 15%;
      height: 30px;
      display: inline-block;
      text-align: center;
      margin-bottom: 1%;
      margin-left: 5%;
    }
    fieldset ul li span{
    display: inline-block;
    width: 30%;
    }
    fieldset ul li label{
    width: 10%;
    }
    fieldset ul li select,fieldset ul li input,fieldset ul li textarea{
    margin-left: 0;
    padding-left: 0;
    }
    fieldset ul li select{
    border: 1px solid orange;
    height: 30px;
    }
    fieldset ul li textarea{
    background-color: white;
    }
    input.updateButton{
    background: none;
    border: 1px solid orange;
    }
  </style>
  


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("productId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from product where id="&request("productId"),conn,1,3
  recordSetExist rs



If request("action")="checkDoc" Then
  rs("searchTimes")=rs("searchTimes")+1
  rs.Update
End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="/product/productList.asp">产品列表</a></li>
  <li><a href="#">档案模板</a></li>
  </ul>
  </div>

  <ul>
  <li>产品名称：<%=rs("name")%></li>
  <li>产品编号：<%=rs("number")%></li>
  <li>产品类型：<%=rs("category")%></li>
  <li>详情：<%=rs("detail")%></li>
  <li>溯源信息：</li>
  <%Dim rsProcess
  set rsProcess=Server.CreateObject("ADODB.Recordset")
  Dim rsWork
  set rsWork=Server.CreateObject("ADODB.Recordset")
  rsProcess.open "select * from process where productId="&rs("id")&"And exist=1 order by date,time asc",conn,1,1

  Do While Not rsProcess.Eof
    rsWork.open "select * from work where exist=1 And productId="&rs("id")&" And processId="&rsProcess("id")&" order by date,time asc",conn,1,1
    response.Write "<li>"&rsProcess("process")&"    "&rsProcess("date")&" "&rsProcess("time")&"</li>"
    response.Write "<li>"&rsProcess("processLog")&"</li>"
    Do While Not rsWork.Eof
    response.Write "<li>"&rsWork("workName")&"    "&rsWork("date")&" "&rsWork("time")&"</li>"
    response.Write "<li>"&rsWork("workLog")&"</li>"
    rsWork.MoveNext
    Loop
    rsWork.close
  rsProcess.MoveNext
  Loop
  %>
  <li><input type="button" onclick="history.back()" value="返回上一页"></li>
</ul>

<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
