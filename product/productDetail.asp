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
      margin:1% auto;
      background-color: #FFFFF0;
  
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
productId=request("productId")
If request("productId")="" Then
	response.Write "<script>alert('出现错误！找不到要查看的产品！');history.back()</script>;"
	response.end
Else
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from product where id="&request("productId"),conn,1,1

End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#" onClick="location.href='productList.asp'">产品列表</a></li>
  <li><a href="#">查看产品</a></li>
  <li><a href="#">添加溯源信息</a></li>

  </ul>
  </div>
  <fieldset>
    <legend>
    
    </legend>
    <ul>
      <%If Not rs.EOf Then%>
      <li>
        <span>产品名称：<%=rs("name")%></span>
        <span>产品编号：<%=rs("number")%></span>
        <span>产品类型：<%=rs("category")%></span>

      </li>
        <li>
        <span>产品批次：<%If rs("batchId")<>"" Then
        Dim rsBatch
        set rsBatch=Server.CreateObject("ADODB.Recordset")
        rsBatch.open "select * from batch where id="&rs("batchId"),conn,1,1
        If Not rsBatch.Eof Then
          response.Write rsBatch("batch")
        End If
        End If
          %></span></li>
      <li>
        <span>详情：<%=rs("detail")%></span>
      </li>
      <%End IF%>
      <li>
        
        <input name="submit" id="submit" type="button" value="返回上一页" onClick="history.back()"/>
        <input type="button" onclick="location.href='productDocument.asp?productId=<%=rs("id")%>'" value="查看溯源信息">
        <input type="button" onclick="location.href='updateProduct.asp?productId=<%=rs("id")%>'" value="修改">
      </li>
    </ul>
  </fieldset>
<!--#include virtual = "/index/functions.asp"-->



</body>

</html>
