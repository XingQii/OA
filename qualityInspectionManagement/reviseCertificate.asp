<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
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
requestExist request("certificateId")
Dim rs
set rs=Server.CreateObject("Adodb.RecordSet")
rs.open "select * from qualityInspection where id="&request("certificateId"),conn,1,3
recordSetExist rs
If Request("action")="revise" Then
  rs("certificateName")=Request.Form("certificateName")
  rs("certificateNumber")=Request.Form("certificateNumber")
  rs("relativeProducts")=Request.Form("relativeProducts")
  rs("issueDate")=Request.Form("issueDate")
  rs("validDate")=Request.Form("validDate")
  rs("remark")=Request.Form("remark")
  rs.Update
  response.Write "<script>alert('提交成功');location.href='certificateList.asp'</script>"
  End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">修改证书</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&certificateId=<%=request("certificateId")%>" method="post">
      <ul class="forminfo">
        <li>
            <label for="certificateName">证书名</label>
            <input type="text" name="certificateName" id="certificateName" value="<%=rs("certificateName")%>" required>
        </li>
        <li>
            <label for="certificateNumber">证书编号</label>
            <input type="text" name="certificateNumber" id="certificateNumber" value="<%=rs("certificateNumber")%>" required>
        </li>
        <li>
          <label for="relativeProducts">相关产品</label>
          <input type="text" name="relativeProducts" id="relativeProducts" value="<%=rs("relativeProducts")%>" required>
        </li>
        <li>
          <label for="issueDate">发证日期</label>
          <input type="date" name="issueDate" id="issueDate" value="<%=rs("issueDate")%>" required>
        </li>
        <li>
          <label for="validDate">有效期至</label>
          <input type="date" name="validDate" id="validDate" value="<%=rs("validDate")%>" required>
        </li>
        <li>
           <label>证书说明</label><textarea name="remark" class="textinput" id="remark"  placeholder="请输入证书说明"><%=rs("remark")%></textarea></li>
        <li>
          <label for="uploadFile">上传附件</label>
          <input type="button" name="uploadFile" id="uploadFile" onclick="window.open('AnnexManagement.asp?AnnexNo=<%=rs("files")%>','addFile','width=400,height=250')" value="上传附件">
          <input type="hidden" name="AnnexNo" value="<%=rs("files")%>">
        </li>

        <li><input name="submit" id="submit" type="submit" class="btn" value="提交"/></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
