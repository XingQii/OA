<!--#INCLUDE virtual="HXINCLUDE/HX_CONNDATABASE.ASP"-->
<!--#INCLUDE virtual="HXINCLUDE/HX_Md5.ASP"-->
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>欢迎登录后台管理系统</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/jquery.js"></script>
<script src="/js/cloud.js" type="text/javascript"></script>
<style>
input[type="checkbox"]{
vertical-align: bottom;
}
</style>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
<%
  If request("action")="signOut" Then
     session("loginid")=""
     session("loginname")=""
     session("username")=""
  End If


  if request("action")="login" then
  set rs= Server.CreateObject("ADODB.Recordset")
  rs.open "select * from login where loginName='"&request("loginuser")&"' and password='"&md5(request("loginpwd"))&"' And exist=1",conn,1,1
  if rs.recordcount>0 then
  session("loginId")=rs("id")
  session("loginName")=rs("loginName")
  session("username")=rs("username")
  Dim rslog
  set rslog= Server.CreateObject("ADODB.Recordset")
  rslog.open "select * from loginlog",conn,1,3
  rslog.AddNew
  rslog("loginId")=session("loginid")
  rslog("loginIp")=getipadd()
  rslog("loginTime")=now
	rslog.update
  response.Write "<script>alert('登录成功');location.href='/index/home.html'</script>"
  response.End()
  else
  response.Write "<script>alert('用户名密码错误，请重新登录');location.href='login.asp';</script>"
  response.End()
  end if
  end if

  function getipadd()
   ipadd=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
   if ipadd= "" Then ipadd=Request.ServerVariables("REMOTE_ADDR")
   getipadd=ipadd
  end function
%>
</head>

<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox loginbox2">
    <form action="?action=login" method="post">
    <ul>
    <li><input name="loginuser" type="text" class="loginuser" value="admin" onclick="JavaScript:this.value=''"/></li>
    <li><input name="loginpwd" type="password" class="loginpwd"  onclick="JavaScript:this.value=''"/></li>
    <li class="yzm">
    <span><input name="" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span><cite>X3D5S</cite> 
    </li>
    <li><input name="" type="submit" class="loginbtn" value="登录"     /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    
    
	
    
</body>

</html>
