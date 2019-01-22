<%if not WS_S.HX_ISLogin then
  url=""
  for ii=0 to dir-1
   url=url&"../"
  next
  url=url&"HX_LOGIN.ASP"
else
  Call WS_S.HX_UserJurisdiction() 
end if
%>
