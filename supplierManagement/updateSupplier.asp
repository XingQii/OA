<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">

  select{
    width: 10%;
  }
  input,select{
    top: 3px;
    cursor: pointer;
    height: 28px;
    border: orange 1px solid;
  }
  form li {
    margin: 25px 0 25px 40px;
  }
  input,textarea{
    
    vertical-align: middle;
    border: orange 1px solid;
  }
  input{
    width: 20%;
  }
  form li:last-child{
    width: 70%;
    text-align: center;
  }
  input::-webkit-inner-spin-button {
    display: none;
  }
  .forminfo li label{
    width: 15%;
  }
  .forminfo li label[for="none"]{
    margin:2%;
    margin-left: 0;
  }
  .forminfo li label[for="none"]:first-child{
    margin-top: 0;
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
<!--#include file = "../index/connDB.asp"-->

<%
requestExist request("supplierId")
  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from supplier where id='"&request("supplierId")&"'",conn,1,3
recordSetExist rs
If request("action")="update" Then
  rs("supplierName")=request.Form("supplierName")
  rs("product")=request.Form("product")
  rs("whetherFunded")=request.Form("whetherFunded")
  rs("acountDate")=request.Form("acountDate")
  rs("taxType")=request.Form("taxType")
  rs("whetherCooperation")=request.Form("whetherCooperation")
  rs("contact")=request.Form("contact")
  rs("phone")=request.Form("phone")
  rs("mailBox")=request.Form("mailBox")
  rs("businessLicense")=request.Form("businessLicense")
  rs("supplierLevel")=request.Form("supplierLevel")
  rs("note")=request.Form("note")

  rs.Update
  response.Write "<script>alert('�޸ĳɹ�!');location.href='supplierList.asp'</script>"
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">��ӹ�Ӧ��</a></li>
  </ul>
  </div>

  
  <form action="?action=update&supplierId=<%=request("supplierId")%>" method="post">
    <ul class="forminfo">
    <li><label for="supplierName">��Ӧ�����ƣ�</label><input type="text" name="supplierName" id="supplierName" required value="<%=rs("supplierName")%>"></li>
    <li>
    <label for="product">���ṩ��Ʒ��</label>
    <input type="text" id="product" name="product" required value="<%=rs("product")%>">
     </li>
    <li>
    <label for="whetherFunded">�Ƿ�ɵ��ʣ�</label>
    <select type="text" id="whetherFunded" name="whetherFunded">
    <option value="1">��</option>
    <option value="0" <%If rs("whetherFunded")=0 Then response.Write "selected='selected'"%>>��</option>
</select>
    <li>
    <label for="acountDate">����ʱ�䣺</label>
    <input type="date" id="acountDate" name="acountDate" required value="<%=rs("acountDate")%>">
     </li>

    <li>
    <label for="taxType">��Ʊ���ͣ�</label>
    <select type="text" id="taxType" name="taxType">
     <option value="1">
      ��Ʊ</option>
      <option value="2" <%If rs("taxType")=2 Then response.Write "selected='selected'"%>>רƱ</option>
</select>
    <li>
    <li>
    <label for="whetherCooperation">�Ƿ������</label>
    <select type="text" id="whetherCooperation" name="whetherCooperation">
    <option value="1">��</option>
    <option value="0" <%If rs("whetherCooperation")=0 Then response.Write "selected='selected'"%>>��</option>
</select>
    <li>
    <li>
    <label for="contact">��ϵ�ˣ�</label>
    <input type="text" id="contact" name="contact" required value="<%=rs("contact")%>">
     </li>
    <li>
    <label for="phone">�绰��</label>
    <input type="text" id="phone" name="phone" required value="<%=rs("phone")%>">
     </li>
    <li>
    <label for="mailBox">���䣺</label>
    <input type="text" id="mailBox" name="mailBox" required value="<%=rs("mailBox")%>">
     </li>
     </li>
    <li><label for="businessLicense">Ӫҵִ�գ�</label><input type="text" name="businessLicense" id="businessLicense" required value="<%=rs("businessLicense")%>"></li>
    <li>
      <label for="supplierLevel">����</label><select id="supplierLevel" name="supplierLevel">
      <option value="1">����</option>
      <option value="2" <%ifSelected 2,rs("supplierLevel")%>>����</option>
      <option value="3"  <%ifSelected 3,rs("supplierLevel")%>>�е�</option>
      <option value="4"  <%ifSelected 4,rs("supplierLevel")%>>��</option>
      <option value="5"  <%ifSelected 5,rs("supplierLevel")%>>�ϲ�</option>
</select>
    </li>
    <li>
      <label for="note">��ע��</label>
      <textarea name="note" id="note" cols="120" rows="20"><%=rs("note")%></textarea>
    </li>
		<li><input name="submit" id="submit" type="submit" class="btn" value="�ύ"/></li>
    </ul>

  </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
