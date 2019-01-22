<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
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
  document.getElementById('productPrompt').value=product[0];
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
    #productPrompt{
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
  requestExist Request.Form("productId")
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from packing",conn,1,3
  rsAdd.AddNew
  rsAdd("number")=Request.Form("number")
  rsAdd("bigOrSmall")=Request.Form("bigOrSmall")
  rsAdd("productId")=Request.Form("productId")
  rsAdd("weightAmount")=Request.Form("weightAmount")
  rsAdd("boxAmount")=Request.Form("boxAmount")
  rsAdd("boxLength")=Request.Form("boxLength")
  rsAdd("boxWidth")=Request.Form("boxWidth")
  rsAdd("boxHeight")=Request.Form("boxHeight")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update
  alertAJump "提交成功！","/packing/packingList.asp"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加装箱</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">
        <li>
        <label for="number">装箱编号</label>
          <input  type="text" name="number" id="number" required>
        </li>
        <li>
        <label for="bigOrSmall">大箱小箱</label>
          <select  type="text" name="bigOrSmall" id="bigOrSmall" required>
          <option value="1">大箱</option>
          <option value="2">小箱</option>
</select>
        </li>
        <li>
        <label for="productNumber">产品编号</label>
          <input  type="text" name="productNumber" id="productNumber" required>
          <input type="text" id="productPrompt" name="productPrompt" readonly>
          <input type="hidden" id="productId" name="productId">
        </li>
        <li><li>
        <label for="weightAmount">产品连包装净重</label>
          <input  type="text" name="weightAmount" id="weightAmount" required>KG
        </li>
        <li>
          <label for="boxAmount">单个外箱净重</label>
          <input  type="text" name="boxAmount" id="boxAmount" required>KG
        </li>
        <li>
          <label for="boxLength">外箱长</label>
          <input  type="text" name="boxLength" id="boxLength" required>CM
        </li>
        <li>
          <label for="boxWidth">外箱宽</label>
          <input  type="text" name="boxWidth" id="boxWidth" required>CM
        </li>
        <li>
          <label for="boxHeight">外箱高</label>
          <input  type="text" name="boxHeight" id="boxHeight" required>CM
        </li>
        <li>
        <label for="remark">详情</label>
        <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>
<script>
</script>
</html>
