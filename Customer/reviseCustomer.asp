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
requestExist request("customerId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from Customer where id="&request("customerId"),conn,1,3
  recordSetExist rs
If Request("action")="revise" Then
  rs("name")=Request.Form("name")
  rs("id")=Request.Form("id")
  rs("sex")=Request.Form("sex")
  rs("age")=Request.Form("age")
  rs("BuyDate")=request.Form("BuyDate")
  rs("BuyNumber")=Request.Form("BuyNumber")
  rs("remark")=Request.Form("remark")
  rs.Update
  response.Write "<script>alert('�޸ĳɹ�!');location.href='customerList.asp';</script>"
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸Ŀͻ���Ϣ</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&customerId=<%=request("customerId")%>" method="post">
      <ul class="forminfo">
        <li>
          <label for="name">�ͻ�����</label>
          <input  type="text" name="name" id="name" required value="<%=rs("name")%>">
          </li>
        <li>
          <label for="number">�ͻ�����</label>
          <input  type="text" name="id" id="number" value="<%=rs("id")%>" required>
          </li>
        <li>
          <label for="sex">�Ա�</label>
          <select name="sex" id="sex">
            <option value="1" >��</option>
            <option value="2" <%ifSelected 2,rs("sex")%>>Ů</option>  
          </select>
          </li>
        <li>
        <label for="age">����</label>
          <input  type="number" name="age" id="age" value="<%=rs("age")%>" required>
        </li>
        <li><label for="position">����ʱ��</label>
          <input  type="text" name="BuyDate" id="BuyDate" value="<%=rs("BuyDate")%>" required>
        </li>
        <li><label for="entryDate">��������</label>
          <input  type="text" name="BuyNumber" id="BuyNumber" value="<%=rs("BuyNumber")%>" required>
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
