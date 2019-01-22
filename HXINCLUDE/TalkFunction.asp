<%
Function getstrlen(byval mys)
	if isnull(mys) then
		getstrlen=0
	else
		dim n_strlen,s_char,ts,i
		ts=0
		n_strlen=Len(mys)
		For i = 1 To n_strlen
			s_char = Mid(mys, i, 1)
			If Asc(s_char) >= 0 and Asc(s_char) <= 255 Then
				ts = ts + 1
			else
				ts=ts+2
			End If
		Next
		getstrlen=ts
	end if
end function

Function OutAreamaster(UidStr)
  OutAreamaster="<font color=red>‘› ±ø’»±</font>"
  if UidStr<>"" then
	OutAreamaster=WS_S.OutMemberTrueName(UidStr,10)
  end if
End Function
%>