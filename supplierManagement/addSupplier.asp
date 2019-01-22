<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
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
  response.Write "<script>alert('提交成功!');location.href='supplierList.asp'</script>"
End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加供应商</a></li>
  </ul>
  </div>

  
  <form action="?action=add" method="post">
    <ul class="forminfo">

    <li><label for="supplierName">供应商名称</label><input type="text" name="supplierName" id="supplierName" required></li>
    <li>
    <label for="product">可提供产品</label>
    <input type="text" id="product" name="product" required>
     </li>
    <li>
    <label for="whetherFunded">是否可垫资</label>
    <select type="text" id="whetherFunded" name="whetherFunded">
    <option value="1">是</option>
    <option value="0">否</option>
</select>
    <li>
    <label for="acountDate">账期时间</label>
    <input type="date" id="acountDate" name="acountDate" required>
     </li>

    <li>
    <label for="taxType">发票类型</label>
    <select type="text" id="taxType" name="taxType">
     <option value="1">
      普票</option>
      <option value="2">专票</option>
</select>
    <li>
    <li>
    <label for="whetherCooperation">是否合作</label>
    <select type="text" id="whetherCooperation" name="whetherCooperation">
    <option value="1">是</option>
    <option value="0">否</option>
</select>
    <li>
    <li>
    <label for="contact">联系人</label>
    <input type="text" id="contact" name="contact" required>
     </li>
    <li>
    <label for="phone">电话</label>
    <input type="text" id="phone" name="phone" required>
     </li>
    <li>
    <label for="mailBox">邮箱</label>
    <input type="text" id="mailBox" name="mailBox" required>
     </li>
     </li>
    <li><label for="businessLicense">营业执照</label><input type="text" name="businessLicense" id="businessLicense" required></li>
    <li>
      <label for="supplierLevel">级别</label><select id="supplierLevel" name="supplierLevel">
      <option value="1">优秀</option>
      <option value="2">良好</option>
      <option value="3">中等</option>
      <option value="4">差</option>
      <option value="5">较差</option>
</select>
    </li>
    <li>
      <label for="note">备注</label>
      <textarea name="note" id="note" cols="120" rows="20"></textarea>
    </li>

		<li><input name="submit" id="submit" type="submit" class="btn" value="提交"/></li>
    </ul>

  </form>



</body>

</html>
