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
    select{
    border: 1px solid orange;
    height: 30px;
    }
    input[type="button"]{
      background-color:#F9ECD9 ;
      border: orange 1px solid;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("inspectionId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from inspectionLog where id="&request("inspectionId"),conn,1,3
  recordSetExist rs
If Request("action")="revise" Then
  rs("product")=Request.Form("product")
  rs("productNumber")=Request.Form("productNumber")
  rs("inspectionTime")=Request.Form("inspectionDate")&" "&Request.Form("inspectionTime")
  rs("haveProblem")=Request.Form("haveProblem")
  rs("result")=Request.Form("result")
  rs("remark")=Request.Form("remark")
  rs.Update
  alertAJump "�޸ĳɹ�!","inspectionList.asp"

End If

%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="/inspectionManagement/inspectionList.asp">����¼�б�</a></li>
  <li><a href="#">�޸ļ���¼</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&inspectionId=<%=request("inspectionId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="product">����Ʒ</label>
          <input  type="text" name="product" id="product" required value="<%=rs("product")%>">
          </li>
        <li>
          <label for="productNumber">Ա������</label>
          <input  type="text" name="productNumber" id="productNumber" value="<%=rs("productNumber")%>" required>
          </li>
        <li>
          <label for="inspectionTime">���ʱ��</label>
          <input  type="text" name="inspectionTime" id="inspectionTime" value="<%=rs("inspectionTime")%>" required>
          </li>
          <li>
          <label for="haveProblem">�Ƿ�������</label>
          <select name="haveProblem" id="haveProblem">
          <option value="1">��</option>
          <option value="0" <%ifSelected 0,rs("haveProblem")%>>��</option>
</select>
          </li>
        <li>
        <label for="result">�������</label>
          <input  type="text" name="result" id="result" value="<%=rs("result")%>" required>
        </li>
        <li>
        <label for="remark">����</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li>
                <label for="uploadFile">�ϴ�����</label>
                <input type="button" name="uploadFile" id="uploadFile" onclick="window.open('AnnexManagement.asp?AnnexNo=<%=rs("files")%>','addFile','width=400,height=250')" value="�ϴ�����">
                <input type="hidden" name="AnnexNo" value="<%=rs("files")%>">
              </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
