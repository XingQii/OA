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
  </style>
  


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("certificateId")
  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from qualityInspection where id='"&request("certificateId")&"'",conn,1,1
recordSetExist rs
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�鿴֤������</a></li>
  </ul>
  </div>

  <fieldset>
    <legend>
    
    </legend>
    <ul>
      <li>
        <span>֤������<%=rs("certificateName")%></span>
      </li>
      <li>
        <span>֤���ţ�<%=rs("certificateNumber")%></span>
      </li>
      <li>
        <span>��ز�Ʒ��<%=rs("relativeProducts")%></span>
      </li>
      <li>
        <span>��֤���ڣ�<%=rs("issueDate")%></span>
      </li>
      <li>
        <span>��Ч������<%=rs("validDate")%></span>
      </li>
      <li>
        <span>֤��˵����<%=rs("remark")%></span>
      </li>
      <%If rs("files")<>"" Then%>
      <li>
        <span>��ͬ������<br />
        <%
          Dim rsAnnex
          set rsAnnex=Server.CreateObject("Adodb.RecordSet")
          rsAnnex.open "select * from fileQuality where AnnexNo='"&rs("files")&"'",conn,1,1
          Do While Not rsAnnex.Eof%>

            <a href="#" onclick="window.open('<%=rsAnnex("AnnexUrl")%>')"><%=rsAnnex("AnnexName")%></a>
            <br />
          <%rsAnnex.MoveNext
          Loop%>

          </span>
      </li>
      <%End If%>
      <li>
        
        <input name="submit" id="submit" type="button" value="������һҳ" onclick="history.back()"/>
        <input type="button" onclick="location.href='reviseCertificate.asp?certificateId=<%=request("certificateId")%>'" value="�޸�">
      </li>
    </ul>
  </fieldset>
  


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
