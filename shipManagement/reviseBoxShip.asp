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

requestExist request("shipId")

 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select *from ship where id="&request("shipId"),conn,1,3
  recordSetExist rs
 Dim rsBox
  set rsBox=Server.CreateObject("ADODB.Recordset")
  rsBox.open "select * from box where id="&rs("MatchId"),conn,1,1
recordSetExist rsBox

If Request("action")="revise" Then
  rs("shipDate")=Request.Form("shipDate")
  rs("shipWay")=Request.Form("shipWay")
  rs("receiverName")=Request.Form("receiverName")
  rs("receiverLocation")=Request.Form("receiverLocation")
  rs("receiverContact")=Request.Form("receiverContact")
  rs("receiverPhone")=Request.Form("receiverPhone")
  If rsBox("id")<>rs("matchId") Then
  rs("matchId")=Request.Form("boxId")
  End If
  rs("remark")=Request.Form("remark")
  rs.Update
  alertAJump "�ύ�ɹ���","/shipManagement/shipList.asp"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�޸����䷢��</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&shipId=<%=request("shipId")%>" method="post">
      <ul class="forminfo">

        <li>
        <label for="shipDate">����ʱ��</label>
          <input  type="date" name="shipDate" id="shipDate" required value="<%=rs("shipDate")%>">
        </li>
        <li>
        <label for="shipWay">���䷽ʽ</label>
          <input  type="text" name="shipWay" id="shipWay" required value="<%=rs("shipWay")%>">
        </li>
        <li>
        <label for="receiverName">�ջ���λ����</label>
          <input  type="text" name="receiverName" id="receiverName" required  value="<%=rs("receiverName")%>">
        </li>
        <li>
        <label for="receiverLocation">�ջ���λ��ַ</label>
          <input  type="text" name="receiverLocation" id="receiverLocation" required value="<%=rs("receiverLocation")%>">
        </li>
        <li>
        <label for="receiverContact">�ջ���λ��ϵ��</label>
          <input  type="text" name="receiverContact" id="receiverContact" required value="<%=rs("receiverContact")%>">
        </li>
        <li>
        <label for="receiverPhone">�ջ���λ�绰</label>
          <input  type="text" name="receiverPhone" id="receiverPhone" required value="<%=rs("receiverPhone")%>">
        </li>
        <li>
        <label for="boxNumber">װ����</label>
          <input  type="text" name="boxNumber" id="boxNumber" required  value="<%=rsBox("number")%>">
          <input type="text" id="boxPrompt" name="boxPrompt">
          <input type="hidden" id="boxId" name="boxId">
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
<script>
</script>
</html>
