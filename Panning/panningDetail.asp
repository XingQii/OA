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
      display: inline;
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
  </style>
  


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("panningId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from panning where id="&request("panningId"),conn,1,1
  recordSetExist rs

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#" onClick="history.back()">工作信息 </a></li>
  <li><a href="#">查看工作计划</a></li>

  </ul>
  </div>

  <ul>
  <li>工作编号：<%=rs("id")%></li>
  <li>工作名称：<%=rs("name")%></li>
  <li>工作时间：<%=rs("date")%></li>
  <li>备注说明：<%=rs("remark")%></li>
  <li><input type="button" onclick="javascript:history.back()" value="返回上一页">
  <input type="button" onclick="location.href='panningRevise.asp?panningId=<%=rs("id")%>'" value="修改">

  </li>
</ul>

<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
