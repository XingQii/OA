<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%option explicit
response.buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
const Dir=0%>
<!--#INCLUDE FILE="HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="HX_MD5.ASP"-->
<!--#INCLUDE FILE="HX_SETCOOKIE.ASP"-->
<!--#INCLUDE FILE="HX_WSOASSkin.ASP"-->
<!--#INCLUDE FILE="SkinAjaxJs.asp"-->
<SCRIPT language="JScript" src="../HXINCLUDE/HX_function.js"></SCRIPT>
<SCRIPT language="JScript" src="HXWSOASJS/WSOASFunction.Js"></SCRIPT>
<SCRIPT language="JScript" src="HXWSOASJS/WSOASTab.js"></SCRIPT>
<link rel=stylesheet type=text/css href="../HXINCLUDE/HX_Style.css">
<link rel=stylesheet type=text/css href="HXSkin/<%=WSOASSkin%>/Css.css">
<!--link rel=stylesheet type=text/css href="HXSkin/Default/Css.css"-->

