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

  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from productBase where id="&request("productBaseId"),conn,1,3
If Request("action")="revise" Then
  rs("name")=Request.Form("name")
  rs("location")=Request.Form("location")
  rs("establishDate")=Request.Form("establishDate")
  rs("mainProducts")=Request.Form("mainProducts")
  rs("remark")=Request.Form("remark")
  rs.Update

  response.Write "<script>alert('�޸ĳɹ�!');location.href='productBaseList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸�����������Ϣ</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&productBaseId=<%=request("productBaseId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="name">������������</label><input  type="text" name="name" id="name" required value="<%=rs("name")%>">
          </li>
        <li>
          <label for="location">��ַ</label><input  type="text" name="location" id="location" value="<%=rs("location")%>" required>
          </li>
        <li><label for="establishDate">����ʱ��</label>
          <input  type="date" name="establishDate" id="establishDate" value="<%=rs("establishDate")%>" required>
        </li>
        <li><label for="mainProducts">��Ҫ��Ʒ</label>
          <input  type="text" name="mainProducts" id="mainProducts" value="<%=rs("mainProducts")%>" required>
        </li>
        <li>
        <label for="remark">����</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
