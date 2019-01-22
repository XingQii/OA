<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>无标题文档</title>
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
  </style>
  <link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
requestExist request("staffId")
 Dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from staff where id="&request("staffId"),conn,1,3
  recordSetExist rs
If Request("action")="revise" Then
  rs("name")=Request.Form("name")
  rs("number")=Request.Form("number")
  rs("sex")=Request.Form("sex")
  rs("age")=Request.Form("age")
  rs("position")=Request.Form("position")
  rs("entryDate")=Request.Form("entryDate")
  rs("remark")=Request.Form("remark")
  rs.Update
  rs.Update

  response.Write "<script>alert('修改成功!');location.href='staffList.asp';</script>"
End If

%>

	<div class="place">
  <span>位置：</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">首页</a></li>
  <li><a href="#">修改生产基地信息</a></li>
  </ul>
  </div>

  
    <form action="?action=revise&staffId=<%=request("staffId")%>" method="post">
      <ul class="forminfo">

        <li>
          <label for="name">员工姓名</label>
          <input  type="text" name="name" id="name" required value="<%=rs("name")%>">
          </li>
        <li>
          <label for="number">员工编码</label>
          <input  type="text" name="number" id="number" value="<%=rs("number")%>" required>
          </li>
        <li>
          <label for="sex">性别</label>
          <select name="sex" id="sex">
          <option value="1" >男</option>
          <option value="2" <%ifSelected 2,rs("sex")%>>女</option>
</select>
          </li>
        <li>
        <label for="age">年龄</label>
          <input  type="number" name="age" id="age" value="<%=rs("age")%>" required>
        </li>
        <li><label for="position">职位</label>
          <input  type="text" name="position" id="position" value="<%=rs("position")%>" required>
        </li>
        <li><label for="entryDate">入职时间</label>
          <input  type="text" name="entryDate" id="entryDate" value="<%=rs("entryDate")%>" required>
        </li>
        <li>
        <label for="remark">备注说明</label>
        <textarea name="remark" id="remark" cols="90" rows="10"><%=rs("remark")%></textarea>
        </li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="提交" /></li>
      </ul>

    </form>


<!--#include virtual = "/index/functions.asp"-->

</body>

</html>
