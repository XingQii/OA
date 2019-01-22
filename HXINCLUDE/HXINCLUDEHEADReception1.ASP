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
