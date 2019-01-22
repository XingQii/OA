<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
  function runClock() {
  
  theTime = window.setTimeout("runClock()", 5000);
  main.sendAjax("message.asp?t="+new Date().getTime(), "GET", nop);
  
  
  }
  function nop(val)
  {
  document.getElementById('messagenum').innerHTML=val;
  }

</script>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  
  <style type="text/css">

    hr{
      border:none;
      border-top: solid 2px orange ;
      width: 85%;
      margin-left: 4%;
    }
    table{
      margin-left: 5%;
      width: 80%;
      text-align: left;
    }
    table td{
      padding: 7px;
      padding-left: 6%;
    }
    table th{
      padding: 3% 3% 1% 3%;
    }
    .mainindex span:last-child{
      margin-left: 5%;
      margin-top: 3%;
    }
    div.place+div{
      margin-top: 2%;
      margin-left:4%;
    }
    table a:hover{
    color: #EB5409;
    }
    table a{
    text-decoration: underline;
    color: #EB5409;
    }
  </style>
</head>


<body>
<!--#include file = "connDB.asp"-->
<%Dim rs,rsTime
set rsTime=Server.CreateObject("Adodb.RecordSet")
rsTime.open "select top 2 * from loginLog where loginId="&session("loginId")&" order by id desc ",conn,1,1
If Not rsTime.Eof Then
rsTime.MoveNext
End If
%>


<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
  </ul>
</div>
<div>

<div class="welinfo">
<span><img src="../images/sun.png" alt="天气" /></span>
<b><%=session("username")%>你好，欢迎使用信息管理系统</b>
<a href="#" onclick="changePage(2)">设置</a>
</div>

<div class="welinfo">
<span><img src="../images/time.png" alt="时间" /></span>
<i>您上次登录的时间：<%If Not rsTime.Eof Then%><%=rsTime("loginTime")%><%End If%></i> （不是您登录的？<a href="#" onclick="changePage(1)">请点这里</a>）
</div>
</div>
  <hr /><!--
  <table>
    <thead>
  <tr><th>暂时没有新的工作提示。</th></tr>
    <tr><th>这是最新的工作提示:</th></tr>
    </thead>
    <tbody>
    <tr>
      <td><a href="/personalWorkManage/checkInformDetail.asp?action=read&informId=<%=rs("id")%>"><%=rs("title")%></a></td>
    </tr>

    </tbody>
  </table>-->
</div>
</body>

</html>
<script >
  function changePage(i)
  {
  if(i==1)
  {
  parent.document.getElementById('leftFrame').src='/system-setting/left.asp?action=changePassWord';
  parent.document.getElementById('rightFrame').src='/personalSetting/updatePassword.asp';

  }
  if(i==2)
  {
  parent.document.getElementById('leftFrame').src='/index/left.asp';
  parent.document.getElementById('rightFrame').src='/personalWorkManage/personalInfo.asp';

  }
  }
</script>