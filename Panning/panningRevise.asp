<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
    .select-box{

      width: 10%;
    }
    input[type="date"],.select-box{
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

    select{
    border: 1px solid orange;
    height: 30px;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("panningId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from panning where id="&request("panningId"),conn,1,3
  recordSetExist rs
If Request("action")="revise" Then
  rs("name")=Request.Form("name")
  rs("id")=Request.Form("id")
  rs("date")=Request.Form("date")
  rs("remark")=Request.Form("remark")
  rs.Update
  response.Write "<script>alert('�޸ĳɹ�!');location.href='panningList.asp';</script>"
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸Ĺ����ƻ�</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&panningId=<%=request("panningId")%>" method="post">
      <ul class="forminfo">
        <li>
          <label for="id">�������</label>
          <input  type="text" name="id" id="id" required value="<%=rs("id")%>">
          </li>
        <li>
          <label for="name">��������</label>
          <input  type="text" name="name" id="name" value="<%=rs("name")%>" required>
          </li>
        <li><label for="date">����ʱ��</label>
          <input  type="text" name="date" id="date" value="<%=rs("date")%>" required>
        </li>
        <li>
        <label for="remark">��ע˵��</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
