<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">

  select{
    width: 15%;
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
    width: 10%;
  }
  input[type="date"]{
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
  <script type="text/javascript">

  $(function () {
    var acountDate=new Date().toJSON().slice(0,10);

  $("#acountDate").attr("value",acountDate);

  });
  </script>

</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<%
If request("action")="add" Then
  Dim rsAdd
  set rsAdd=Server.CreateObject("Adodb.RecordSet")
  rsAdd.open "select * from supplier",conn,1,3
  rsAdd.AddNew
  rsAdd("supplierName")=request.Form("supplierName")
  rsAdd("product")=request.Form("product")
  rsAdd("whetherFunded")=request.Form("whetherFunded")
  rsAdd("acountDate")=request.Form("acountDate")
  rsAdd("taxType")=request.Form("taxType")
  rsAdd("whetherCooperation")=request.Form("whetherCooperation")
  rsAdd("contact")=request.Form("contact")
  rsAdd("phone")=request.Form("phone")
  rsAdd("mailBox")=request.Form("mailBox")
  rsAdd("businessLicense")=request.Form("businessLicense")
  rsAdd("supplierLevel")=request.Form("supplierLevel")
  rsAdd("note")=request.Form("note")

  rsAdd.Update
  response.Write "<script>alert('�ύ�ɹ�!');location.href='supplierList.asp'</script>"
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">��ӹ�Ӧ��</a></li>
  </ul>
  </div>

  
  <form action="?action=add" method="post">
    <ul class="forminfo">

    <li><label for="supplierName">��Ӧ������</label><input type="text" name="supplierName" id="supplierName" required></li>
    <li>
    <label for="product">���ṩ��Ʒ</label>
    <input type="text" id="product" name="product" required>
     </li>
    <li>
    <label for="whetherFunded">�Ƿ�ɵ���</label>
    <select type="text" id="whetherFunded" name="whetherFunded">
    <option value="1">��</option>
    <option value="0">��</option>
</select>
    <li>
    <label for="acountDate">����ʱ��</label>
    <input type="date" id="acountDate" name="acountDate" required>
     </li>

    <li>
    <label for="taxType">��Ʊ����</label>
    <select type="text" id="taxType" name="taxType">
     <option value="1">
      ��Ʊ</option>
      <option value="2">רƱ</option>
</select>
    <li>
    <li>
    <label for="whetherCooperation">�Ƿ����</label>
    <select type="text" id="whetherCooperation" name="whetherCooperation">
    <option value="1">��</option>
    <option value="0">��</option>
</select>
    <li>
    <li>
    <label for="contact">��ϵ��</label>
    <input type="text" id="contact" name="contact" required>
     </li>
    <li>
    <label for="phone">�绰</label>
    <input type="text" id="phone" name="phone" required>
     </li>
    <li>
    <label for="mailBox">����</label>
    <input type="text" id="mailBox" name="mailBox" required>
     </li>
     </li>
    <li><label for="businessLicense">Ӫҵִ��</label><input type="text" name="businessLicense" id="businessLicense" required></li>
    <li>
      <label for="supplierLevel">����</label><select id="supplierLevel" name="supplierLevel">
      <option value="1">����</option>
      <option value="2">����</option>
      <option value="3">�е�</option>
      <option value="4">��</option>
      <option value="5">�ϲ�</option>
</select>
    </li>
    <li>
      <label for="note">��ע</label>
      <textarea name="note" id="note" cols="120" rows="20"></textarea>
    </li>

		<li><input name="submit" id="submit" type="submit" class="btn" value="�ύ"/></li>
    </ul>

  </form>



</body>

</html>
