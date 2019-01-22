<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
    select{
      width: 10%;
    }
    input,select{
      top: 3px;
      cursor: pointer;
      height: 28px;
      border: orange 1px solid;
    }
    form{
      margin:3%
    }
    form li {
      margin: 1% 0 1% 0%;
    }
    input::-webkit-inner-spin-button {
      display: none;
    }
    table{
      vertical-align: middle;
      text-align: center;
  
    }
    
    td{
      text-align: center;
  
      word-break: keep-all;
      white-space:nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    form table tr td:first-child{
      width:50%;
    }
    .tablelist th{
      vertical-align: middle;
      text-align: center;
  
    }

    tbody tr:nth-child(even){
      background: #F9ECD9;
    }
    div+table.tablelist th  {
      
      width: 20%;
      line-height: 0;
      padding:0;
    }
    input[type="checkbox"]{
      vertical-align: middle;
    }

     input[type="submit"]{
    background-color: #f74f1d	;
    border: none;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">


</head>

<body>
<!--#include file = "../index/connDB.asp"-->

<%
requestExist request("loginId")
Dim rs
set rs=Server.CreateObject("Adodb.RecordSet")
rs.open "select * from power where loginId="&request("loginId"),conn,1,3

If request("action")="setPower" Then
  If rs.Eof Then
    rs.AddNew
    rs("loginId")=request("loginId")
  End If
  arrSelectedPowers=split(request("selectedPowers"),",")
  rs("addProduct")=0
  rs("addProductBase")=0
  For i=0 to ubound(arrSelectedPowers)
    rs(trim(arrSelectedPowers(i)))=1
  Next
    rs.Update
  response.Write "<script>alert('修改权限成功！');location.href='userList.asp';</script>"
End If
%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">修改权限</a></li>
  </ul>
  </div>
  
  <form action="?action=setPower&loginId=<%=request("loginId")%>" method="post">
  <ul>     
        <li>
          <label for="addProduct">审批权限</label>
        </li>
        <li>
  
          <input type="checkbox" value="addProduct" id="addProduct" name="selectedPowers" <%If Not rs.EOf Then
          If rs("addProduct")=True Then
          response.Write "checked='checked'"
          End If
          End If%>>添加产品
        </li>
        <li>
          <label for="addProductBase">项目前</label>
        </li>
        <li>
          <input type="checkbox" value="addProductBase" id="addProductBase" name="selectedPowers"<%If Not rs.EOf Then
          If rs("addProductBase")=True Then%> checked="checked"<%End If
          End If%>>添加生产基地
        </li>
        <li>
          <input type="submit" value="提交" class="btn">
        </li>
  </ul>

  </form>


<!--#include File="../index/functions.asp"-->
</body>

</html>
