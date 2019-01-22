<%
	dim rsinfo
	Dim admin,contentlen,userip
	Dim ListCount1,ListCount2
	set rsinfo=WS_S.HX_SetRSD("","HX_BbsInfo","")
	if rsinfo.recordcount>0 then
		contentlen=rsinfo("WS_contentlen")
		ListCount1=rsinfo("WS_ListCount1")
		ListCount2=rsinfo("WS_ListCount2")
		admin=rsinfo("WS_admin")
	end if
    WS_S.HX_RSClose rsinfo
	userip=Request.ServerVariables("HTTP_guest")
	if userip = ""  then userip=Request.ServerVariables("remote_addr")

%>