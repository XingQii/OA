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
    select{
    border: orange 1px solid;
    height: 30px;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
    $(function () {
    var stockOutDate=new Date().toJSON().slice(0,10);
    });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("stockOutId")
Dim rs
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "select * from stockOut where id="&request("stockOutId"),conn,1,3
recordSetExist rs
If Request("action")="revise" Then
  Dim rsOldStock
  set rsOldStock=Server.CreateObject("ADODB.Recordset")
  rsOldStock.open "select * from stock where type="&rs("type")&" And name='"&rs("name")&"'",conn,1,3
  rsOldStock("quantity")=Cdbl(rsOldStock("quantity"))+Cdbl(rs("quantity"))
  rsOldStock.update

  rs("type")=Request.Form("type")
  rs("name")=Request.Form("name")
  rs("stockOutDate")=Request.Form("stockOutDate")
  rs("productNumber")=Request.Form("productNumber")
  rs("source")=Request.Form("source")
  rs("quantity")=Request.Form("quantity")
  rs("unit")=Request.Form("unit")
  rs("remark")=Request.Form("remark")
  rs.Update


  Dim rsNewStock
  set rsNewStock=Server.CreateObject("ADODB.Recordset")
  rsNewStock.open "select * from stock where type="&rs("type")&" And name='"&rs("name")&"'",conn,1,3
  rsNewStock("quantity")=Cdbl(rsNewStock("quantity"))-Cdbl(rs("quantity"))
  rsNewStock.update

  response.Write "<script>alert('�޸ĳɹ�!');location.href='stockInList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">Ͷ��Ʒ���</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&stockOutId=<%=request("stockOutId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="type">Ͷ��Ʒ����</label>
          <select name="type" id="type">
          <option value="1">����</option>
          <option value="2" <%ifSelected 2,rs("type")%>>ũҩ</option>
          <option value="3" <%ifSelected 3,rs("type")%>>����</option>
</select>
          </li>
        <li>
          <label for="name">Ͷ��Ʒ����</label><input  type="text" name="name" id="name" value="<%=rs("name")%>" required>
        </li>
        <li>
        <label for="stockOutDate">Ͷ������</label>
          <input  type="date" name="stockOutDate" id="stockOutDate" value="<%=rs("stockOutDate")%>" required>
        </li>
        <li>
        <label for="productNumber">��Ӧ��Ʒ���</label>
          <input  type="text" name="productNumber" id="productNumber"  value="<%=rs("productNumber")%>"  required>
        </li>
        <li>
        <label for="source">��Դ</label>
          <input  type="text" name="source" id="source" value="<%=rs("source")%>" required>
        </li>
        <li>
        <label for="quantity">����</label>
          <input  type="number" name="quantity" id="quantity" value="<%=rs("quantity")%>" required>
        </li>
        <li>
        <label for="unit">������λ</label>
          <input  type="text" name="unit" id="unit" value="<%=rs("unit")%>" required>
        </li>
        <li>
        <label for="remark">��ע</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
