<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">

    input{
      top: 3px;
      cursor: pointer;
      height: 28px;
      border: orange 1px solid;
    }
    input[type="date"]{
      top: 3px;
      cursor: pointer;
      height: 28px;
      border: orange 1px solid;
      
      
    }
    form li{
      margin: 25px 0 25px 40px;
    }
    input,textarea{
      width: 20%;
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
      display: inline-block;
      vertical-align: middle;
      text-align: center;
    }
    input[type="button"]{
      background-color:#F9ECD9 ;
      border: orange 1px solid;
    }

    .forminfo input[type="submit"]{
    background-color: #f74f1d	;
    border: none;
    }
    input::-webkit-inner-spin-button {
      display: none;
    }
    .forminfo li label{
        width: 15%;
    }
    
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
    $(function () {
    var dateNow=new Date();
    dateNow=dateNow.toJSON().slice(0,10);
    $("#issueDate").attr("value",dateNow);
    $("#validDate").attr("value",dateNow);
    $("input").attr("required","required");
    

    });
  </script>

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
Randomize
Dim strRandomNumber
strRandomNumber=Date()
strRandomNumber=replace(strRandomNumber,"/","")
strRandomNumber=strRandomNumber&Cint(Rnd*10000)


If Request("action")="add" Then
  Dim rsAdd
  set rsAdd= Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select * from qualityInspection",conn,1,3
  rsAdd.AddNew
  rsAdd("certificateName")=Request.Form("certificateName")
  rsAdd("certificateNumber")=Request.Form("certificateNumber")
  rsAdd("relativeProducts")=Request.Form("relativeProducts")
  rsAdd("issueDate")=Request.Form("issueDate")
  rsAdd("validDate")=Request.Form("validDate")
  rsAdd("remark")=Request.Form("remark")
  rsAdd("files")=Request.Form("AnnexNo")
  rsAdd.Update
  response.Write "<script>alert('�ύ�ɹ�');location.href='certificateList.asp'</script>"
  End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">¼���ͬ</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">
        <li>
            <label for="certificateName">֤����</label>
            <input type="text" name="certificateName" id="certificateName">
        </li>
        <li>
            <label for="certificateNumber">֤����</label>
            <input type="text" name="certificateNumber" id="certificateNumber">
        </li>
        <li>
          <label for="relativeProducts">��ز�Ʒ</label>
          <input type="text" name="relativeProducts" id="relativeProducts">
        </li>
        <li>
          <label for="issueDate">��֤����</label>
          <input type="date" name="issueDate" id="issueDate">
        </li>
        <li>
          <label for="validDate">��Ч����</label>
          <input type="date" name="validDate" id="validDate">
        </li>
        <li>
           <label>֤��˵��</label><textarea name="remark" class="textinput" id="remark"  placeholder="������֤��˵��"
          ></textarea></li>
        <li>
          <label for="uploadFile">�ϴ�����</label>
          <input type="button" name="uploadFile" id="uploadFile" onclick="window.open('AnnexManagement.asp?AnnexNo=<%=strRandomNumber%>','addFile','width=400,height=250')" value="�ϴ�����">
          <input type="hidden" name="AnnexNo" value="<%=strRandomNumber%>">
        </li>

        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ"/></li>
      </ul>

    </form>



</body>

</html>
