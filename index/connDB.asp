
<%dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.open "Provider=SQLOLEDB;Persist Security Info=False;User ID=sa;pwd=123;Initial Catalog=SuYuanFix;Data Source=."

If session("loginName")="" Then
response.Write "<script>alert('µÇÂ¼³¬Ê±£¬ÇëÖØĞÂµÇÂ¼£¡');window.parent.location.href='/index/login.asp'</script>"
End If

%>