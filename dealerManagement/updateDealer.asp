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
requestExist request("dealerId")
  Dim rs
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from dealer where id='"&request("dealerId")&"'",conn,1,3
recordSetExist rs
If request("action")="update" Then
  rs("dealerName")=request.Form("dealerName")
  rs("dealerType")=request.Form("dealerType")
  rs("productType")=request.Form("productType")
  rs("whetherCooperation")=request.Form("whetherCooperation")
  rs("contact")=request.Form("contact")
  rs("phone")=request.Form("phone")
  rs("mailBox")=request.Form("mailBox")
  rs("businessLicense")=request.Form("businessLicense")
  rs("level")=request.Form("level")
  rs("note")=request.Form("note")
  rs.Update
  response.Write "<script>alert('�޸ĳɹ�!');location.href='dealerList.asp'</script>"
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸��̼�</a></li>
  </ul>
  </div>

  
  <form action="?action=update&dealerId=<%=request("dealerId")%>" method="post">
    <ul class="forminfo">
    <li><label for="dealerName">�̼�����</label><input type="text" name="dealerName" id="dealerName" required value="<%=rs("dealerName")%>"></li>
    <li>
    <li>
    <label for="dealerType">�̼�����</label>
    <select type="text" id="dealerType" name="dealerType">
    <option value="1">������</option>
    <option value="2" <%ifSelected rs("dealerType"),2%>>������</option>
    <option value="3" <%ifSelected rs("dealerType"),3%>>������</option>
</select>
    </li>
    <li>
    <label for="productType">���۲�Ʒ���</label>
    <input type="text" id="productType" name="productType" value="<%=rs("productType")%>" required>
     </li>
    <li>
    <label for="whetherCooperation">�Ƿ����</label>
    <select type="text" id="whetherCooperation" name="whetherCooperation">
    <option value="1">��</option>
    <option value="0" <%If rs("whetherCooperation")=0 Then response.Write "selected='selected'"%>>��</option>
</select>
    <li>
    <li>
    <label for="contact">��ϵ��</label>
    <input type="text" id="contact" name="contact" required value="<%=rs("contact")%>">
     </li>
    <li>
    <label for="phone">�绰</label>
    <input type="text" id="phone" name="phone" required value="<%=rs("phone")%>">
     </li>
    <li>
    <label for="mailBox">����</label>
    <input type="text" id="mailBox" name="mailBox" required value="<%=rs("mailBox")%>">
     </li>
     </li>
    <li><label for="businessLicense">Ӫҵִ��</label><input type="text" name="businessLicense" id="businessLicense" required value="<%=rs("businessLicense")%>"></li>
    <li>
      <label for="level">����</label><select id="level" name="level">
      <option value="1">����</option>
      <option value="2" <%ifSelected 2,rs("level")%>>����</option>
      <option value="3"  <%ifSelected 3,rs("level")%>>�е�</option>
      <option value="4"  <%ifSelected 4,rs("level")%>>��</option>
      <option value="5"  <%ifSelected 5,rs("level")%>>�ϲ�</option>
</select>
    </li>
    <li>
      <label for="note">��ע</label>
      <textarea name="note" id="note" cols="120" rows="20"><%=rs("note")%></textarea>
    </li>
		<li><input name="submit" id="submit" type="submit" class="btn" value="�ύ"/></li>
    </ul>

  </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
