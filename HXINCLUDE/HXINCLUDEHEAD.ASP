<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%option explicit
response.buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
const Dir=1
RedirectU="../HXSYSTEMSET/Register.asp"%>
<!--#INCLUDE FILE="HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="HX_MD5.ASP"-->
<!--#INCLUDE FILE="HX_SETCOOKIE.ASP"-->
<!--#INCLUDE FILE="HX_WSOASSkin.ASP"-->
<SCRIPT language="JScript" src="../HXWSOASJS/WSOASFunction.js"></SCRIPT>
<link rel=stylesheet type=text/css href="../../HXINCLUDE/HX_Style.css">
<link rel=stylesheet type=text/css href="../HXSkin/Default/Css.css">
<link rel=stylesheet type=text/css href="../HXSkin/<%=WSOASSkin%>/Css.css">
<META HTTP-EQUIV="expires" CONTENT="0"> 