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
requestExist request("standardId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from firmStandard where id="&request("standardId"),conn,1,3
  recordSetExist rs

If Request("action")="revise" Then
 requestExistAndAlert Request.Form("standardNumber"),"�Ҳ�����Ӧ�ڱ�ŵļ�ܵ�λ����ͨ���Զ���дȷ����ȷ��ţ�"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from firmStandard where standardNumber='"&Request.Form("standardNumber")&"'",conn,1,1
  rsExistAndAlert rsBase,"�Ҳ�����Ӧ�ļ�ܵ�λ��ţ���������д��"
  rs("standardNumber")=Request.Form("standardNumber")
  rs("standardName")=rsBase("standardNumber")
  rs("standardName")=Request.Form("standardName")
  rs("standardRemark")=Request.Form("standardRemark")
  rs.Update

  response.Write "<script>alert('�޸ĳɹ�!');location.href='standardList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸�׼���׼</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&standardId=<%=request("standardId")%>" method="post">
      <ul class="forminfo">
        <li>
        <label for="standardNumber">׼���׼���</label>
          <input  type="text" name="standardNumber" id="standardNumber" value="<%=rs("standardNumber")%>" required>
        </li>
        <li>
        <label for="standardName">׼���׼����</label>
        <input  type="text" name="standardName" id="standardName" value="<%=rs("standardName")%>" required>
        </li>
        <li>
        <label for="standardRemark">����</label>
        <textarea name="standardRemark" id="standardRemark" cols="90" rows="10"><%=rs("standardRemark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
