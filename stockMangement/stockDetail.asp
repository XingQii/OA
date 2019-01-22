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
requestExist request("stockId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from stock where id="&request("stockId"),conn,1,1
  recordSetExist rs

Dim rsStockIn
set rsStockIn=Server.CreateObject("Adodb.RecordSet")
rsStockIn.open "select * from stockIn where type="&rs("type")&" And name='"&rs("name")&"'",conn,1,1
Dim rsStockOut
set rsStockOut=Server.CreateObject("Adodb.RecordSet")
rsStockOut.open "select * from stockOut where type="&rs("type")&" And name='"&rs("name")&"'",conn,1,1

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#" onClick="history.back()">库存记录</a></li>
  <li><a href="#">查看库存详情</a></li>

  </ul>
  </div>

  <ul>
  <li>投入品类型：<%inputType rs("type")%></li>
  <li>投入品名称：<%=rs("name")%></li>
  <li>最后变化日期：<%=rs("lastestDate")%></li>
  <li>来源：<%=rs("source")%></li>
  <li>数量：<%=rs("quantity")&rs("unit")%></li>
  <li>备注：<%=rs("remark")%></li>
  <li>
  <input type="button" onclick="history.back()" value="返回上一页">
  <input type="button" onclick="location.href='reviseStockRemark.asp?stockId=<%=rs("id")%>'" value="修改备注">
  </li>
</ul>
<%If Not rsStockIn.Eof Then%>

	<div class="ltitle place">
    <span>相关入库记录</span>

  </div>

<table class="tablelist">
  <thead>
  <tr>
    <th>投入品类型</th>
    <th>名称</th>
    <th>入库日期</th>
    <th>来源</th>
    <th>数量</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
	<%do while not rsStockIn.EOF
	%>
     <tr>
    <td><%call inputType(rsStockIn("type"))%></td>
    <td><%=rsStockIn("name")%></td>
    <td><%=rsStockIn("stockInDate")%></td>
    <td><%=rsStockIn("source")%></td>
    <td><%=rsStockIn("quantity")&rsStockIn("unit")%></td>
    <td><a href="stockInDetail.asp?stockInId=<%=rsStockIn("id")%>">查看</a>
    <a href="reviseStockIn.asp?stockInId=<%=rsStockIn("id")%>">修改</a></td>
    </tr>
  </tbody>
</table>
<%rsStockIn.MoveNext
Loop
End If%>

	<div class="ltitle place">
    <span>相关出库记录</span>

  </div>
<%If Not rsStockOut.Eof Then%>
<table class="tablelist">
  <thead>
  <tr>
    <th>投入品类型</th>
    <th>投入品名称</th>
    <th>投入日期</th>
    <th>对应产品编号</th>
    <th>来源</th>
    <th>数量</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
	<%do while not rsStockOut.EOF
	%>
     <tr>
    <td><%call inputType(rsStockOut("type"))%></td>
    <td><%=rsStockOut("name")%></td>
    <td><%=rsStockOut("stockOutDate")%></td>
    <td><%=rsStockOut("productNumber")%></td>
    <td><%=rsStockOut("source")%></td>
    <td><%=rsStockOut("quantity")&rsStockOut("unit")%></td>
    <td><a href="stockOutDetail.asp?stockOutId=<%=rsStockOut("id")%>">查看</a>
    <a href="reviseStockOut.asp?stockOutId=<%=rsStockOut("id")%>">修改</a></td>
    </tr>
  </tbody>
</table>
<%rsStockOut.MoveNext
Loop
End If%>
<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
