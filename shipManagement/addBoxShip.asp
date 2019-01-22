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
  var boxNumber=document.getElementById("boxNumber").value;
  main.sendAjax("getBox.asp?boxNumber="+boxNumber, "GET", nop);

  function nop(val)
  {
   var product=val.split(",");
  document.getElementById('boxPrompt').value=product[0];
  document.getElementById('boxId').value=product[1];
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
  var shipDate=new Date().toJSON().slice(0,10);
  $("#shipDate").attr("value",shipDate);
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
  requestExist Request.Form("boxId")
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from ship",conn,1,3
  rsAdd.AddNew
  rsAdd("singleOrBox")=2
  rsAdd("shipDate")=Request.Form("shipDate")
  rsAdd("shipWay")=Request.Form("shipWay")
  rsAdd("receiverName")=Request.Form("receiverName")
  rsAdd("receiverLocation")=Request.Form("receiverLocation")
  rsAdd("receiverContact")=Request.Form("receiverContact")
  rsAdd("receiverPhone")=Request.Form("receiverPhone")
  rsAdd("matchId")=Request.Form("boxId")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update
  alertAJump "提交成功！","/index/index.asp"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">整箱发货</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">

        <li>
        <label for="shipDate">发货时间</label>
          <input  type="date" name="shipDate" id="shipDate" required>
        </li>
        <li>
        <label for="shipWay">运输方式</label>
          <input  type="text" name="shipWay" id="shipWay" required>
        </li>
        <li>
        <label for="receiverName">收货单位名称</label>
          <input  type="text" name="receiverName" id="receiverName" required>
        </li>
        <li>
        <label for="receiverLocation">收货单位地址</label>
          <input  type="text" name="receiverLocation" id="receiverLocation" required>
        </li>
        <li>
        <label for="receiverContact">收货单位联系人</label>
          <input  type="text" name="receiverContact" id="receiverContact" required>
        </li>
        <li>
        <label for="receiverPhone">收货单位电话</label>
          <input  type="text" name="receiverPhone" id="receiverPhone" required>
        </li>
        <li>
        <label for="boxNumber">装箱编号</label>
          <input  type="text" name="boxNumber" id="boxNumber" required>
          <input type="text" id="boxPrompt" name="boxPrompt">
          <input type="hidden" id="boxId" name="boxId">
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
