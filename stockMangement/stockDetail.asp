<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
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
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#" onClick="history.back()">����¼</a></li>
  <li><a href="#">�鿴�������</a></li>

  </ul>
  </div>

  <ul>
  <li>Ͷ��Ʒ���ͣ�<%inputType rs("type")%></li>
  <li>Ͷ��Ʒ���ƣ�<%=rs("name")%></li>
  <li>���仯���ڣ�<%=rs("lastestDate")%></li>
  <li>��Դ��<%=rs("source")%></li>
  <li>������<%=rs("quantity")&rs("unit")%></li>
  <li>��ע��<%=rs("remark")%></li>
  <li>
  <input type="button" onclick="history.back()" value="������һҳ">
  <input type="button" onclick="location.href='reviseStockRemark.asp?stockId=<%=rs("id")%>'" value="�޸ı�ע">
  </li>
</ul>
<%If Not rsStockIn.Eof Then%>

	<div class="ltitle place">
    <span>�������¼</span>

  </div>

<table class="tablelist">
  <thead>
  <tr>
    <th>Ͷ��Ʒ����</th>
    <th>����</th>
    <th>�������</th>
    <th>��Դ</th>
    <th>����</th>
    <th>����</th>
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
    <td><a href="stockInDetail.asp?stockInId=<%=rsStockIn("id")%>">�鿴</a>
    <a href="reviseStockIn.asp?stockInId=<%=rsStockIn("id")%>">�޸�</a></td>
    </tr>
  </tbody>
</table>
<%rsStockIn.MoveNext
Loop
End If%>

	<div class="ltitle place">
    <span>��س����¼</span>

  </div>
<%If Not rsStockOut.Eof Then%>
<table class="tablelist">
  <thead>
  <tr>
    <th>Ͷ��Ʒ����</th>
    <th>Ͷ��Ʒ����</th>
    <th>Ͷ������</th>
    <th>��Ӧ��Ʒ���</th>
    <th>��Դ</th>
    <th>����</th>
    <th>����</th>
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
    <td><a href="stockOutDetail.asp?stockOutId=<%=rsStockOut("id")%>">�鿴</a>
    <a href="reviseStockOut.asp?stockOutId=<%=rsStockOut("id")%>">�޸�</a></td>
    </tr>
  </tbody>
</table>
<%rsStockOut.MoveNext
Loop
End If%>
<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
