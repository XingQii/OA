<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
    .select-box{

      width: 10%;
    }
    input[type="date"],.select-box{
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

  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
    $(function () {
    var establishDate=new Date().toJSON().slice(0,10);
    });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
If Request("action")="add" Then
  Dim rsAdd
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from farm",conn,1,3
  rsAdd.AddNew
  rsAdd("farmNumber")=Request.Form("farmNumber")
  rsAdd("farmPlace")=Request.Form("farmPlace")
  rsAdd("farmName")=Request.Form("farmName")
  rsAdd("farmProductNumber")=Request.Form("farmProductNumber")
  rsAdd("farmRemark")=Request.Form("farmRemark")
  rsAdd.Update

  response.Write "<script>alert('�ύ�ɹ�!');location.href='farmList.asp';</script>"
End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">���ũ��</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">

        <li>
          <label for="farmNumber">ũ�����</label><input  type="text" name="farmNumber" id="farmNumber" required>
          </li>
        
        <li><label for="farmPlace">ũ��λ��</label>
          <input  type="text" name="farmPlace" id="farmPlace" required>
        </li>
        <li><label for="farmName">ũ������</label>
          <input  type="text" name="farmName" id="farmName" required>
        </li>
        <li><label for="farmProductNumber">����Ʒ����</label>
          <input  type="text" name="farmProductNumber" id="farmProductNumber" required>
        </li>
        <li>
        <label for="farmRemark">����</label>
        <textarea name="farmRemark" id="farmRemark" cols="90" rows="10"></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
