<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">

    input[type="date"]{
      top: 3px;
      cursor: pointer;
      height: 28px;
      border: orange 1px solid;
    }

    form li{
      margin: 25px 0 25px 40px;
    }
    input[type="date"],input[type="time"]{
      width: 10%;
    }
    input{
      width: 5%;
      vertical-align: middle;
    }
    form li:last-child{
      width: 70%;
      text-align: center;
    }
    input[type="checkbox"]{
      width: auto;
      margin: auto;
    }
    section{
      display: inline;
      vertical-align: middle;
      text-align: left;
    }

    input[type=checkbox]{
      width:2%;
    }
    .forminfo li section{
      width: 100%;
    }
    .forminfo label{
    width: 10%;
    }
    .forminfo input{
    width: 20%;
    }
    input::-webkit-inner-spin-button {
      display: none;
    }
    form{
      margin-top: 2%;
    }
    textarea{
    border: 1px solid orange;
    }
    .forminfo input[type="submit"]{
    background-color: #f74f1d	;
    border: none;
    }

  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("regulatorsId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from regulators where id="&request("regulatorsId"),conn,1,3
  recordSetExist rs

If Request("action")="revise" Then
 requestExistAndAlert Request.Form("regulatorsNumber"),"�Ҳ�����Ӧ�ڱ�ŵļ�ܵ�λ����ͨ���Զ���дȷ����ȷ��ţ�"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from regulators where regulatorsNumber='"&Request.Form("regulatorsNumber")&"'",conn,1,1
  rsExistAndAlert rsBase,"�Ҳ�����Ӧ�ļ�ܵ�λ��ţ���������д��"
  rs("regulatorsNumber")=Request.Form("regulatorsNumber")
  rs("regulatorsName")=rsBase("regulatorsNumber")
  rs("regulatorsName")=Request.Form("regulatorsName")
  rs("regulatorsRemark")=Request.Form("regulatorsRemark")
  rs.Update

  response.Write "<script>alert('�޸ĳɹ�!');location.href='regulatorsList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸ļ�ܵ�λ</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&regulatorsId=<%=request("regulatorsId")%>" method="post">
      <ul class="forminfo">
        <li>
        <label for="regulatorsNumber">��ܵ�λ���</label>
          <input  type="text" name="regulatorsNumber" id="regulatorsNumber" value="<%=rs("regulatorsNumber")%>" required>
        </li>
        <li>
        <label for="regulatorsName">��λ����</label>
        <input  type="text" name="regulatorsName" id="regulatorsName" value="<%=rs("regulatorsName")%>" required>
        </li>
        <li>
        <label for="regulatorsRemark">����</label>
        <textarea name="regulatorsRemark" id="regulatorsRemark" cols="90" rows="10"><%=rs("regulatorsRemark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
