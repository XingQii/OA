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

    #productName,#productNumber{
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
requestExist request("workId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select *from workPP where id="&request("workId"),conn,1,3
  recordSetExist rs


Dim rsProcess
set rsProcess=Server.CreateObject("ADODB.Recordset")
rsProcess.open "select * from process where productId="&rs("productId")&" And exist=1",conn,1,1
rsExistAndAlert rsProcess,"��ѡ��Ĳ�Ʒ��û���κ����̣�����Ϊ��������̣�"


If Request("action")="revise" Then
  rs.close
  rs.open "select * from work where id="&request("workId"),conn,1,3
  rs("processId")=Request.Form("processId")
  rs("workName")=Request.Form("workName")
  rs("date")=Request.Form("date")
  rs("time")=Request.Form("time")
  rs("workLog")=Request.Form("workLog")
  rs.Update

  response.Write "<script>alert('�޸ĳɹ�!');location.href='workList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸���ҵ��Ϣ</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&workId=<%=request("workId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="productNumber">��Ʒ���</label>
          <input  type="text" name="productNumber" id="productNumber" required value="<%=rs("number")%>">
          </li>
        <li>
          <label for="productName">��Ʒ����</label>
          <input  type="text" name="productName" id="productName" value="<%=rs("name")%>" required>
          </li>
        <li>
        <label for="processId">��Դ����</label>
        <select name="processId" id="processId">
        <option value="<%=rsProcess("id")%>">��ѡ����Դ����</option>
        <%Do While Not rsProcess.Eof %>
        <option value="<%=rsProcess("id")%>" <%ifSelected rsProcess("id"),rs("processId")%>><%=rsProcess("process")%></option>
        <%rsProcess.MoveNext
        Loop%>
</select>
</li>
        <li>
        <label for="workName">��ҵ����</label>
          <input  type="text" name="workName" id="workName" value="<%=rs("workName")%>" required>
        </li>
        <li>
        <label for="time">ʱ��</label>
          <input  type="date" name="date" id="date" required value="<%=rs("date")%>">
          <input  type="time" name="time" id="time" required value="<%=rs("time")%>">
        </li>
        <li>
        <label for="workLog">��ҵ��¼</label>
        <textarea name="workLog" id="workLog" cols="90" rows="10"><%=rs("workLog")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
