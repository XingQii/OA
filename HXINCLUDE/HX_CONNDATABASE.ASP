<!--#INCLUDE FILE="HX_CONSTSTR.ASP"-->
<!--#include file="HX_SYSTEM.ASP"-->
<!--#INCLUDE FILE="HX_FUNCTION.ASP"-->
<!--#INCLUDE FILE="checksession.ASP"-->
<%
Function HX_Checknum(Numstr)
if isnull(Numstr) or Numstr=""  then
exit Function
else
if not isnumeric(Numstr) then
response.write"<center>非法操作导致程序中止!</center>"
response.end
else
HX_Checknum=int(Numstr)
end if
end if
End Function
Function HX_GoBack(Msgstr,url)
 If url<>"" and Msgstr<>"" Then
   response.Write("<script language=javascript>alert('"&Msgstr&"');location.href='"&url&"';</script>")
   response.end
 elseIf url="" and Msgstr<>"" Then
   response.Write("<script language=javascript>alert('"&Msgstr&"');history.go(-1);</script>")
   response.end
 else
   response.Write("<script language=javascript>window.close();</script>")
   response.end
 end if  
End Function

Function HX_Conn(Directory)'取得数据库对象
 ' on error resume next
  SET CONN=Server.CreateObject("ADODB.Connection")
  'dim AspToDllObject
  'Set AspToDllObject = Server.CreateObject("OA.Class1") 
 ' CONNSTR=AspToDllObject.OAConn(Directory)
  'CONNSTR=split(CONNSTR,";")(0)&";"&split(CONNSTR,";")(1)&";"&split(CONNSTR,";")(3)&";"&split(CONNSTR,";")(4)&";"&split(CONNSTR,";")(5)&";"
  CONN.open "Provider=SQLOLEDB;Persist Security Info=False;User ID=sa;pwd=123;Initial Catalog=SuYuanFix;Data Source=."
  'CONN.open CONNSTR
  
  If Err Then
			Err.Clear
			Response.Write "连接出错，请检查数据库连接字符串！"'&Err.Description
			Response.End
  End If
End Function 
 
Sub HX_ClosDB()'取得关闭数据库对象
  if isobject(conn) then
    CONN.close:Set CONN = Nothing
  end if
End Sub

Dim Fy_Url,Fy_a,Fy_x,Fy_Cs(),Fy_Cl,Fy_Ts,Fy_Zx 
'---定义部份 头------ 
Fy_Cl =1 '处理方式：1=提示信息,2=转向页面,3=先提示再转向 
Fy_Zx = "/index.Asp" '出错时转向的页面 
'---定义部份 尾------ 

On Error Resume Next 
Fy_Url=Request.ServerVariables("QUERY_STRING") 
Fy_a=split(Fy_Url,"&") 
redim Fy_Cs(ubound(Fy_a)) 
On Error Resume Next 
for Fy_x=0 to ubound(Fy_a) 
Fy_Cs(Fy_x) = left(Fy_a(Fy_x),instr(Fy_a(Fy_x),"=")-1) 
Next 
For Fy_x=0 to ubound(Fy_Cs) 
If Fy_Cs(Fy_x)<>"" Then 
If Instr(LCase(Request(Fy_Cs(Fy_x))),"'")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"select")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"update")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"chr")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"delete%20from")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),";")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"insert")<>0 or Instr(LCase(Request(Fy_Cs(Fy_x))),"mid")<>0 Or Instr(LCase(Request(Fy_Cs(Fy_x))),"master.")<>0 Or Instr(LCase(Request(Fy_Cs(Fy_x))),"and")<>0 Then 
Select Case Fy_Cl 
Case "1" 
Response.Write "<Script Language=JavaScript>alert(' 出现错误！参数 "&Fy_Cs(Fy_x)&" 的值中包含非法字符串！\n\n 请不要在参数中出现：and,select,update,insert,delete,chr 等非法字符！\n\n我已经设置了不能SQL注入，请不要对我进行非法手段！');history.go(-1);</Script>" 
Case "2" 
Response.Write "<Script Language=JavaScript>location.href='"&Fy_Zx&"'</Script>" 
Case "3" 
Response.Write "<Script Language=JavaScript>alert(' 出现错误！参数 "&Fy_Cs(Fy_x)&"的值中包含非法字符串！\n\n 请不要在参数中出现：,and,select,update,insert,delete,chr 等非法字符！\n\n设计了门，非法侵入请离开，谢谢！');location.href='"&Fy_Zx&"';</Script>" 
End Select 
Response.End 
End If 
End If 
Next 




%>