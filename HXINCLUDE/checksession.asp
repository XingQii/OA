<%
function session_e()
if Session("type_id")="" then
  response.Write "<script>alert('对不起，您没有权限。');history.go(-1);</script>"
  response.End()
else
	if Session("type_id")=0 then
		response.Write "<script>alert('对不起，您没有权限。');history.go(-1);</script>"
		response.End()
	end if
end if
end function 
function session_erp()
if Session("UnitType")="" then
  response.Write "<script>alert('对不起，您没有权限。');history.go(-1);</script>"
  response.End()
end if
end function 
function session_m()
if Session("type_id")="" then
  response.Write "<script>alert('对不起，您没有权限。');history.go(-1);</script>"
  response.End()
else
	if Session("type_id")=1 then
		response.Write "<script>alert('对不起，您没有权限。');history.go(-1);</script>"
		response.End()
	end if
end if
end function 
%>
