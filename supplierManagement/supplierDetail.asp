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
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�鿴<%=rs("supplierName")%></a></li>
  </ul>
  </div>

  <fieldset>
    <legend>
    
    </legend>
    <ul>
    <li><span>��Ӧ�����ƣ�<%=rs("supplierName")%></span></li>
    <li><span>���ṩ��Ʒ��<%=rs("product")%></span></li>
    <li><span>�Ƿ�ɵ��ʣ�<%Select Case rs("whetherFunded")
      Case true response.Write "��"
      Case false response.Write "��"
      End Select%></span></li>
    <li><span>����ʱ�䣺<%=rs("acountDate")%></span></li>
    <li><span>��Ʊ���ͣ�<%Select Case rs("taxType")
      Case 1 response.Write "��Ʊ"
      Case 2 response.Write "רƱ"
      End Select%></span></li>
      <li><span>�Ƿ������<%Select Case rs("taxType")
      Case true response.Write "��"
      Case false response.Write "��"
      End Select%></span></li>
    <li><span>��ϵ�ˣ�<%=rs("contact")%></span></li>
    <li><span>�绰��<%=rs("phone")%></span></li>
    <li><span>���䣺<%=rs("mailBox")%></span></li>
    <li><span>Ӫҵִ�գ�<%=rs("businessLicense")%></span></li>
    <li><span>����<%getLevel rs("supplierLevel")%></span></li>
    <li><span>��ע��<%=rs("note")%></span></li>
    <li>
        <input name="submit" id="submit" type="button" value="������һҳ" onclick="history.back()"/>
    </li>
    </ul>
  </fieldset>
  

<!--#include virtual = "/index/functions.asp"-->


</body>

</html>
