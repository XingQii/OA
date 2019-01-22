<%dim r,upuser,dr3,dr4,dr5,rr11
'function getlen
'	l=0
'	i=1
'	while i>0
'		i=instr(i,application("onlinewy"),"[")
'		if i>0 then
'			l=l+1
'			i=i+1
'		end if
'		
'	wend
'	getlen=l
'end function
'function getm(ByVal k,ByRef rr1,ByRef rr2,ByRef rr3)
'	j=1
'	for i=1 to k
'		if j>0 then j=instr(j,application("onlinewy"),"[")
'		if j>0 then j=j+1
'	next
'	if j>0 then
'		i=instr(j,application("onlinewy"),",")
'		rr11=mid(application("onlinewy"),j,i-j)
'		if IsNumeric(rr11)=true then
'			rr1=cint(rr11)
'		else
'			rr1=-1
'		end if
'		rr3=mid(application("onlinewy"),i+1,instr(i+1,application("onlinewy"),",")-i-1)
'		i=instr(i+1,application("onlinewy"),",")
'		rr2=mid(application("onlinewy"),i+1,instr(i,application("onlinewy"),"]")-i-1)
'	else
'		rr1=-1
'		rr2=""
'		rr3=""
'	end if
'end function
'
'function checkm()
'	l=0
'	upuser=0
'	for i=getlen to 1 step -1
'		getm i,dr3,dr4,dr5
'		if(cint(dr3)=cint(application("onlinewy")))then
'			response.Write"<br><br>"
'			response.Write "<center>您的帐户已在别处登录</center>"
'			response.write"<br>"
'			response.Write"<center><a href=index.asp target=_self>请重新登录</a></center>"
'			response.End
'		end if
'	next
'	checkm=l
'end function
'
'function checkdelete()
'	l=0
'	upuser=0
'	for i=getlen to 1 step -1
'		getm i,dr3,dr4,dr5
'		if DateDiff("s",dr4,now)>100 then
'			if(dr3=application("onlinewy"))then
'				delm i
'			end if
'		else
'			if dr3<>upuser then
'				l=l+1
'				upuser=dr3
'			end if
'		end if
'	next
'	checkdelete=l
'end function
'
'function delm(k)		
'	j=1
'	for i=1 to k
'		if j>0 then j=instr(j,application("onlinewy"),"[")
'		if j>0 then j=j+1
'	next
'	if j>0 then
'		l=left(application("onlinewy"),j-2)
'		r=mid(application("onlinewy"),instr(j,application("onlinewy"),"]")+1)
'		application("onlinewy")=l&r
'	end if
'end function

	function getlen
		l=0
		i=1
		while i>0
			i=instr(i,application("onlinewy"),"[")
			if i>0 then
				l=l+1
				i=i+1
			end if
		wend
		getlen=l
	end function

	function getm(ByVal k,ByRef rr1,ByRef rr2,ByRef rr3)
		j=1
		for i=1 to k
			if j>0 then j=instr(j,application("onlinewy"),"[")
			if j>0 then j=j+1
		next
		if j>0 then
			i=instr(j,application("onlinewy"),",")
			rr11=mid(application("onlinewy"),j,i-j)
			if IsNumeric(rr11)=true then
				rr1=cint(rr11)
			else
				rr1=-1
			end if
			rr3=mid(application("onlinewy"),i+1,instr(i+1,application("onlinewy"),",")-i-1)
			i=instr(i+1,application("onlinewy"),",")
			rr2=mid(application("onlinewy"),i+1,instr(i,application("onlinewy"),"]")-i-1)
		else
			rr1=-1
			rr2=""
			rr3=""
		end if
			response.Write "dd"&rr2&",,,"

	end function

	function setm(k)
		j=instr(application("onlinewy"),"["&k&","&Request.ServerVariables("REMOTE_HOST"))
		if j>0 then
			i=instr(j,application("onlinewy"),",")
			l=left(application("onlinewy"),j)
			r=mid(application("onlinewy"),instr(j,application("onlinewy"),"]"))
			application("onlinewy")=l&k&","&Request.ServerVariables("REMOTE_HOST")&","&now&r
		else
			j=instr(application("onlinewy"),"["&k)
			if j>0 then
				l=left(application("onlinewy"),j-1)
				r=mid(application("onlinewy"),j)
				application("onlinewy")=l&"["&k&","&Request.ServerVariables("REMOTE_HOST")&","&now&"]"&r
			else
				application("onlinewy")=application("onlinewy")&"["&k&","&Request.ServerVariables("REMOTE_HOST")&","&now&"]"
			end if
		end if
	end function

	function delm(k)		
		j=1
		for i=1 to k
			if j>0 then j=instr(j,application("onlinewy"),"[")
			if j>0 then j=j+1
		next			
		if j>0 then
			l=left(application("onlinewy"),j-2)
			r=mid(application("onlinewy"),instr(j,application("onlinewy"),"]")+1)
			application("onlinewy")=l&r
		end if
	end function

	function checkm()
		l=0
		upuser=0
		for i=getlen to 1 step -1
			getm i,dr3,dr4,dr5
			response.Write dr4
			
			if DateDiff("s",dr4,now)>90 then
				delm i
			else
				if dr3<>upuser then
					l=l+1
					upuser=dr3
				end if
			end if
		next
		checkm=l
	end function
%>