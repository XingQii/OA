
<!--#INCLUDE FILE="../HXINCLUDE/HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="../HXINCLUDE/HX_SETCOOKIE.ASP"-->

<%
Response.CharSet = "GB2312"
  Dim rsProduct
  set rsProduct=Server.CreateObject("Adodb.Recordset")
  If request("productNumber")<>"" Then
  rsProduct.open "select * from product where number='"&request("productNumber")&"'",conn,1,1
  If Not rsProduct.Eof Then
  response.Write rsProduct("name")&","&rsProduct("id")
  End If
  If rsProduct.Eof Then
  response.Write "未找到对应产品"
  End If
  End If
  response.end
%>