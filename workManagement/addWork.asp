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
  document.getElementById('productName').value=product[0];
  document.getElementById('productId').value=product[1];
  document.getElementById('getPId').value=product[1];
  var process=document.getElementById('processId').value=product[1];
  i=2;
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
    .forminfo input[type="date"]{
      width: 10%;
    }
    .forminfo input[type="time"]{
      width: 8%;
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
    .forminfo input{
    width: 30%;
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
    #productName,#productNumber{
    border: none;
    }
    .forminfo label{
    width: 10%;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
  $(function () {
  var date=new Date().toJSON().slice(0,10);
  var time=new Date().toJSON().slice(11,16);
  $("#date").attr("value",date);
  $("#time").attr("value",time);
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
requestExist request("productId")
Dim rsProduct
set rsProduct=Server.CreateObject("ADODB.Recordset")
rsProduct.open "select * from product where id="&request("productId")&" And exist=1",conn,1,1
recordSetExist rsProduct

Dim rsProcess
set rsProcess=Server.CreateObject("ADODB.Recordset")
rsProcess.open "select * from process where productId="&request("productId")&" And exist=1",conn,1,1
rsExistAndAlert rsProcess,"所选择的产品还没有任何流程！请先为其添加流程！"

If Request("action")="add" Then
requestExistAndAlert Request.Form("processId"),"请选择溯源流程！"
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from work",conn,1,3
  rsAdd.AddNew
  rsAdd("productId")=rsProduct("id")
  rsAdd("processId")=Request.Form("processId")
  rsAdd("workName")=Request.Form("workName")
  rsAdd("date")=Request.Form("date")
  rsAdd("time")=Request.Form("time")
  rsAdd("workLog")=Request.Form("workLog")
  rsAdd.Update
  alertAJump "提交成功！","workList.asp"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加生产流程</a></li>
  </ul>
  </div>
    <form action="?action=add&productId=<%=request("productId")%>" method="post">
      <ul class="forminfo">
        <li>
          <label for="productNumber">产品编号</label>
          <input  type="text" name="productNumber" id="productNumber" required value="<%=rsProduct("number")%>">
        </li>
        <li>
          <label for="productName">产品名称</label>
          <input  type="text" name="productName" id="productName" readonly required value="<%=rsProduct("name")%>">
          <input  type="text" name="productId" id="productId"  hidden>
        </li>
        <li>
        <label for="processId">溯源流程</label>
        <select name="processId" id="processId">
        <option value="<%=rsProcess("id")%>">请选择溯源流程</option>
        <%Do While Not rsProcess.Eof %>
        <option value="<%=rsProcess("id")%>"><%=rsProcess("process")%></option>
        <%rsProcess.MoveNext
        Loop%>
</select>
</li>
        <li>
        <label for="workName">作业名称</label>
          <input  type="text" name="workName" id="workName" required>
        </li>
        <li>
        <label for="time">时间</label>
          <input  type="date" name="date" id="date" required>
          <input  type="time" name="time" id="time" required>
        </li>
        <li>
        <label for="workLog">作业记录</label>
        <textarea name="workLog" id="workLog" cols="90" rows="20"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>
<script>
</script>
</html>
