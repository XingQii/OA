<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>

<script type="text/javascript">

  function getProduct() {
  var productNumber=document.getElementById("productNumber").value;
  main.sendAjax("getProduct.asp?productNumber="+productNumber, "GET", nop);

  function nop(val)
  {
   var product=val.split(",");
  document.getElementById('productName').value=product[0];
  document.getElementById('productId').value=product[1];
  	}
  }

</script>
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
    #productName{
    border: none;
    }
    .forminfo label{
    width: 15%;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
  $(function () {
  var stockOutDate=new Date().toJSON().slice(0,10);
  $("input").bind("input propertychange",function() {
    if($("#productNumber").val()!=""){
      getProduct();
    }
  })
  });
  </script>

</head>

<body>
<!--#include File = "../index/connDB.asp"-->
<%

If Request("action")="add" Then
    requestExistAndAlert Request.Form("productName"),"�Ҳ�����Ӧ�ڲ�Ʒ��ŵĲ�Ʒ����ͨ���Զ���д�Ĳ�Ʒ����ȷ����ȷ��ţ�"
  Dim rsBase
  set rsBase=Server.CreateObject("ADODB.Recordset")
  rsBase.open "select * from productBase where name='"&Request.Form("productBase")&"'",conn,1,1
  rsExistAndAlert rsBase,"�Ҳ�����Ӧ�Ļ������ƣ���������д��"
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from plot",conn,1,3
  rsAdd.AddNew
  rsAdd("plotNumber")=Request.Form("plotNumber")
  rsAdd("productBaseId")=rsBase("id")
  rsAdd("productId")=Request.Form("productId")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update
  alertAJump "�ύ�ɹ���","plotList.asp"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">��ӵؿ�</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">
        <li>
        <label for="plotNumber">�ؿ���</label>
          <input  type="text" name="plotNumber" id="plotNumber" required>
        </li>
        <li><li>
        <label for="productBase">������������</label>
          <input  type="text" name="productBase" id="productBase" required>
        </li>
        <li>
          <label for="productNumber">��ǰ������Ʒ���</label>
          <input  type="text" name="productNumber" id="productNumber" required>
        </li>
        <li>
          <label for="productName">��ǰ������Ʒ����</label>
          <input  type="text" name="productName" id="productName" readonly required>
          <input  type="text" name="productId" id="productId"  hidden>
        </li>
        <li>
        <label for="remark">����</label>
        <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>
<script>
</script>
</html>
