<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
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
  border: 1px solid orange;
  height: 30px;
  }
  input[type="date"]{
  width: 12%;
  }
  input[type="time"]{
  width: 8%;
  }
  input[id="result"]{
  width: 50%;
  }
  input[type="button"]{
    background-color:#F9ECD9 ;
    border: orange 1px solid;
  }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
  
    $(function () {
    var inspectionDate=new Date().toJSON().slice(0,10);
    var inspectionTime=new Date().toJSON().slice(11,16);
    $("#inspectionDate").attr("value",inspectionDate);
    $("#inspectionTime").attr("value",inspectionTime)
    });
;
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
  set rsAdd=Server.CreateObject("ADODB.Recordset")
  rsAdd.open "select top 1 * from inspectionLog",conn,1,3
  rsAdd.AddNew
  rsAdd("product")=Request.Form("product")
  rsAdd("productNumber")=Request.Form("productNumber")
  rsAdd("inspectionTime")=Request.Form("inspectionDate")&" "&Request.Form("inspectionTime")
  rsAdd("haveProblem")=Request.Form("haveProblem")
  rsAdd("files")=Request.Form("AnnexNo")

  rsAdd("result")=Request.Form("result")
  rsAdd("remark")=Request.Form("remark")
  rsAdd.Update
  alertAJump "提交成功!","inspectionList.asp"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">添加检测记录</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">
        <li>
          <label for="product">检测产品</label><input  type="text" name="product" id="product" required>
          </li>
        <li>
          <label for="productNumber">检测产品编号</label>
          <input  type="text" name="productNumber" id="productNumber" required>
          </li>
        <li><label for="inspectionTime">检测时间</label>
          <input  type="date" name="inspectionDate" id="inspectionDate" required>
          <input  type="time" name="inspectionTime" id="inspectionTime" required>
        </li>
        <li>
          <label for="haveProblem">是否有问题</label>
          <select name="haveProblem" id="haveProblem">
          <option value="1">是</option>
          <option value="0">否</option>
</select>
          </li>
        <li>
        <li>
        <label for="result">结果简述</label>
          <input  type="text" name="result" id="result" required>
        </li>
        <li>
        <label for="remark">详情</label>
        <textarea name="remark" id="remark" cols="90" rows="10"></textarea>
        </li>
        <li>
          <label for="uploadFile">上传附件</label>
          <input type="button" name="uploadFile" id="uploadFile" onclick="window.open('AnnexManagement.asp?AnnexNo=<%=strRandomNumber%>','addFile','width=400,height=250')" value="上传附件">
          <input type="hidden" name="AnnexNo" value="<%=strRandomNumber%>">
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
