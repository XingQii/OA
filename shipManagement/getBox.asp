
<!--#INCLUDE FILE="../HXINCLUDE/HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="../HXINCLUDE/HX_SETCOOKIE.ASP"-->

<%
Response.CharSet = "GB2312"
  Dim rsBox
  set rsBox=Server.CreateObject("Adodb.Recordset")
  If request("boxNumber")<>"" Then
  rsBox.open "select * from box where number='"&request("boxNumber")&"'",conn,1,1
  If Not rsBox.Eof Then
  response.Write rsBox("weightAmount")&"KG,"&rsBox("id")
  End If
  If rsBox.Eof Then
  response.Write "δ�ҵ���Ӧװ��"
  End If
  End If
  response.end
%>