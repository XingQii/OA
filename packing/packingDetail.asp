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
requestExist request("packingId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from packing where id="&request("packingId"),conn,1,1
  recordSetExist rs
  Dim rsProduct
  set rsProduct=Server.CreateObject("Adodb.RecordSet")

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#" onClick="history.back()">����¼</a></li>
  <li><a href="#">�鿴װ������</a></li>

  </ul>
  </div>

  <ul>
  <li>װ���ţ�<%=rs("number")%></li>
  <li>����С�䣺<%If rs("bigOrSmall")=1 Then
               response.Write "����"
               Else
               response.Write "С��"
               End If%></li>
  <li>��Ʒ��ţ�<%If rs("productId")<>"" Then
  rsProduct.open "select * from product where id="&rs("productId"),conn,1,1
    If Not rsProduct.Eof Then
      response.Write "<a href='/product/productDetail.asp?productId="&rsProduct("id")&"'>"&rsProduct("number")&"</a>"
    End If
  End If%></li>
  <li>��Ʒ����װ���أ�<%=rs("weightAmount")%>KG</li>
  <li>�������侻�أ�<%=rs("boxAmount")%>KG</li>
  <li>���䳤��<%=rs("boxLength")%>CM</li>
  <li>�������<%=rs("boxWidth")%>CM</li>
  <li>����ߣ�<%=rs("boxHeight")%>CM</li>
  <li>���飺<%=rs("remark")%></li>
  <li><input type="button" onclick="history.back()" value="������һҳ">
  <input type="button" onclick="location.href='revisePacking.asp?packingId=<%=rs("id")%>'" value="�޸�"></li>
</ul>

<!--#include virtual = "/index/functions.asp"-->

</body>

</html>