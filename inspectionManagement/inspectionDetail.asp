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
requestExist request("inspectionId")

  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from inspectionLog where id="&request("inspectionId"),conn,1,1
  recordSetExist rs

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="/inspectionManagement/inspectionList.asp">����¼�б�</a></li>
  <li><a href="#">�鿴����¼</a></li>
  </ul>
  </div>

  <ul>
  <li>����Ʒ��<%=rs("product")%></li>
  <li>����Ʒ��ţ�<%=rs("productNumber")%></li>
  <li>���ʱ�䣺<%=rs("inspectionTime")%></li>
  <li>�Ƿ������⣺<%yesOrNo rs("haveProblem")%></li>
  <li>���������<%=rs("result")%></li>
  <li>���飺<%=rs("remark")%></li>
  <li>������
  <%Dim rsFiles
  set rsFiles=Server.CreateObject("Adodb.Recordset")
  rsFiles.open "select * from fileInspection where AnnexNo="&rs("files"),conn,1,1
  Do while Not rsFiles.Eof%>
   <br />
   <a href="#" onclick="window.open('<%=rsFiles("AnnexUrl")%>')"><%=rsFiles("AnnexName")%></a>
  <%rsFiles.MoveNext
  Loop
  %>
  </li>
  <li><input type="button" onclick="history.back()" value="������һҳ">
  <input type="button" onclick="location.href='reviseInspection.asp?inspectionId=<%=rs("id")%>'" value="�޸�">

  </li>
</ul>

<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
