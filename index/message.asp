<!--#INCLUDE FILE="../HXINCLUDE/HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="../HXINCLUDE/HX_SETCOOKIE.ASP"-->
<%
dim txt
set rs=WS_S.HX_SetRSD("","inform"," where ifRead=0 and readerId="&session("loginid")&"")

response.Write rs.recordcount
response.End()
%>
<%
Function vbsEscape(str)
    dim i,s,c,a
    s=""
    For i=1 to Len(str)
        c=Mid(str,i,1)
        a=ASCW(c)
        If (a>=48 and a<=57) or (a>=65 and a<=90) or (a>=97 and a<=122) Then
            s = s & c
        ElseIf InStr("@*_+-./",c)>0 Then
            s = s & c
        ElseIf a>0 and a<16 Then
            s = s & "%0" & Hex(a)
        ElseIf a>=16 and a<256 Then
            s = s & "%" & Hex(a)
        Else
            s = s & "%u" & Hex(a)
        End If
    Next
    vbsEscape = s
End Function
%>