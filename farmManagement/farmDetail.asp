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
requestExist request("farmId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from farm where id="&request("farmId"),conn,1,1
  recordSetExist rs

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="/farmManagement/farmList.asp">��ͥũ���б�</a></li>
  <li><a href="#">�鿴ũ��</a></li>
  </ul>
  </div>

  <ul>
  <li>ũ����ţ�<%=rs("farmNumber")%></li>
  <li>ũ����ַ��<%=rs("farmPlace")%></li>
  <li>ũ��������Ʒ������<%=rs("farmProductNumber")%></li>
  <li>ũ�����ƣ�<%=rs("farmName")%></li>
  <li>���飺<%=rs("farmRemark")%></li>

  <li><input type="button" onclick="history.back()" value="������һҳ">
  <input type="button" onclick="location.href='reviseFarm.asp?farmId=<%=rs("id")%>'" value="�޸�">

  </li>
</ul>

<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
