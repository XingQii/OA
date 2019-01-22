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
    fieldset{
      border: solid 1px orange;
      width: 90%;
      background-color: #FFFFF0;
      margin:1% auto;
    }
    legend{
      margin: 0;
      margin-left: 3%;
    }
    fieldset ul{
      padding-top: 2%;
    }
    fieldset ul li{
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
    textarea{
      background-color:  #F9ECD9;
      border: solid 1px orange;
      width: 80%;
      height: 8%;
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
  </style>
</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<%
If request("supplierId")<>"" Then
  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from supplier where id='"&request("supplierId")&"'",conn,1,1
End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">查看<%=rs("supplierName")%></a></li>
  </ul>
  </div>

  <fieldset>
    <legend>
    
    </legend>
    <ul>
    <li><span>供应商名称：<%=rs("supplierName")%></span></li>
    <li><span>可提供产品：<%=rs("product")%></span></li>
    <li><span>是否可垫资：<%Select Case rs("whetherFunded")
      Case true response.Write "是"
      Case false response.Write "否"
      End Select%></span></li>
    <li><span>账期时间：<%=rs("acountDate")%></span></li>
    <li><span>发票类型：<%Select Case rs("taxType")
      Case 1 response.Write "普票"
      Case 2 response.Write "专票"
      End Select%></span></li>
      <li><span>是否合作：<%Select Case rs("taxType")
      Case true response.Write "是"
      Case false response.Write "否"
      End Select%></span></li>
    <li><span>联系人：<%=rs("contact")%></span></li>
    <li><span>电话：<%=rs("phone")%></span></li>
    <li><span>邮箱：<%=rs("mailBox")%></span></li>
    <li><span>营业执照：<%=rs("businessLicense")%></span></li>
    <li><span>级别：<%getLevel rs("supplierLevel")%></span></li>
    <li><span>备注：<%=rs("note")%></span></li>
    <li>
        <input name="submit" id="submit" type="button" value="返回上一页" onclick="history.back()"/>
    </li>
    </ul>
  </fieldset>
  

<!--#include virtual = "/index/functions.asp"-->


</body>

</html>
