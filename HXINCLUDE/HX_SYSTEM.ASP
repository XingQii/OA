<%
CLASS HX_SYSTEMCONFIG
'防sql注入
   Public function HX_Replace(str)
    if not isnull(str) and str<>"" then
	str = trim(str)
	str	= Replace(str,"&","&amp;")	
	str = replace(str, ">", "&gt;")
	str = replace(str, "<", "&lt;")
	str = replace(str, "&lt;", "")
	str = Replace(str, CHR(32), "")
	str = Replace(str, CHR(9), "")
	str = Replace(str, CHR(34), "")
	str = Replace(str, CHR(39), "")
	str = Replace(str, CHR(13), "")
	str = Replace(str, "script", "&#115;cript")
	str = Replace(str, "＆#115;", "&#115;")
	str = Replace(str, "'", "")
	str = Replace(str, "&nbsp;", "")
	str = Replace(str, " ", "")
	str = Replace(str, "%20", "")
    HX_Replace = str
   end if
  end function
  Public function HX_Replace1(str)
    if not isnull(str) and str<>"" then
	str = trim(str)
	str	= Replace(str,"&","&amp;")	
	str = replace(str, ">", "&gt;")
	str = replace(str, "<", "&lt;")
	str = replace(str, "&lt;", "")
	str = Replace(str, CHR(32), "")
	str = Replace(str, CHR(9), "")
	str = Replace(str, CHR(34), "")
	str = Replace(str, CHR(39), "")
	str = Replace(str, CHR(13), "")
	str = Replace(str, "script", "&#115;cript")
	str = Replace(str, "＆#115;", "&#115;")
	str = Replace(str, "'", "")
	str = Replace(str, "&nbsp;", "")
	str = Replace(str, " ", "")
	str = Replace(str, "%20", "")
	str = Replace(str, ".", "")
    HX_Replace = str
   end if
  end function
  
  Public Function PathReplace(Str)
    PathReplace=""
    if Str<>"" then
      Str=replace(Str,"\/","\")
	  Str=replace(Str,"/","\")
	  Str=replace(Str,"//","\")	  
	  Str=replace(Str,"\\","\")
	  Str=replace(Str,"\\","\")
	  PathReplace=Str
	end if
  End Function
  
  Public Function PathFileReplace(Str)
    PathFileReplace=""
    if Str<>"" then
	  Str=replace(Str,"\","\/")
	  PathFileReplace=Str
	end if
  End Function
  
  Public Function FileReplace(Str)
    FileReplace=""
    if Str<>"" then
      Str=replace(Str," ","")
      Str=replace(Str,"　","")
	  Str=replace(Str,",","")
      Str=replace(Str,"，","")
      Str=replace(Str,"、","")
      Str=replace(Str,"。","")
      Str=replace(Str,"~","")
      Str=replace(Str,"!","")
      Str=replace(Str,"@","")
      Str=replace(Str,"#","")
      Str=replace(Str,"$","")
      Str=replace(Str,"%","")
      Str=replace(Str,"^","")
      Str=replace(Str,"&","")
      Str=replace(Str,"*","")
      Str=replace(Str,"(","")
      Str=replace(Str,")","")
      Str=replace(Str,"-","")
      Str=replace(Str,"_","")
      Str=replace(Str,"+","")
      Str=replace(Str,"=","")
      Str=replace(Str,"|","")
      Str=replace(Str,"`","")
	  FileReplace=Str
	end if
  End Function
  
'是否为数
    Public Function HX_IsNum(Str)
	   if Str<>"" and isnumeric(Str) then
	     HX_IsNum=True
	   else
	    HX_IsNum=False
	   end if
	End Function  
'是否为空
    Public Function HX_Isnull(Msg,Str)
	   If str="" or isnull(Str) then
	     HX_GoBack Msg,""
	   End If
	End Function

Function SelectPriv(Str)
	    SelectPriv=False		
		if Str<>"" then
	      StockPriv=split(Str,"|")
	      for ii=0 to ubound(StockPriv)-1
		   if HX_IsNum(StockPriv(ii)) then
            if cint(loginuid)=cint(StockPriv(ii)) then			
			  SelectPriv=True
			  exit Function
			 else
			  SelectPriv=False
			 end if
		    end if	
	       next
	    end if
End Function 
Function SelectPrivUid(Str)
	    SelectPrivUid=1		
		if Str<>"" then
	      StockPriv=split(Str,"|")
	      for ii=0 to ubound(StockPriv)-1
            if cint(loginuid)=cint(StockPriv(ii)) then			
			  SelectPrivUid=cint(StockPriv(ii))
			  exit Function
			else
			  SelectPrivUid=1
			end if
	       next
	    end if
End Function 

	 
Function IDCheck(e)	       
            IDCheck = true 
            arrVerifyCode = Split("1,0,x,9,8,7,6,5,4,3,2", ",") 
            Wi = Split("7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2", ",") 
            Checker = Split("1,9,8,7,6,5,4,3,2,1,1", ",") 
           If Len(e) < 15 Or Len(e) = 16 Or Len(e) = 17 Or Len(e) > 18 Then 
              IDCheck = False 
            Exit Function 
          End If 
           
          If Len(e) = 18 Then 
             Ai = Mid(e, 1, 17) 
          ElseIf Len(e) = 15 Then 
             Ai = e 
             Ai = Left(Ai, 6) & "19" & Mid(Ai, 7, 9) 
          End If 
         If Not IsNumeric(Ai) Then 
              IDCheck = False 
         Exit Function 
      End If 	  
      Dim strYear, strMonth, strDay ,BirthDay
      strYear = CInt(Mid(Ai, 7, 4)) 
      strMonth = CInt(Mid(Ai, 11, 2)) 
      strDay = CInt(Mid(Ai, 13, 2)) 
      BirthDay = Trim(strYear) + "-" + Trim(strMonth) + "-" + Trim(strDay) 
      If IsDate(BirthDay) Then 
         If DateDiff("yyyy",Now,BirthDay)<-140 or cdate(BirthDay)>date() Then 
           IDCheck = False 
           Exit Function 
         End If 
         If strMonth > 12 Or strDay > 31 Then 
            IDCheck = False 
            Exit Function 
         End If 
     Else 
      IDCheck = False 
     Exit Function 
    End If		 
 End Function 
 
'时间格式处理
	Public Function Format_Time(Tvar,sType)
        If Not IsDate(Tvar) Then Format_Time = "" : Exit Function
        Tt			= Tvar
        sYear		= Year(Tt)
        sMonth		= Right("0" & Month(Tt),2)
		sDay		= Right("0" & Day(Tt),2)
		sHour		= Right("0" & Hour(Tt),2)
		sMinute		= Right("0" & Minute(Tt),2)
		sSecond		= Right("0" & Second(Tt),2)
        Select Case sType
        Case 1	'2006-3-13 23:45:45
			Format_Time = sYear & "-" & sMonth & "-" & sDay & " " & sHour & ":" & sMinute & ":" & sSecond
        Case 2	'年-月-日 时:分:秒
			Format_Time = sYear & "年" & sMonth & "月" & sDay & "日 " & sHour & "时" & sMinute & "分" & sSecond & "秒"
        Case 3	'3-13 23:45
			Format_Time = sMonth & "-" & sDay & " " & sHour & ":" & sMinute
        Case 4	'2006-3-13
			Format_Time = sYear & "-" & sMonth & "-" & sDay
        Case 5	'2006年3月13日
			Format_Time = sYear & "年" & sMonth & "月" & sDay & "日"
        Case 6	'3-13
			Format_Time = sMonth & "-" & sDay
        Case 7	'20060313234545
			Format_Time = sYear & sMonth & sDay & sHour & sMinute & sSecond
		Case 8  '20060313
		   	Format_Time = sYear & sMonth & sDay
        Case Else
			Format_Time = Tt
        End Select
    End Function
'显示文字着色	
	Public Function FormatColor(sValue,sColor)
		sColor=Trim(sColor)
		If IsNull(sColor) or sColor="" then
			FormatColor = sValue
		Else
			FormatColor = "<font color="& sColor &" >" & sValue & "</font>"
		End if
	End Function
'显示员工权限
	Public Function MemberPriv(ColPriv)
	  if HX_ISNUM(loginuid) then
	     MemberPriv=0
		 set MemberPrivrs=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_Uid="&loginuid)
		   if MemberPrivrs.recordcount>0 then		     
	         set privrs=WS_S.HX_SetRSD(ColPriv,"HX_MemberPriv"," where WS_MPID="&MemberPrivrs("WS_MPID"))
		     if privrs.recordcount>0 then			  
			   MemberPriv=privrs(0)
     	     end if
		   end if
     	   HX_RSClose MemberPrivrs:HX_RSClose privrs
	  end if	
	End Function	
'检查用户的性别	
	Public Function GetUserSex(strSex)
		  Select Case ChkClng(strSex)
		   Case 0 : GetUserSex="女"
		   Case 1 : GetUserSex="男"
		   Case Else : GetUserSex="保密"
		  End Select		
	End Function
	


'创建目录
    Sub CreateDir(sFolderPath)
		'On Error Resume Next
		tPath=sFolderPath
		err=0
		Set objFSO = Server.CreateObject("scripting.FileSystemObject")
		If objFSO.FolderExists(Server.MapPath(tPath)) Then
			Set objFSO = Nothing
			Exit Sub
		Else
			objFSO.CreateFolder Server.MapPath(tPath)
			Set objFSO = Nothing
		End If
		err=0
	End Sub
'
    Function HX_OutSaleMan(Str)
      if WS_S.HX_ISNUM(Str) then
		  set cors=WS_S.HX_SetRSD("","HX_CustomContact"," where WS_CCID="&Str)
		  if cors.recordcount>0 then
		     set crs=WS_S.HX_SetRSD("","HX_CustomInfo"," where WS_CIID="&cors("WS_CIID"))
		     if crs.recordcount>0 then
		       HX_OutSaleMan="["&crs("WS_CustomInfoName")&"]"&cors("WS_CustomContactName")
			 else
			   HX_OutSaleMan=cors("WS_CustomContactName")
			 end if
		  else
		    HX_OutSaleMan="无"	 
		  end if		  
		  HX_RSClose crs:HX_RSClose cors
	  else
	     HX_OutSaleMan="无"	  
	  end if	  
    End Function
	
Function OutMemberTrueName(UserID,OutNum)
  OutMemberTrueName=""
  UserID=trim(UserID)
  if HX_IsNum(OutNum)=False then OutNum=10000
  if UserID<>"" then
  	 UserIDArr=split(UserID,"|")
	 if ubound(UserIDArr)>0 then
	   if OutNum>ubound(UserIDArr) then OutNum=ubound(UserIDArr)
	   for i=0 to OutNum
	      if HX_IsNum(UserIDArr(i))  then
		  	 Call WS_S.HX_OutUserInfo(UserIDArr(i))
			 if OutName<>"" then
			  OutMemberTrueName=OutMemberTrueName&OutName&"、"
			 end if 
		  end if 
	   next
	   if right(OutMemberTrueName,1)="、" then  OutMemberTrueName=mid(OutMemberTrueName,1,len(OutMemberTrueName)-1)
	   if OutNum<ubound(UserIDArr)-1 then OutMemberTrueName=OutMemberTrueName&".."
	 end if
  end if
End Function
'检查目录是否存在！(sFolderPath,sIsCreate(False,True) 不存在创建)
	Public Function CheckDir(sFolderPath,sIsCreate)
		On Error Resume Next
		tPath=sFolderPath
		CheckDir=False:err=0
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		If objFSO.FolderExists(Server.MapPath(tPath)) Then
			CheckDir=True
			Set objFSO = Nothing
			Exit Function
		Else
			if sIsCreate=True then
				objFSO.CreateFolder Server.MapPath(tPath)
				if err=0 then CheckDir=True
			end if
			Set objFSO = Nothing
		End If
		err=0
	End Function
    Function ShowFolderSize(filespec)
	   call CheckDir(filespec,True)	  
       Set fso = CreateObject("Scripting.FileSystemObject")
	   filespec=server.mappath(filespec)
       Set f = fso.GetFolder(filespec)
	   ShowFolderSize = f.size
	   set f=nothing
	   set fso=nothing
    End Function
'检查目录是否存在！(sFolderPath,sIsCreate(False,True) 存在是否删除)
	Public Function CheckFolder(sFolderPath,sIsCreate)
		'On Error Resume Next
		tPath=sFolderPath		
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		If objFSO.FolderExists(Server.MapPath(tPath)) Then
			if sIsCreate=True then
				objFSO.DeleteFolder Server.MapPath(tPath)
			end if
			Set objFSO = Nothing
		End If
	End Function
'检查文件是否存在！(strFileSource,sIsDelete(False,True)存在是否删除)	
    Public Function CheckFile(strFileSource,sIsDelete)
       Set fso = CreateObject("scripting.FileSystemObject") 
       If fso.FileExists(strFileSource) Then
	     if sIsDelete=True then 
           fso.DeleteFile(strFileSource)
		  end if 
       End If 
      Set fso = Nothing 	
     End Function
'取得文件路径
	Public Function GetClassIDPath(sParentPath, sClassID)
		GetClassIDPath="":tPath=sParentPath
		if Instr(tPath,",")>0 or Instr(tPath,"|")>0 then
			tPath=Split(Replace(tPath,"|",","),",")
			for p=1 to Ubound(tPath)
				GetClassIDPath=GetClassIDPath & "Class" & tPath(p)&"/"
			next
		end if
		GetClassIDPath=GetClassIDPath & "Class" & sClassID&"/"
	End Function
'检查Email地址合法性
	Public Function ChkEmail(email)		
		ChkEmail = true : names = Split(email, "@")
		if UBound(names) <> 1 then ChkEmail = false : Exit Function
		for each name in names
			if Len(name) <= 0 then ChkEmail = false:exit function
			for i = 1 to Len(name)
		   	    c = Lcase(Mid(name, i, 1))
				if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
		    	   ChkEmail = false:Exit Function
		   	    end if
		    next
		    if Left(name, 1) = "." or Right(name, 1) = "." then
   		 	    ChkEmail = false:Exit Function
	 	    end if
		next
		if InStr(names(1), ".") <= 0 then ChkEmail = false:exit function
		i = Len(names(1)) - InStrRev(names(1), ".")
		if i <> 2 and i <> 3 then ChkEmail = false : Exit function
		if InStr(email, "..") > 0 then ChkEmail = false
	End Function
'检查是否已经安装
	Public Function ChkObjInstalled(strClassString)
		On Error Resume Next
		ChkObjInstalled = False
		Err = 0		
		Set xTestObj = Server.CreateObject(strClassString)
		If 0 = Err Then ChkObjInstalled = True
		Set xTestObj = Nothing
		Err = 0
	End Function
'判断提交信息是否来自外部
	Public Function ChkIsOuter()		
		server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
		server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
		If Mid(server_v1,8,len(server_v2))<>server_v2 Then 
		response.Write("<script language=javascript>alert('请不要从外部数据!');window.close();</script>")
        response.end
		end if
	End Function
'判断浏览器是否支持cookies
    Public Function HX_CheckCookies()
	  NetOA=request.cookies(prefix&"Netcst")("NetcstCheck")
	  if NetOA="" or isnull(NetOA) then
	    response.cookies(prefix&"Netcst")("NetcstCheck")="wygk.cn"
		response.cookies(prefix&"Netcst").Expires=date+365
	  end if
	  NetOA=request.cookies(prefix&"Netcst")("NetcstCheck")
	  if NetOA="" or isnull(NetOA) then
	    CheckCookies=False
	  else
	    CheckCookies=True
	  end if	
	  HX_CheckCookies=CheckCookies
    End Function
'选择记录方式	
    Sub HX_SelectCookiesORSession()
	    if HX_CheckCookies=False then HX_GoBack "对不起！您的IE设置不支持cookie！",""	   
		  Response.Cookies(prefix)("LOGINUSERID")=WS_Uid
	      Response.Cookies(prefix)("LOGINUSERNAME")=WS_UserName	
	      Response.Cookies(prefix)("LOGINNAME")=WS_Name	
          Response.Cookies(prefix)("LOGINPASSWORD")=HX_PassWord
		  Response.Cookies(prefix)("LOGINUnitType")=UnitType
		  'Response.Cookies(prefix).Expires=date
    End Sub
'客户等级
    Sub HX_CustomInfoRank(Str)
	  if HX_ISNUM(Str) then
	     ColumnName="":tablename="HX_CustomRank":Orderby=" where WS_CRID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    WS_CustomRankName=Ourtyrs("WS_CustomRankName")
			WS_CustomRankPice=Ourtyrs("WS_CustomRankPice")
		  end if 
	   else
		    WS_CustomRankName=""
			WS_CustomRankPice=1
	   end if
	End Sub
'读取登录后记录
    Sub HX_LoginCheck()
	dim MPID
		  LOGINUid=REQUEST.Cookies(prefix)("LOGINUSERID")
		  LOGINUSERNAME=REQUEST.Cookies(prefix)("LOGINUSERNAME")
		  LOGINNAME=REQUEST.Cookies(prefix)("LOGINNAME")
          LOGINPASSWORD=REQUEST.Cookies(prefix)("LOGINPASSWORD")
          LOGINUnitType=REQUEST.Cookies(prefix)("LOGINUnitType")
	End Sub
	Function HX_OutAttendanceDuty(DutyType)
	   if HX_IsNUM(DutyType) then
	     select case DutyType
		   case 1
		     HX_OutAttendanceDuty="上班"
		   case 2
		     HX_OutAttendanceDuty="下班" 
		 end select	 
	   end if
	End Function
	Function HX_NotifyFlag(NotifyFlag)
	  if HX_ISNUM(NotifyFlag) then
	    select case NotifyFlag
		  case 0:HX_NotifyFlag="普通"
		  case 1:HX_NotifyFlag="重要"
		  case 2:HX_NotifyFlag="加急"
		end select  
	  end if
	End Function
	Function HX_OutWorkFlowType(FlowType)
	   if HX_IsNUM(FlowType) then
	     ColumnName="":tablename="HX_WorkFlowType":Orderby=" where WS_WTID="&FlowType&" "
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutWorkFlowType=Ourtyrs("WS_WorkFlowTypeName")
		  end if      
	   end if
	End Function
    Sub HX_OutEnrolFlag(flag)
	   if HX_IsNUM(flag) then
	     select case flag
		   case 0
		     response.write "领导尚未批示"
		   case 1
		     response.write "领导已批准"
		   case 2
		     response.write "领导未批准" 
		 end select	 
	   end if
	End Sub
	
	'判断是否登录
    Function HX_ISLogin()
	    WS_S.HX_LoginCheck
	    HX_ISLogin=True
	    IF ISNULL(LOGINUSERNAME) OR LOGINUSERNAME="" OR ISNULL(LOGINPASSWORD) OR LOGINPASSWORD="" THEN
           HX_ISLogin=False
        ELSE
           LOGINPASSWORDMD5=MD5(LOGINPASSWORD)
           ORderby=" where WS_UserName='"&LOGINUSERNAME&"' and WS_PassWord='"&LOGINPASSWORDMD5&"'  and WS_State=1": HX_Conn dir
           SET RS=WS_S.HX_SetRSD("","HX_CompanyUser",ORderby)
           IF RS.RECORDCOUNT<=0 THEN
             HX_ISLogin=False
		   Else
		     HX_ISLogin=True	 
           END IF
        HX_RSClose RS  
        END IF
	End Function	
'用户权限
    Sub HX_UserJurisdiction()
	
	End sub		
'注销登录	
	Sub HX_LoginOut()
	    if request("online")<>"wsoas" then
			if HX_ISNUM(request.Cookies(prefix)("LOGINUSERID")) then
			  HX_conn dir
			  WS_S.ExeCtSql("delete from HX_Online where WS_Userid="&request.Cookies(prefix)("LOGINUSERID"))
			end if
		end if
		Response.Cookies(prefix)("LOGINUSERID")=""
       	Response.Cookies(prefix)("LOGINUSERNAME")=""
		Response.Cookies(prefix)("LOGINNAME")=""
        Response.Cookies(prefix)("LOGINPASSWORD")=""
		Response.Cookies(prefix)("WS_Appointment")=""
		Response.Cookies(prefix)("WSOASSkin")=""
		Response.Cookies(prefix)("SystemUser")=""
		Response.Cookies(prefix)("SystemCreatUser")=""
		Response.Cookies(prefix)("SystemEditUser")=""
		Response.Cookies(prefix)("SystemDelUser")=""
		Response.Cookies(prefix)("SystemOrderby")=""
		session.Abandon()	
	End Sub
	
'在线人员HX_OutOnline(type),stype为0时显示人数,1时显示具体人员
    Function HX_OutOnline(stype)
        if HX_isnum(stype) then
		  ColumnName="WS_Userid,WS_Name,WS_Viewip,WS_Lasttime,WS_Staus":tablename="HX_Online":Orderby=" order by WS_Orderby asc"
		  set onliners=HX_SetRSD(ColumnName,tablename,Orderby)
		   select case stype
		      case 0			  
			    HX_OutOnline=onliners.recordcount
			  case 1
		        if onliners.recordcount<=0 then
				   response.write "<table width='85' border='0' cellspacing='1' cellpadding='3'><tr><td align=center>无人在线</td></tr></table>" 
				else 
				   response.write "<table width='85' border='0' cellspacing='1' cellpadding='3'>"
                     do until onliners.eof
					    HX_OutUserInfo(onliners("WS_Userid"))
						 if onliners("WS_Userid")=cint(loginuid)  then
			               myoutname="<font color=red title='自己' onclick=""if (confirm('你想自己给自己发消息吗？')) show('"&onliners("WS_Userid")&"');"">"&onliners("WS_Name")&"</font>"
			             else
			               myoutname=onliners("WS_Name")
			             end if
	                    response.write "<tr><td  class='face' onMouseDown=this.className='face-2' onMouseUp=this.className='face-1' onMouseOver=this.className='face-1' onMouseOut=this.className='face' style='CURSOR:hand;' onDblClick=""show('"&onliners("WS_Userid")&"');"" title=""双击给 ["&Outdepartment&" "&OutAppointment&" "&onliners("WS_Name")&"] 发短消息!!! &#10;目前状态："&HX_OutStaus(onliners("WS_Staus"))&"&#10;用户ＩＰ："&onliners("WS_Viewip")&"&#10;上线时间："&onliners("WS_Lasttime")&"""><img src='../hximages/websms/userface.gif' align='absmiddle' id='WSOA"&onliners("WS_Userid")&"' name='WSOA"&onliners("WS_Userid")&"'> "&myoutname&"</td></tr>"
                     onliners.movenext
                     loop
                   response.write "</table>" 
		        end if
			 case 2
			  ColumnName="WS_Staus":tablename="HX_Online":Orderby=" where WS_Userid="&loginuid
		      set onliners=HX_SetRSD(ColumnName,tablename,Orderby)
			  if onliners.recordcount>0 then  HX_OutOnline=onliners(0)  else  HX_OutOnline=0
		   end select 
		   HX_RSClose(onliners)  
		else
          HX_OutOnline=0
		end if
    End Function
	Function HX_OutStaus(str)
	  if HX_ISNUM(str) then
	    select case str
		  case 0:HX_OutStaus="联机"
		  case 1:HX_OutStaus="忙碌"
		  case 2:HX_OutStaus="离开"
		end select  	  
	  end if
	End Function
'全部人员HX_OutListMember
    Function HX_OutListMember()
	   ColumnName="":tablename="HX_CompanyUser":Orderby=" where WS_leave=0 order by WS_Orderby asc"
       set Ourusers=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
        if Ourusers.recordcount>0 then
	      response.write "<table width='85' border='0' cellspacing='1' cellpadding='3'>"
          do until Ourusers.eof
			HX_OutUserInfo(Ourusers("WS_Uid"))
			if Ourusers("WS_Uid")=cint(loginuid)  then
			  myoutname="<font color=red title='自己'>"&Ourusers("WS_Name")&"</font>"
			else
			  myoutname=Ourusers("WS_Name")
			end if
	        response.write "<tr><td  class='face' onMouseDown=this.className='face-2' onMouseUp=this.className='face-1' onMouseOver=this.className='face-1' onMouseOut=this.className='face' style='CURSOR:hand;' onDblClick=""show('"&Ourusers("WS_Uid")&"');"" title=""双击给 ["&Outdepartment&" "&OutAppointment&" "&Ourusers("WS_Name")&"] 发短消息!!! &#10;注册时间："&Ourusers("WS_addate")&"&#10;上次登录："&Ourusers("WS_logindate")&"""><img src='../hximages/websms/userface.gif' align='absmiddle'> "&myoutname&"</td></tr>"
          Ourusers.movenext
          loop
          response.write "</table>"
        end if
		HX_RSClose(Ourusers)
   End Function
'全部人数
    Function HX_OutListMemberCNT()
	   ColumnName="":tablename="HX_CompanyUser":Orderby=" where WS_leave=0 order by WS_Orderby asc"
       set Ourusers=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
	   HX_OutListMemberCNT=Ourusers.recordcount
	   HX_RSClose(Ourusers)
   End Function
'返回
    Sub HX_Redirect(url)
	   if url<>"" then
	      response.redirect url
		  response.end
	   else
	      response.write "<script>history.go(-1);</script>"
		  response.end
	   end if	
	End Sub	
'向地址中加入 ? 或 & (无用)
	Public Function JoinChar(strUrl)
		if strUrl="" then JoinChar="":Exit Function
		if InStr(strUrl,"?")<len(strUrl) then 
			if InStr(strUrl,"?")>1 then
				if InStr(strUrl,"&")<len(strUrl) then 
					JoinChar=strUrl & "&"
				else
					JoinChar=strUrl
				end if
			else
				JoinChar=strUrl & "?"
			end if
		else
			JoinChar=strUrl
		end if
	End Function
	
	Public Function HX_Reg()
	 Set Rs=WS_S.HX_SetRSD("","HX_Register"," where WS_Registers='"&trim(request("msg"))&"'")
	 if rs.recordcount>0 then
	   call UPDATAColumn("HX_Register","WS_Register","'"&HX_Replace(trim(request("msg")))&"'")	
	   response.write "<script>alert('注册成功！');window.close();</script>"
	   call WS_S.HX_RSClose(rs)
	   response.end
	 else
	   response.write "<script>alert('注册失败！');window.close();</script>"
	   call WS_S.HX_RSClose(rs)
	   response.end
	 end if	    
	End Function
	
	Public Function  HX_CreateR(str)
		Set boxrs=WS_S.HX_SetRSD("top 1 *","HX_Register","")
		if boxrs.recordcount>0 then 
			call UPDATAColumn("HX_Register","WS_Registers","'"&WS_S.Encryptstr(str)&"'")	
		else
			call InToColumn("HX_Register","WS_Registers","'"&WS_S.Encryptstr(str)&"'")	
		end if
		boxrs.close
	End Function
' 判断是否安全字符串,在注册登录等特殊字段中使用
	Public Function IsSafeStr(str)		
		s_BadStr = "'   &<>?%,;:()`~!@#$^*{}[]|+-=" & Chr(34) & Chr(9) & Chr(32)
		n = Len(s_BadStr)
		IsSafeStr = True
		For i = 1 To n
			If Instr(str, Mid(s_BadStr, i, 1)) > 0 Then
				IsSafeStr = False
				Exit Function
			End If
		Next
	End Function
	'****************************************************************
'数据库连接地址函数DBPathAddress(DBPathStr)
'返回数据库连接地址
    Public Function DBPathAddress(DBPathStr)
          DBPath="Provider=SQLOLEDB;Persist Security Info=False;User ID=sa;pwd=123;Initial Catalog=EInstallation;Data Source=."
	   	  DBPathAddress = DBPath
    End Function
	
	
	Sub PopConn(EMailStr)	
	 on error resume next
     set rs=WS_S.HX_SetRSD("","HX_InternetEMail"," where WS_USERID="&LOGINUid&" and WS_InternetEmail='"&EMailStr&"'")
     if rs.recordcount>0 then
       WS_InternetSendName=rs("WS_InternetSendName"):WS_InternetPassword=WS_S.decryptstr(rs("WS_InternetPassword")):WS_InternetPOP3=rs("WS_InternetPOP3"):WS_InternetSMTP=rs("WS_InternetSMTP"):WS_InternetContent=rs("WS_InternetContent")
     else
       HX_GoBack "邮件不存在，请输入正确的邮件!",""
     end if
     if session("poplogin")="" or isnull(session("poplogin")) or not WS_S.ChkObjInstalled(session("poploginrs")) then
        Set pop3 = Server.CreateObject( "JMail.POP3" )
        pop3.Connect WS_InternetSendName,WS_InternetPassword,WS_InternetPOP3
	    set session("poploginrs")=pop3
		session("poplogin")="poplogin"
	 else	
	   set pop3=session("poplogin")
	 end if
	 if err then
	   response.write "<table cellpadding='2' cellspacing='1' border='0' class='border' align=center><tr class='title'><td><strong>错误信息</strong></td></tr><tr class=titletdbg><td valign=top>"&Err.Description
	   response.write "<br><font color=red>如果对有些设置不太了解,请使用<a href='javascript:' onclick=""openwin(280,380,'InternetBoxHelp.asp')"">帮助</a>!　<br><a href='javascript:history.go(-1);'>返 回</a></font></td></tr></table></td></tr></table>"
	   response.End()
	 end if
	End Sub
	
	Function getAttachments()   '获得附件
      Set Attachments=poprs.Attachments
      if Attachments.Count>0 then
        getAttachments="<img src='../HXIMAGES/Message/sign.gif'>"
      end if 
   End Function 
   
   	Function getAttach()	    
	  	Set Attachments = poprs.Attachments
	  	separator = ", "	
	  	For i = 0 To Attachments.Count - 1
			If i = Attachments.Count - 1 Then separator = ""
		 	Set at = Attachments(i)
			FileExt=right(ucase(at.Name),3)
			FileExtStr="GIF,JPG,DOC,TXT,MDB,XLS,ZIP,RAR,MPG,MPEG,RM,MP3,JPEG,BMP,SWF,MOV,WMA,AVI,MID,MIDI"
			if instr(FileExtStr,FileExt)>0 THEN
			  Filepath=server.MapPath(EmailAttachmentsFilePath&at.Name)
              Set fso = CreateObject("scripting.FileSystemObject") 
              If not fso.FileExists(Filepath) Then 
			     at.SaveToFile(Filepath)
		 	     getAttach = getAttach & "<a href=""../../HXINCLUDE/DownFile.ASP?Path="&WS_S.UrlEncoded(trim(EmailAttachmentsFilePath & at.Name ))&""" target='_blank'>" &_
		 						at.Name & "(" & at.Size  & " bytes)" & "</a>" & separator
			  END IF	
			end if  				
	  	Next
	End Function
 

''获取任何表任何字段信息函数
    Public Function HX_SetRSD(ColsStr,TaNameStr,OrderBystr)
	    If ColsStr="" then ColsStr="*"
         set HX_SetRSD=server.CreateObject("adodb.recordset")
         HX_SetRSD.open "select "&ColsStr&" from "&TaNameStr&OrderBystr,conn,1,3		 
     End Function 
	 
	
'写入任何表任何字段信息函数
	Public Function InToColumn(TableName,ColumnName,ColumnValue)
		'On Error Resume Next		
		WS_S.ExeCtSql("insert into ["&TableName&"] ("&ColumnName&") values ("&Replace(Replace(ColumnValue,"True","1"),"False","0")&")")
		If Err Then
			Response.Write "在数据库表"&TableName&"中添加记录失败！原因：<font color=red>" & Err.Description
			Err.Clear
			'Response.end
		End If
	End Function
'单记录添加	
	Public Function UPDATAColumn(TableName,ColumnName,ColumnValue)
		'On Error Resume Next		
		WS_S.ExeCtSql("update ["&TableName&"] set "&ColumnName&"="&ColumnValue)
		If Err Then
			Response.Write "在数据库表"&TableName&"中更新记录失败！原因：<font color=red>" & Err.Description
			Err.Clear
		End If
	End Function
	
'执行SQL语句
	Public Function ExeCtSql(sql)
		'On Error Resume Next	
		set ExeCtSql=server.CreateObject("adodb.recordset")	
		'ExeCtSql.open sql,conn,1,3
		If Err Then
			Response.Write "在执行SQL语句时失败！原因：<font color=red>" & Err.Description
			Err.Clear
		End If
	End Function
	
'显示从职位中显示部门
     Public Function HX_OutAppointment(Appointment)
	    If Appointment<>"" and Isnumeric(Appointment) Then
	    Set OutRs=WS_S.HX_SetRSD("WS_AppointmentName,WS_Did","HX_Appointment"," where WS_Aid="&Appointment)
		  If OutRs.recordcount>0 Then
		    Set Ders=WS_S.HX_SetRSD("WS_DepartmentName","HX_Department"," where WS_Did="&OutRs("WS_Did"))
			If Ders.recordcount>0 Then
			HX_OutAppointment=Ders(0)
			End If
			Call HX_RSClose(Ders)
		    HX_OutAppointment=HX_OutAppointment&OutRs(0)
		  Else
		    HX_OutAppointment="<font color=red>职位删除</font>"
		  End If
		Else
		  HX_OutAppointment="<font color=red>参数错误</font>"
		End If
		  Call HX_RSClose(OutRs)
	 End Function
'显示部门 
    Public Function HX_OutDepartment(Department)
	    If Department<>"" and Isnumeric(Department) Then
		    Set Ders=WS_S.HX_SetRSD("WS_DepartmentName","HX_Department"," where WS_Did="&Department)
			If Ders.recordcount>0 Then
			  HX_OutDepartment=Ders(0)
			End If
			Call HX_RSClose(Ders)
		end if	
	 End Function
'显示用户名、姓名、部门、职位	
	 Sub HX_OutUserInfo(Userid)
	   if Userid<>"" and isnumeric(Userid) then
	     OutUserName="":OutName="":OutPhone="":OutAddress="":OutAppointmentID="":OutdepartmentID=""
	     Set Outrs=WS_S.HX_SetRSD("*","HX_CompanyUser"," where WS_Uid="&Userid)
		 if Outrs.recordcount>0 then
		   OutUserName=Outrs("WS_UserName") '用户名
		   OutName=Outrs("WS_Name") '姓名
		   'OutPhone=Outrs("WS_Phone")'电话号码
		   'OutAddress=Outrs("WS_Address")'住址
		   'OutAppointmentID=Outrs("WS_Appointment")'职位
		   'OutdepartmentID=Outrs("WS_department")'部门
		   'if OutAppointmentID>0 then
		     'OutAppointment=WS_S.ExeCtSql("select * from HX_Appointment where WS_Aid="&OutAppointmentID)("WS_AppointmentName")
		   'end if
		   'if OutdepartmentID>0 then
		     'Outdepartment=WS_S.ExeCtSql("select * from HX_Department where WS_Did="&OutdepartmentID)("WS_DepartmentName")
		   'end if
		     Call HX_RSClose(OutRs)
		 end if
	   end if
	 End Sub
'显示真实姓名
	 Function HX_OutUserName(UserName) 
	  if UserName<>"" then
	     Set Outrs=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_UserName='"&UserName&"'")
         if Outrs.recordcount>0 then
		   HX_OutUserName=Outrs("WS_Name")
		 end if	  
	  end if	 
	 End Function
'显示id	 
	 Function HX_OutUserID(UserName) 
	  HX_OutUserID=1
	  if UserName<>"" then
	     Set Outrs=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_UserName='"&UserName&"'")
         if Outrs.recordcount>0 then
		   HX_OutUserID=Outrs("WS_Uid")
		 end if	
		 Outrs.close  
	  end if	 
	 End Function
'显示客户
  Sub HX_OutCustonInfo(Cid)
    if WS_S.HX_IsNUM(Cid) then
     set crs=WS_S.HX_SetRSD(ColumnName,"HX_CustomInfo"," where WS_CIID="&Cid)
      if crs.recordcount>0 then
        response.write crs("WS_CustomInfoName")
	  else
	    response.write "不属于客户"	
      end if
	else
	  response.write "不属于客户"	 
	end if 
  End Sub
'显示供应商
  Sub HX_OutSaleShop(SSID)
    if WS_S.HX_IsNUM(SSID) then
     set crs=WS_S.HX_SetRSD(ColumnName,"HX_SaleShop"," where WS_SSID="&SSID)
      if crs.recordcount>0 then
        response.write crs("WS_SaleShopName")
	  else
	    response.write "内部产品"	
      end if
	else
	  response.write "内部产品"	 
	end if 
	HX_RSClose crs
  End Sub
'显示产品名称
  Sub HX_OutProduct(PTID)
    if WS_S.HX_IsNUM(PTID) then
     set crs=WS_S.HX_SetRSD(ColumnName,"HX_Product"," where WS_PTID="&PTID)
      if crs.recordcount>0 then
        response.write crs("WS_ProductName")
	  else
	    response.write "产品空缺"	
      end if
	else
	  response.write "产品空缺"	 
	end if
	HX_RSClose crs 
  End Sub
'显示日程类别
  Function OutSchEduleSort(SchEduleID)
    if WS_S.HX_IsNum(SchEduleID) then
      set OutRs=WS_S.HX_SetRSD(ColumnName,"HX_SchEduleSort"," where WS_SEID="&SchEduleID)
	  if OutRs.recordcount>0 then
	    OutSchEduleSort=OutRs("WS_SchEduleSortName")
	  end if
	  Call HX_RSClose(OutRs)
	end if
  End Function	 
	 
'写日志	
	Public Sub SaveAdminLog(WS_UserName,WS_Appointment,RequestStr)
		'On Error Resume Next
		Path_Info		= Request.ServerVariables("PATH_INFO")
		Tmpstr			= Split(Path_Info,"/")
		ScriptName		= Lcase(Tmpstr(UBound(Tmpstr)))
			'SQL="INSERT INTO HX_ManageLog (WS_UserName,WS_Appointment,WS_UserIP,WS_ScriptName,WS_LogContent) values ('"&WS_UserName&"',"&WS_Appointment&",'"&Request.ServerVariables("REMOTE_ADDR")&"','"&ScriptName&"','"&RequestStr&"')"
			'WS_S.ExeCtSql(SQL)
		HX_ClosDB()		
	End Sub
'关闭表对象	     
	 Public Function HX_RSClose(RecordSetStr)
	   on error resume next
	   if isobject(RecordSetStr) then
         RecordSetStr.Close:Set RecordSetStr = Nothing
	   end if
     End Function
	'Server.URLEncode解码函数
	Public Function URLDecode(enStr)
		deStr=""
		for i=1 to len(enStr)
			c=Mid(enStr,i,1)
			if c="%" then
				v=eval("&h"+Mid(enStr,i+1,2))
				if v<128 then
					deStr=deStr&chr(v)
					i=i+2
				else
					if IsValidHex(mid(enstr,i,3)) then
						if IsValidHex(mid(enstr,i+3,3)) then
						v=eval("&h"+Mid(enStr,i+1,2)+Mid(enStr,i+4,2))
						deStr=deStr&chr(v)
						i=i+5
						else
						v=eval("&h"+Mid(enStr,i+1,2)+cstr(hex(asc(Mid(enStr,i+3,1)))))
						deStr=deStr&chr(v)
						i=i+3 
						end if
					else
						destr=destr&c
					end if
				end if
			else
				if c="+" then
					deStr=deStr&" "
				else
					deStr=deStr&c
				end if
			end if
		next
		URLDecode=deStr
	End Function
   

	'显示"上一页 下一页":链接地址,总数,页数,是否显示总数,是否用下拉列表跳转,单位
	Public Function PageControl(iCount,pagecount,page,table_style,font_style,colspan)
	'生成上一页下一页链接
    dim temp1
	temp1=""
    action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")

    query = Split(Request.ServerVariables("QUERY_STRING"), "&")
    For Each x In query
        a = Split(x, "=")
        If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            temp = temp & a(0) & "=" & a(1) & "&"
		    'temp1=temp1 &"<input type='hidden' name='"&a(0)&"' value='"&a(1)&"'>"
        End If
    Next
   if colspan=0 then
   Response.Write("<table " & Table_style & ">" & vbCrLf ) 
   end if      
    Response.Write("<form name=formgo action="&action & "?" & temp &" ><TR><TD align=right bgcolor=ffffff colspan="&colspan&" height=25>" & vbCrLf )
    Response.Write(font_style & vbCrLf )            
    if page<=1 then
        Response.Write ("首页 " & vbCrLf)        
        Response.Write ("上页 " & vbCrLf)
    else        
        Response.Write("<A HREF=" & action & "?" & temp & "Page=1>首页</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">上页</A> " & vbCrLf)
    end if

    if page>=pagecount then
        Response.Write ("下页 " & vbCrLf)
        Response.Write ("尾页 " & vbCrLf)            
    else
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">下页</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">尾页</A> " & vbCrLf)            
    end if

    Response.Write(" 页次：" & page & "/" & pageCount & "页" &  vbCrLf)
    Response.Write(" 共有" & iCount & "条 <input name='page' type='text' autocomplete=off size=3 style='ime-mode:disabled' /> "&temp1&"<input name='go' type='submit' class='button'  /> " &  vbCrLf)
    Response.Write("</TD>" & vbCrLf )                
    Response.Write("</TR></form>" & vbCrLf )        
    if colspan=0 then
	Response.Write("</table>" & vbCrLf )
	end if        
	End Function
	
	'显示"上一页 下一页":链接地址,总数,页数,是否显示总数,是否用下拉列表跳转,单位
	Public Function PageControl1(iCount,pagecount,page,table_style,font_style,colspan)
	'生成上一页下一页链接
    dim temp1
	temp1=""
    action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")

    query = Split(Request.ServerVariables("QUERY_STRING"), "&")
    For Each x In query
        a = Split(x, "=")
        If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            temp = temp & a(0) & "=" & a(1) & "&"
		    'temp1=temp1 &"<input type='hidden' name='"&a(0)&"' value='"&a(1)&"'>"
        End If
    Next
	temp1=left(temp,len(temp)-1)
   if colspan=0 then
   Response.Write("<table " & Table_style & ">" & vbCrLf ) 
   end if      
    Response.Write("<form name=formgo action="&action & "?" & temp1 &" method=""post""><TR><TD align=right bgcolor=ffffff colspan="&colspan&" height=25>" & vbCrLf )
    Response.Write(font_style & vbCrLf )            
    if page<=1 then
        Response.Write ("首页 " & vbCrLf)        
        Response.Write ("上页 " & vbCrLf)
    else        
        Response.Write("<A HREF=" & action & "?" & temp & "Page=1>首页</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">上页</A> " & vbCrLf)
    end if

    if page>=pagecount then
        Response.Write ("下页 " & vbCrLf)
        Response.Write ("尾页 " & vbCrLf)            
    else
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">下页</A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">尾页</A> " & vbCrLf)            
    end if

    Response.Write(" 页次：" & page & "/" & pageCount & "页" &  vbCrLf)
    Response.Write(" 共有" & iCount & "条 <input name='page' type='text' autocomplete=off size=3 style='ime-mode:disabled' /> <input name='go' type='submit' class='button' value='搜索'/> " &  vbCrLf)
    Response.Write("</TD>" & vbCrLf )                
    Response.Write("</TR></form>" & vbCrLf )        
    if colspan=0 then
	Response.Write("</table>" & vbCrLf )
	end if        
	End Function


	Public Function ChecKIPlock(ip)     
 	   num_ip=IpEncode(ip)	
	   If DataBaseType=1 Then
          set rs=WS_S.HX_SetRSD("WS_LOID","HX_lockip"," where WS_Startip<="&num_ip&" and WS_Endip>=" & num_ip)
	   else	    
          set rs=WS_S.HX_SetRSD("WS_LOID","HX_lockip"," where int(WS_Startip)<="&num_ip&" and int(WS_Endip)>=" & num_ip)
	   end if
	    if rs.recordcount>0 then
		  Call WS_S.HX_RSClose(rs)	    
	      Call HX_GoBack("你所在网段已被封锁。可能该网段有人捣乱，请联系管理员！","")
	    end if		
        Call WS_S.HX_RSClose(rs)
    end function
	function IpDecode(byval uip)
	 if trim(uip)="" or not isnumeric(uip) then
		IpDecode=0
	  else
		uip=Cdbl(uip)
		dim ary_ip(3)
        ary_ip(0)=fix(uip/16777216)
        ary_ip(1)=fix((uip-ary_ip(0)*16777216)/65536)
        ary_ip(2)=fix((uip-fix(uip/65536)*65536)/256)
        uip=uip-fix(uip/65536)*65536
        ary_ip(3)=fix(uip-fix(uip/256)*256)
        IpDecode=join(ary_ip,".")
	  end if
    end function

   function IpEncode(byval uip)
	 if isnull(uip) or uip="" then
		IpEncode=0
	  else
		dim ary_ip,n
		ary_ip=split(trim(uip),".")
		n=ubound(ary_ip)
		if n=3 then
			IpEncode=ary_ip(0)*256*256*256+ary_ip(1)*65536+ary_ip(2)*256+ary_ip(3)
		else
			IpEncode=0
		end if
	 end if
   end function
	'取得带端口的URL
	Public Function Get_ScriptNameUrl()
		If request.servervariables("SERVER_PORT")="80" Then
			Get_ScriptNameUrl="http://" & request.servervariables("server_name")&replace(lcase(request.servervariables("script_name")),ScriptName,"")
		Else
			Get_ScriptNameUrl="http://" & request.servervariables("server_name")&":"&request.servervariables("SERVER_PORT")&replace(lcase(request.servervariables("script_name")),ScriptName,"")
		End If
	End Function
	' 转为根路径格式
	Public Function RelativePath2RootPath(url)
		Dim sTempUrl
		sTempUrl = url
		If Left(sTempUrl, 1) = "/" Then
			RelativePath2RootPath = sTempUrl
			Exit Function
		End If
		Dim sNowPath
		sNowPath = Request.ServerVariables("SCRIPT_NAME")
		sNowPath = Left(sNowPath, InstrRev(sNowPath, "/") - 1)
		Do While Left(sTempUrl, 3) = "../"
			sTempUrl = Mid(sTempUrl, 4)
			sNowPath = Left(sNowPath, InstrRev(sNowPath, "/") - 1)
		Loop
		RelativePath2RootPath = sNowPath & "/" & sTempUrl
	End Function
	' 根路径转为带域名全路径格式
	Public Function RootPath2DomainPath(url)
		Dim sHost, sPort
		sHost = Split(Request.ServerVariables("SERVER_PROTOCOL"), "/")(0) & "://" & Request.ServerVariables("HTTP_HOST")
		sPort = Request.ServerVariables("SERVER_PORT")
		If sPort <> "80" Then sHost = sHost & ":" & sPort
		RootPath2DomainPath = sHost & url
	End Function

	Public Function GetSize(size,unit)
		if isEmpty(size) or Not Isnumeric(size) then Exit Function
		size=CheckUnit(size,unit)
 		if size>1024 then
 			size=(size/1024)
 			getsize=formatnumber(size,2) & " MB"
		else
		    if size>0 then
			getsize=formatnumber(size,2) & " KB"	
			else
			getsize="0.00 KB"
			end if		
			Exit Function
 		end if
 		if size>1024 then
 			size=(size/1024)
 			getsize=formatnumber(size,2) & " GB"
 		end if
	End Function
	Public Function CheckUnit(size,unit)
		Select Case Lcase(Unit)
		Case "b"
			CheckUnit = formatnumber(size/1024,2)
		Case "k"
			CheckUnit = size
		Case "m"
			CheckUnit = (size*1024)
		Case "g"
			CheckUnit = (size*1024*1024)
		Case Else
			CheckUnit = size
		End Select
	End Function
	Public Sub DelFiles(strFiles)
		if strFiles="" then Exit Sub
		dim fso,arrFiles,i
		On Error Resume Next
		Err=0
		Set fso = CreateObject("scripting.FileSystemObject")
			if fso.FileExists(server.MapPath(strFiles)) then
				fso.DeleteFile(server.MapPath(strFiles))
				if 0=Err then
					Response.write "<br>清除文件（"&strFiles&"）成功！"
				else
					Response.write "<br>清除文件（"&strFiles&"）失败！"
				end if
			end if
		Set fso = Nothing
		Err=0
	End Sub
function DownloadOtherFile(strFile)
    strFile=PathReplace(UrlDecoded(strFile))
	'response.Write strFile
	'response.end
	strFilename = server.MapPath(strFile)
	Response.Buffer = True
	Response.Clear	
	Set s = Server.CreateObject("ADODB.Stream")
	s.Open
	s.Type = 1	
	on error resume next
	dim fso	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	if not fso.FileExists(strFilename) then
		response.write "<script>alert('文件已不存在！');history.go(-1);</script>"
		response.end
	end if	
	
	Set f = fso.GetFile(strFilename)
	intFilelength = f.size
		
	s.LoadFromFile(strFilename)
	if err then
		response.write "<script>alert('"&err.Description&"');history.go(-1);</script>"
		response.end
	end if
	
	Response.AddHeader "Content-Disposition", "attachment; filename=" & f.name
	Response.AddHeader "Content-Length", intFilelength
	Response.CharSet = "UTF-8"
	Response.ContentType = "application/octet-stream"
	
	Response.BinaryWrite s.Read
	Response.Flush
	s.Close
	Set s = Nothing

End Function 
'网络硬盘
function downloadFile(strFile)
    strFile=PathReplace(NetDiskPath&UrlDecoded(strFile))
	'response.Write strFile
	'response.end
	strFilename = server.MapPath(strFile)
	Response.Buffer = True
	Response.Clear	
	Set s = Server.CreateObject("ADODB.Stream")
	s.Open
	s.Type = 1	
	on error resume next
	dim fso	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	if not fso.FileExists(strFilename) then
		response.write "<script>alert('文件已不存在！请与所属用户联系！');history.go(-1);</script>"
		response.end
	end if	
	
	Set f = fso.GetFile(strFilename)
	intFilelength = f.size
		
	s.LoadFromFile(strFilename)
	if err then
		response.write "<script>alert('"&err.Description&"');history.go(-1);</script>"
		response.end
	end if
	
	Response.AddHeader "Content-Disposition", "attachment; filename=" & f.name
	Response.AddHeader "Content-Length", intFilelength
	Response.CharSet = "UTF-8"
	Response.ContentType = "application/octet-stream"
	
	Response.BinaryWrite s.Read
	Response.Flush
	s.Close
	Set s = Nothing

End Function 

	Public Function GetDownLoadFileExt(strFile)
		GetDownLoadFileExt="rar"
		Dim strExt
		if Isnull(strFile) then Exit Function
		if Instr(strFile,".")<=0 then Exit Function
		strExt=Split(strFile,".")
		GetDownLoadFileExt=strExt(Ubound(strExt))
	End Function
    Public Function ReplaceBadChar(strChar)
		strChar=replace(replace(strChar," ",""),"'","")
		strChar=replace(replace(strChar,".",""),"<","")
		strChar=replace(replace(strChar,")",""),"(","")
		strChar=replace(replace(strChar,"?",""),"*","")
		strChar=replace(replace(strChar,"/",""),"\","")
		ReplaceBadChar=replace(strChar,Chr(0),"")
	End Function
	Public Function HTMLEncode(fString)
		If Not IsNull(fString) then
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")
		fString = replace(fString, "&", "&amp;")
		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(13), "")
		fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
		fString = Replace(fString, CHR(10), "<BR> ")
		HTMLEncode = fString
		End If
	End Function

	Public Function HTMLCode(fString)
		If Not IsNull(fString) then
		fString = replace(fString, "&gt;", ">")
		fString = replace(fString, "&lt;", "<")
		fString = Replace(fString,  "&nbsp;"," ")
		fString = Replace(fString, "&quot;", CHR(34))
		fString = Replace(fString, "&#39;", CHR(39))
		fString = Replace(fString, "</P><P> ",CHR(10) & CHR(10))
		fString = Replace(fString, "<BR> ", CHR(10))
		HTMLCode = fString
		End If
	End Function

	Public Function NoHtml(str)
		if not isnull(str) then
		dim re
		Set re=new RegExp
		re.IgnoreCase =true
		re.Global=True
		re.Pattern="(\<.[^\<]*\>)"
		str=re.replace(str," ")
		re.Pattern="(\<\/[^\<]*\>)"
		str=re.replace(str," ")
		NoHtml=str
		Set re=Nothing
		End if
	End Function
	
	Public Function HX_WSOASSMSSEND()
       send_no=trim(request("send_no"))
	   if send_no<>"" then send_no=replace(mid(send_no,1,len(send_no)-1),",",";")
	   URL = "http://web.mobset.com/SDK/Sms_Send.asp?CorpID="&SmsID&"&LoginName="&SmsUSE&"&send_no="&send_no&"&passwd="&WS_S.decryptstr(SMSPWD)&"&Timer="&request("Timer")&"&msg="&Server.URLEncode(request("msg"))
	    set objHttpRequest = CreateObject("MSXML2.ServerXMLHTTP" )
        if objHttpRequest is Nothing Then
          response.write "创建Msxl2.ServerXMLHTTP错误！"
          response.end
       end if
      objHttpRequest.open "GET",URL,False
      objHttpRequest.send()
      if objHttpRequest.status <> 200  then
       response.write "打开请求错误！"
       response.end
	  end if
      retMsg = objHttpRequest.responseText
      Ret   = left(retMsg,InStr(retMsg,",")-1)
      iRet  = Cint(Ret)
	  SendTimer=trim(request("Timer"))
	  if SendTimer="" then  SendTimer=now
	  response.Write "<table cellpadding='2' cellspacing='1' border='0' class='border' align=center><tr class='title'><td>手机短信发送</td></tr><tr class='titletdbg'><td>"
      if iRet>0  then  '判断是否发送成功
        SendID = right(retMsg,len(retMsg)-InStr(retMsg,","))
        response.write "发送短信成功,SmsID:"&SendID
		If DataBaseType=1 Then
		  WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&send_no&"','"&SendTimer&"','发送成功','"&request("msg")&"','SmsID:"&SendID&"',"&loginuid&")")
		else
		  WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&send_no&"',#"&SendTimer&"#,'发送成功','"&request("msg")&"','SmsID:"&SendID&"',"&loginuid&")")
		end if
      else
		select case iRet
		 case -1 msg="输入参数不完整！"
		 case -2 msg="非法来源IP地址或帐号密码有误！"
		 case -3 msg="目标号码有误！"
		 case -4 msg="企业帐号余额不足，后跟已发送的数量及SmsID！"
		 case -5 msg="用户帐号余额不足，后跟已发送的数量及SmsID！"
		 case -6 msg="输入参数不完整！"
		 case -7 msg="连接数据库失败！"
		 case -8 msg="企业帐号已被禁用！"
		 case -9 msg="短信内容含有过滤关键字！"
		end select  
        response.write "发送短信失败，"&msg 
         If DataBaseType=1 Then
		   WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&send_no&"','"&SendTimer&"','发送失败','"&request("msg")&"','"&msg&"',"&loginuid&")")
          else
		    WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&send_no&"',#"&SendTimer&"#,'发送失败','"&request("msg")&"','"&msg&"',"&loginuid&")")
		  end if
	  end if
	  response.write "</td></tr><tr class='titletdbg'><td><input name='submit' type='button' class='button' value=' 返 回 ' onclick='history.go(-1);'></td></tr></table>"
	  response.end
      Set objHttpRequest = Nothing
	End Function

	'sContent（要转换的数据字符串）
	'sFilters（要过滤掉的格式集，用"|"分隔多个）
	Public Function DeCode(sContent, sFilters)
		Dim a_Filter, i, s_Result, s_Filters
		Decode = sContent
		If IsNull(sContent) or IsNull(sFilters) Then Exit Function
		If sContent = "" or sFilters = "" Then Exit Function
		s_Result  = sContent
		s_Filters = sFilters
		If InStr(s_Filters,"|")>0 then
			a_Filter = Split(s_Filters, "|")
			For i = 0 To UBound(a_Filter)
				s_Result = DecodeFilter(s_Result, a_Filter(i))
			Next
		Else
			s_Result = DecodeFilter(s_Result, s_Filters)
		End If
		DeCode = s_Result
	End Function
	
	Public Function WSOASCOM()		  
	    if WSOASSystemR=True then response.Write("<SCRIPT>parent.WSOAS.innerHTML='"&WSOASCOMST&"';</SCRIPT>") else response.Write("<SCRIPT>parent.WSOAS.innerHTML='';</SCRIPT>") 
        call WS_S.HX_RSClose(rs)
	End Function
	
	Function WSOASSystemR()
	   WSOASSystemR=False
	   Set WSOASSystemRs=WS_S.HX_SetRSD("","HX_Register"," where "&chr(87)&chr(83)&chr(95)&chr(82)&chr(101)&chr(103)&chr(105)&chr(115)&chr(116)&chr(101)&chr(114)&chr(115)&"="&chr(87)&chr(83)&chr(95)&chr(82)&chr(101)&chr(103)&chr(105)&chr(115)&chr(116)&chr(101)&chr(114))
	   if WSOASSystemRs.recordcount<=0 then
	     WSOASSystemR=False
	   else
	     WSOASMysn=WSOASSystemRs(1)
		 WSOASSystemR=True
	   end if
	   HX_RSClose WSOASSystemRs	
	End Function
	
	Public Function DecodeFilter(sContent, sFilter)
		Dim regEx
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global	 = True
		Select Case Ucase(sFilter)
		Case "SCRIPT"'去除所有客户端脚本javascipt,vbscript,jscript,js,vbs,event,...
			regEx.Pattern	= "</?script[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "(javascript|jscript|vbscript|vbs):"
			sContent		= regEx.replace(sContent,"$1：")
			regEx.Pattern	= "on(mouse|exit|error|click|key)"
			sContent		= regEx.replace(sContent,"<I>on$1</I>")
		Case "OBJECT"'去除对象<object><param><embed></object>
			regEx.Pattern	= "</?object[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?param[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?embed[^>]*>"
			sContent		= regEx.replace(sContent,"")
		Case "TABLE"'去除表格<table><tr><td><th>
			regEx.Pattern	= "</?table[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?tr[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?th[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?td[^>]*>"
			sContent		= regEx.replace(sContent,"")
		Case "CLASS"'去除样式类class=""
			regEx.Pattern	= "(<[^>]+) class=[^ |^>]*([^>]*>)"
			sContent		= regEx.replace(sContent,"$1 $2")
		Case "XML"'去除XML<?xml>
			regEx.Pattern	= "<\\?xml[^>]*>"
			sContent		= regEx.replace(sContent,"")
			regEx.Pattern	= "</?span[^>]*>"
			sContent		= regEx.replace(sContent,"")
		Case "NAMESPACE"'去除命名空间<o:p></o:p>
			regEx.Pattern	= "<\/?[a-z]+:[^>]*>"
			sContent		= regEx.replace(sContent,"")
		Case Else
			regEx.Pattern	= "</?" & s_Filter & "[^>]*>"
			sContent		= regEx.replace(sContent,"")
		End Select
		DecodeFilter = sContent
		Set regEx=nothing
	End Function

	Public Function UBBCode(strContent)
	on error resume next
	strContent = HTMLEncode(strContent)
	dim objRegExp
	Set objRegExp=new RegExp
	objRegExp.IgnoreCase =true
	objRegExp.Global=True

	objRegExp.Pattern="(\[URL\])(.*)(\[\/URL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")

	objRegExp.Pattern="(\[URL=(.*)\])(.*)(\[\/URL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")

	objRegExp.Pattern="(\[EMAIL\])(.*)(\[\/EMAIL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""mailto:$2"">$2</A>")
	objRegExp.Pattern="(\[EMAIL=(.*)\])(.*)(\[\/EMAIL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""mailto:$2"" TARGET=_blank>$3</A>")

	objRegExp.Pattern="(\[FLASH\])(.*)(\[\/FLASH\])"
	strContent= objRegExp.Replace(strContent,"<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")

	objRegExp.Pattern="(\[IMG\])(.*)(\[\/IMG\])"
	strContent=objRegExp.Replace(strContent,"<IMG SRC=""$2"" border=0>")

        objRegExp.Pattern="(\[HTML\])(.*)(\[\/HTML\])"
	strContent=objRegExp.Replace(strContent,"<SPAN><IMG src=pic/code.gif align=absBottom> HTML 代码片段如下:<BR><TEXTAREA style=""WIDTH: 94%; BACKGROUND-COLOR: #f7f7f7"" name=textfield rows=10>$2</TEXTAREA><BR><INPUT onclick=runEx() type=button value=运行此代码 name=Button> [Ctrl+A 全部选择   提示:你可先修改部分代码，再按运行]</SPAN><BR>")

	objRegExp.Pattern="(\[color=(.*)\])(.*)(\[\/color\])"
	strContent=objRegExp.Replace(strContent,"<font color=$2>$3</font>")
	objRegExp.Pattern="(\[face=(.*)\])(.*)(\[\/face\])"
	strContent=objRegExp.Replace(strContent,"<font face=$2>$3</font>")
	objRegExp.Pattern="(\[align=(.*)\])(.*)(\[\/align\])"
	strContent=objRegExp.Replace(strContent,"<div align=$2>$3</div>")

	objRegExp.Pattern="(\[QUOTE\])(.*)(\[\/QUOTE\])"
	strContent=objRegExp.Replace(strContent,"<BLOCKQUOTE><font size=1 face=""Verdana, Arial"">quote:</font><HR>$2<HR></BLOCKQUOTE>")
	objRegExp.Pattern="(\[fly\])(.*)(\[\/fly\])"
	strContent=objRegExp.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$2</marquee>")
	objRegExp.Pattern="(\[move\])(.*)(\[\/move\])"
	strContent=objRegExp.Replace(strContent,"<MARQUEE scrollamount=3>$2</marquee>")
	objRegExp.Pattern="(\[glow=(.*),(.*),(.*)\])(.*)(\[\/glow\])"
	strContent=objRegExp.Replace(strContent,"<table width=$2 style=""filter:glow(color=$3, strength=$4)"">$5</table>")
	objRegExp.Pattern="(\[SHADOW=(.*),(.*),(.*)\])(.*)(\[\/SHADOW\])"
	strContent=objRegExp.Replace(strContent,"<table width=$2 style=""filter:shadow(color=$3, direction=$4)"">$5</table>")
    
	objRegExp.Pattern="(\[i\])(.*)(\[\/i\])"
	strContent=objRegExp.Replace(strContent,"<i>$2</i>")
	objRegExp.Pattern="(\[u\])(.*)(\[\/u\])"
	strContent=objRegExp.Replace(strContent,"<u>$2</u>")
	objRegExp.Pattern="(\[b\])(.*)(\[\/b\])"
	strContent=objRegExp.Replace(strContent,"<b>$2</b>")
	objRegExp.Pattern="(\[fly\])(.*)(\[\/fly\])"
	strContent=objRegExp.Replace(strContent,"<marquee>$2</marquee>")

	objRegExp.Pattern="(\[size=1\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=1>$2</font>")
	objRegExp.Pattern="(\[size=2\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=2>$2</font>")
	objRegExp.Pattern="(\[size=3\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=3>$2</font>")
	objRegExp.Pattern="(\[size=4\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=4>$2</font>")


	strContent = doCode(strContent, "[list]", "[/list]", "<ul>", "</ul>")
	strContent = doCode(strContent, "[list=1]", "[/list]", "<ol type=1>", "</ol id=1>")
	strContent = doCode(strContent, "[list=a]", "[/list]", "<ol type=a>", "</ol id=a>")
	strContent = doCode(strContent, "[*]", "[/*]", "<li>", "</li>")
	strContent = doCode(strContent, "[code]", "[/code]", "<pre id=code><font size=1 face=""Verdana, Arial"" id=code>", "</font id=code></pre id=code>")

	set objRegExp=Nothing
	UBBCode=strContent
	End Function

	Public Function ChkClng(ByVal str)
		If str<>"" and IsNumeric(str) Then
			ChkClng = CLng(str)
		Else
			ChkClng = 0
		End If
	End Function

	Public Function ChkCBool(ByVal str)
		If Not IsNull(str) Then
			ChkCBool = CBool(str)
		Else
			ChkCBool = False
		End If
	End Function

	Public Function ChkCDbl(ByVal str)
		If str<>"" and IsNumeric(str) Then
			ChkCDbl = CDbl(str)
		Else
			ChkCDbl = 0
		End If
	End Function

	Public Function ChkNull(ByVal str)
		If IsNull(str) Then
			ChkNull = ""
		Else
			ChkNull = str
		End If
	End Function
		
'检查文件后缀，如果与预定的匹配即返回TRUE
Function CheckExt(FileExt)
	If DimFileExt = "*" Then CheckExt = True
	Ext = Split(DimFileExt,",")
	For i = 0 To Ubound(Ext)
		If Lcase(FileExt) = Ext(i) Then 
			CheckExt = True
			Exit Function
		End If
	Next
End Function
'遍历处理path及其子目录所有文件
Sub HX_ShowAllFile(Path)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if not fso.FolderExists(path) then exit sub
	Set f = FSO.GetFolder(Path)
	Set fc2 = f.files
	For Each myfile in fc2
		If CheckExt(FSO.GetExtensionName(path&"\"&myfile.name)) Then 
		 SumFiles = SumFiles + 1
		 if HX_ScanFile(Path&"\"&myfile.name) then SumShell=SumShell+1
		end if 
	Next
	Set fc = f.SubFolders
	For Each f1 in fc
		HX_ShowAllFile path&"\"&f1.name
		SumFolders = SumFolders + 1
    Next
	Set FSO = Nothing
End Sub
'检测文件
Function HX_ScanFile(FilePath)
  HX_ScanFile=False
  dim FSOs,ofile,filetxt,DoMyBest,regEx,Matches,Match
	Set FSOs = CreateObject("Scripting.FileSystemObject")
	on error resume next
	set ofile = fsos.OpenTextFile(FilePath)
	filetxt = Lcase(ofile.readall())
	If err Then Exit Function
	if len(filetxt)>0 then
	'特征码检查
	   'Check "WScr"&DoMyBest&"ipt.Shell"
	    If instr( filetxt, Lcase("WScr"&DoMyBest&"ipt.Shell") ) or Instr( filetxt, Lcase("clsid:72C24DD5-D70A"&DoMyBest&"-438B-8A42-98424B88AFB8") ) then HX_ScanFile=True
	   'Check "She"&DoMyBest&"ll.Application"
	    If instr( filetxt, Lcase("She"&DoMyBest&"ll.Application") ) or Instr( filetxt, Lcase("clsid:13709620-C27"&DoMyBest&"9-11CE-A49E-444553540000") ) then HX_ScanFile=True
		if instr( filetxt,"输入马的内容")>0 or instr(filetxt,"保存文件的<font color=red>绝对路径(包括文件名:如D:\web\x.asp):</font>")>0 then ScanFile=True
		'Check .Encode
		 Set regEx = New RegExp
		 regEx.IgnoreCase = True
		 regEx.Global = True
		 regEx.Pattern = "@\s*LANGUAGE\s*=\s*[""]?\s*(vbscript|jscript|javascript).encode\b"
		 If regEx.Test(filetxt) Then HX_ScanFile=True
	    'Check my ASP backdoor :(
		 regEx.Pattern = "\bEv"&"al\b"
		 If regEx.Test(filetxt) Then HX_ScanFile=True
		'Check exe&cute backdoor
		 'regEx.Pattern = "[^.]\bExe"&"cute\b"
		 'If regEx.Test(filetxt) Then HX_ScanFile=True
		 'Set regEx = Nothing
		'Check include file
		 Set regEx = New RegExp
		 regEx.IgnoreCase = True
		 regEx.Global = True
		 regEx.Pattern = "<!--\s*#include\s*file\s*=\s*"".*"""
		 Set Matches = regEx.Execute(filetxt)
		 For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call HX_ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		 Next
		Set Matches = Nothing
		Set regEx = Nothing
		'Check include virtual
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "<!--\s*#include\s*virtual\s*=\s*"".*"""
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call HX_ScanFile( Server.MapPath("\")&"\"&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
		'Check Server&.Execute|Transfer
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "Server.(Exec"&"ute|Transfer)([ \t]*|\()"".*"""
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call HX_ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
		
		'Check Server&.Execute|Transfer
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "Server.(Exec"&"ute|Transfer)([ \t]*|\()[^""]\)"
		If regEx.Test(filetxt) Then HX_ScanFile=True
		Set Matches = Nothing
		Set regEx = Nothing
		'Check Crea"&"teObject
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "CreateO"&"bject[ |\t]*\(.*\)"
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			If Instr(Match.Value, "&") or Instr(Match.Value, "+") or Instr(Match.Value, """") = 0 or Instr(Match.Value, "(") <> InStrRev(Match.Value, "(") Then
				HX_ScanFile=True
				exit Function
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
	end if
	set ofile = nothing
	set fsos = nothing	
End Function

dim newline
dim Base64EncMap(63)
dim Base64DecMap(127)
'初始化函数
PUBLIC SUB initCodecs()
' 初始化变量
newline = "<P>" & chr(13) & chr(10)
dim max, idx
max = len("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")
for idx = 0 to max - 1
  Base64EncMap(idx) = mid("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",idx+1,1)
next
for idx = 0 to max - 1
  Base64DecMap(ASC(Base64EncMap(idx))) = idx
next
END SUB

'Base64加密函数
PUBLIC FUNCTION Encryptstr(plain)
if len(plain) = 0 then
Encryptstr = ""
exit function
end if
dim ret, ndx, by3, first, second, third
by3 = (len(plain) \ 3) * 3
ndx = 1
do while ndx <= by3
first = asc(mid(plain, ndx+0, 1))
second = asc(mid(plain, ndx+1, 1))
third = asc(mid(plain, ndx+2, 1))
ret = ret & Base64EncMap( (first \ 4) AND 63 )
ret = ret & Base64EncMap( ((first * 16) AND 48) + ((second \ 16) AND 15 ) )
ret = ret & Base64EncMap( ((second * 4) AND 60) + ((third \ 64) AND 3 ) )
ret = ret & Base64EncMap( third AND 63)
ndx = ndx + 3
loop
if by3 < len(plain) then
first = asc(mid(plain, ndx+0, 1))
ret = ret & Base64EncMap( (first \ 4) AND 63 )
if (len(plain) MOD 3 ) = 2 then
second = asc(mid(plain, ndx+1, 1))
ret = ret & Base64EncMap( ((first * 16) AND 48) + ((second \ 16) AND 15 ) )
ret = ret & Base64EncMap( ((second * 4) AND 60) )
else
ret = ret & Base64EncMap( (first * 16) AND 48)
ret = ret '& "="
end if
ret = ret '& "="
end if
Encryptstr = ret
END FUNCTION

'Base64解密函数
PUBLIC FUNCTION decryptstr(scrambled)
if len(scrambled) = 0 then
decryptstr = ""
exit function
end if
dim realLen
realLen = len(scrambled)
do while mid(scrambled, realLen, 1) = "="
realLen = realLen - 1
loop
dim ret, ndx, by4, first, second, third, fourth
ret = ""
by4 = (realLen \ 4) * 4
ndx = 1
do while ndx <= by4
first = Base64DecMap(asc(mid(scrambled, ndx+0, 1)))
second = Base64DecMap(asc(mid(scrambled, ndx+1, 1)))
third = Base64DecMap(asc(mid(scrambled, ndx+2, 1)))
fourth = Base64DecMap(asc(mid(scrambled, ndx+3, 1)))
ret = ret & chr( ((first * 4) AND 255) + ((second \ 16) AND 3))
ret = ret & chr( ((second * 16) AND 255) + ((third \ 4) AND 15))
ret = ret & chr( ((third * 64) AND 255) + (fourth AND 63))
ndx = ndx + 4
loop
if ndx < realLen then
first = Base64DecMap(asc(mid(scrambled, ndx+0, 1)))
second = Base64DecMap(asc(mid(scrambled, ndx+1, 1)))
ret = ret & chr( ((first * 4) AND 255) + ((second \ 16) AND 3))
if realLen MOD 4 = 3 then
third = Base64DecMap(asc(mid(scrambled,ndx+2,1)))
ret = ret & chr( ((second * 16) AND 255) + ((third \ 4) AND 15))
end if
end if
decryptstr = ret
END FUNCTION

'加密函数
Function UrlEncoded(Str) 
    Dim ven,vena
     for i=1 to len(Str) 
        if mid(Str,i,1)<>chr(13) then 
           ven=asc(mid(Str,i,1))+5 
           if ven>127 or ven<33 then 
               ven=ven-95 
           end if 
           vena=vena&chr(ven) 
        else 
         vena=vena&"＋" 
        end if 
     next 
     UrlEncoded=vena 
End Function 

'解密函数
Function UrlDecoded(Str) 
    Dim ven,vena
    for i=1 to len(Str) 
      if mid(Str,i,1)<>"＋" then 
         ven=asc(mid(Str,i,1))-5 
         if ven>126 then 
            ven=ven-95 
         elseif ven<32 then 
            ven=ven+95 
         end if 
       vena=vena&chr(ven) 
     else 
       vena=vena&chr(13) 
     end if 
    next 
   UrlDecoded=vena 
End Function 

function UserOption()
    UserOption=""
    set urs=WS_S.HX_SetRSD("","HX_CompanyUser"," order by WS_Uid desc")
	if urs.recordcount>0 then
	  do until urs.eof
	    UserOption=UserOption& "<option value="&urs("WS_UserName")&">"&urs("WS_Name")&"</option>"
	  urs.movenext
	  loop
	end if
end function

function UserOptionEdit(Str)
    UserOptionEdit=""
    set urs=WS_S.HX_SetRSD("","HX_CompanyUser"," order by WS_Uid desc")
	if urs.recordcount>0 then
	  do until urs.eof
	    UserOptionEdit=UserOptionEdit& "<option value='"&urs("WS_UserName")&"'"
		if Str=trim(urs("WS_UserName")) then UserOptionEdit=UserOptionEdit&" selected"
		UserOptionEdit=UserOptionEdit&">"&urs("WS_Name")&"</option>"
	  urs.movenext
	  loop
	end if
end function

Function HX_NotifyClass(Str)
 On error resume next
 HX_NotifyClass=""
 If Str<>"" and isnumeric(Str) Then
   Set NCRS=WS_S.HX_SetRSD("","HX_NotifyClass"," where WS_NCID="&Str)
   If NCRS.recordcount>0 then
      HX_NotifyClass=NCRS("WS_NotifyClass")
   else
      HX_NotifyClass=""
   End If
 End If
End Function

Function ZipFolder()   
    'on error resume next
	dim IsSuccess,unzip_path,WshShell,FolderId,FileId,FolderIdarr,FileIdarr,FileIdpath
	FolderId = Request.Form("FolderId")
	FileId = Trim(Request("FileId"))
	if TopThisDir<>"" then TopThisDir=Replace(TopThisDir,"\\","\")
    unzip_path=server.mappath(TopThisDir)
	if ComeUrl="" or isnull(ComeUrl) then ComeUrl="Netdisk.asp"
	WS_S.NetDiskIsNot ComeUrl
	Set WshShell = server.CreateObject("Wscript.Shell")
	FileIdpath=""	
	if FolderId<>"" then 
	  FolderIdarr=split(FolderId,",")
	  for i=0 to ubound(FolderIdarr)	  
	    FileIdpath=FileIdpath&""""&unzip_path&"\"&trim(FolderIdarr(i))&""""&" "
	  next
	end if		
	if fileid<>"" then 
	  FileIdarr=split(FileId,",")
	  for i=0 to ubound(FileIdarr)	  
	    FileIdpath=FileIdpath&""""&unzip_path&"\"&trim(FileIdarr(i))&""""&" "
	  next
	end if		
	WshShell.exec(server.mappath("rarpath\cmd.exe")&" /c "&server.mappath("rarpath\rar.exe") & " a -ag -ep1 "&unzip_path&"\ "&FileIdpath&"")
	 response.redirect ComeUrl
	 response.end
End Function

Function UPZipFolder
	dim IsSuccess,unzip_path,WshShell,FileId,FileIdarr,FileIdpath
	if ComeUrl="" or isnull(ComeUrl) then ComeUrl="Netdisk.asp"
	WS_S.NetDiskIsNot ComeUrl
	FileId = Trim(Request("FileId"))
	if TopThisDir<>"" then TopThisDir=Replace(TopThisDir,"\\","\")
    unzip_path=server.mappath(TopThisDir)
    Set WshShell = server.CreateObject("Wscript.Shell")
	FileIdpath=""	
	if fileid<>"" then 
	  FileIdarr=split(FileId,",")
	  for i=0 to ubound(FileIdarr)	  
	    FileIdpath=unzip_path&"\"&trim(FileIdarr(i))
	    WshShell.exec(server.mappath("rarpath\cmd.exe")&" /c "&server.mappath("rarpath\rar.exe") & " x -o+ -p- "&FileIdpath&" "&unzip_path&"")
	  next
	end if	
	 response.redirect ComeUrl
	 response.end
End Function


Sub DirFolderUpdate(DirPath,DirnameStr,DirSize,DirModified,DirUserName,DriUploadPerson)
     if DirnameStr<>"" then
	     DirPath=DirPath&"\"
		 DirPath=PathReplace(DirPath)
      set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&DirUserName&"' and Postion='"&DirPath&"' and DirName='"&DirnameStr&"'")
	  if DirRs.recordcount<=0 then
	     DirRs.addnew
		 DirRs("UserName")=DirUserName
		 DirRs("Postion")=DirPath
	     DirRs("DirName")=DirnameStr
	     DirRs("FileSize")=DirSize
	     DirRs("LastTime")=DirModified
		 if DriUploadPerson<>"" then DirRS("UploadPerson")=DriUploadPerson
	     DirRs.update
	  else
	     if DirRs("FileSize")<>DirSize then DirRs("FileSize")=DirSize
	     if DirRs("LastTime")<>DirModified then DirRs("LastTime")=DirModified
	     DirRs.update
	  end if
	  WS_S.HX_RSClose DirRs
     end if
End Sub

Sub DirFileUpdate(DirPath,DirnameStr,DirSize,DirModified,DirUserName,DriUploadPerson)
     if DirnameStr<>"" then
         ThisDir=ThisDir&"\"
		 ThisDir=PathReplace(ThisDir)
      set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&DirUserName&"' and Postion='"&DirPath&"' and FileName='"&DirnameStr&"'")
	  if DirRs.recordcount<=0 then
	     DirRs.addnew
		 DirRs("UserName")=DirUserName
		 DirRs("Postion")=DirPath
	     DirRs("FileName")=DirnameStr
	     if instr(DirnameStr,".")>0 then DirRs("FileExt")=split(DirnameStr,".")(ubound(split(DirnameStr,".")))
	     DirRs("FileSize")=DirSize
	     DirRs("LastTime")=DirModified
         if DriUploadPerson<>"" then DirRS("UploadPerson")=DriUploadPerson
		 DirRs.update
	  else
	     if DirRs("FileSize")<>DirSize then DirRs("FileSize")=DirSize
	     if DirRs("LastTime")<>DirModified then DirRs("LastTime")=DirModified
	     DirRs.update
	  end if
	  WS_S.HX_RSClose DirRs
     end if
End Sub

Sub DirFolderDel(DirUserName,DirnameStr,DirPostion)
    on error resume next
     if DirnameStr<>"" then
	   set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&trim(DirUserName)&"' and Postion='"&trim(DirPostion)&"' and DirName='"&trim(DirnameStr)&"'")
	  if DirRs.recordcount>0 then
	     DirRs.Delete
	  end if
	  WS_S.HX_RSClose DirRs
	  end if
End Sub

Sub DirFileDel(DirUserName,DirnameStr,DirPostion)
    on error resume next
     if DirnameStr<>"" then
      set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&trim(DirUserName)&"' and Postion='"&trim(DirPostion)&"' and FileName='"&trim(DirnameStr)&"'")
	  if DirRs.recordcount>0 then
	     DirRs.Delete
	  end if
	  WS_S.HX_RSClose DirRs
     end if
End Sub

Function UploadPersonFolderOut(DirUserName,DirnameStr,DirPostion,DirOutType)
   UploadPersonFolderOut=""
   if DirnameStr<>"" then
      set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&DirUserName&"' and Postion='"&DirPostion&"' and DirName='"&DirnameStr&"'")
	  if DirRs.recordcount>0 then
	    if DirRs("UploadPerson")<>"" then
		  if DirOutType=1 then
		      UploadPersonFolderOut="　<font color=808080>"&DirRs("UploadPerson")&"上传的</FONT>"
		   else
		       UploadPersonFolderOut=trim(DirRs("UploadPerson"))
		   end if
		 end if  
	  end if
	  WS_S.HX_RSClose DirRs   
   end if
End Function

Function UploadPersonFileOut(DirUserName,DirnameStr,DirPostion,DirOutType)
   UploadPersonFileOut=""
   if DirnameStr<>"" then
      set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&DirUserName&"' and Postion='"&DirPostion&"' and FileName='"&DirnameStr&"'")
	  if DirRs.recordcount>0 then
	    if DirRs("UploadPerson")<>"" then
		   if DirOutType=1 then
		      UploadPersonFileOut="　<font color=808080>"&DirRs("UploadPerson")&"上传的</FONT>"
			else
		      UploadPersonFileOut=trim(DirRs("UploadPerson"))
			end if  
		end if	
	  end if
	  WS_S.HX_RSClose DirRs   
   end if
End Function

Sub FolderFilePrv(FolderFileID)
     FolderFileShare=0
	 FolderFileShareType=0
	 FolderFileAddFile=0
	 FolderFileEditFile=0
	 FolderFileDelFile=0
	 FolderFileShareSee=""
	 FolderFileShareAdd=""
	 FolderFileShareEdit=""
	 FolderFileShareDel=""	 
	 If HX_IsNum(FolderFileID) Then
	    SET FolderFileRS=HX_SetRSD("","HX_NetDiskFolderOrFile"," where id="&FolderFileID)
		if FolderFileRS.recordcount>0 then
          FolderFileShare=trim(FolderFileRS("Share"))
	      FolderFileShareType=trim(FolderFileRS("ShareType"))
	      FolderFileAddFile=trim(FolderFileRS("AddFile"))
	      FolderFileEditFile=trim(FolderFileRS("EditFile"))
	      FolderFileDelFile=trim(FolderFileRS("DelFile"))
		  if FolderFileShare=2 then
       	     FolderFileShareSee="|"&trim(LoginUID)&"|"
     	     FolderFileShareAdd="|"&trim(LoginUID)&"|"
      	     FolderFileShareEdit="|"&trim(LoginUID)&"|"
     	     FolderFileShareDel="|"&trim(LoginUID)&"|"
		  else
       	     FolderFileShareSee=trim(FolderFileRS("ShareSee"))
     	     FolderFileShareAdd=trim(FolderFileRS("ShareAdd"))
      	     FolderFileShareEdit=trim(FolderFileRS("ShareEdit"))
     	     FolderFileShareDel=trim(FolderFileRS("ShareDel"))
		  end if
		end if
	 End If
End Sub

Function UserNetDiskSizeOut(Userid)
       UserNetDiskSizeOut=UserNetDiskSize
	   if Userid<>"" and isnumeric(Userid) then
	     Set Outrs=WS_S.HX_SetRSD("*","HX_CompanyUser"," where WS_Uid="&Userid)
		 if Outrs.recordcount>0 then
		   if Outrs("WS_UserNetDiskSize")<>"" then  UserNetDiskSizeOut=Outrs("WS_UserNetDiskSize")
		 end if
		 WS_S.HX_RSClose Outrs
       end if
End Function

Function NetDiskIsNot(Url)
  dim AllFileSize
  NetDiskIsNot=False
  AllFileSize=trim(Session("AllFileSize"))
  AllFileSize=AllFileSize/1048576
  if AllFileSize>=WS_S.UserNetDiskSizeOut(LoginUID) then
       NetDiskIsNot=True
  end if
  if NetDiskIsNot then
     HX_GoBack "对不起，空间已满，不能上传、压缩、解压文件！",Url
  end if	 	
End Function


Function ShowUserName(Str)
  ShowUserName=""
  if Str<>"" then
    Str=split(Str,"|")
	for ii=0 to ubound(Str)
	   if trim(Str(ii))<>"" and isnumeric(trim(Str(ii))) then
	     Call WS_S.HX_OutUserInfo(trim(Str(ii)))		 
	     ShowUserName=ShowUserName&OutName&"|"
	   end if
    next  
  end if			
End Function

Function ShareFolderImg(DirnameStr)
   ShareFolderImg="../hximages/fileicon/folder.gif"
   if DirnameStr<>"" then
     ThisDir=ThisDir&"\"
	 ThisDir=replace(ThisDir,"\\","\")
	 'set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&LOGINUSERNAME&"' and Postion='"&ThisDir&DirnameStr&"\"&"' and Share>0")
	 set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&LOGINUSERNAME&"' and Postion='"&ThisDir&"' and DirName='"&DirnameStr&"' and Share>0")
	' response.write " where UserName='"&LOGINUSERNAME&"' and Postion='"&ThisDir&"' and DirName='"&DirnameStr&"' and Share>0"
	 'response.end	
	  if DirRs.recordcount>0 then
	      ShareFolderImg="pics/shared.GIF"
	  end if
   end if
End Function

Function ShareFileImg(DirnameStr)
   ShareFileImg=""
   if DirnameStr<>"" then
     ThisDir=ThisDir&"\"
	 ThisDir=replace(ThisDir,"\\","\")
	 set DirRs=WS_S.HX_SetRSD("","HX_NetDiskFolderOrFile"," where UserName='"&LOGINUSERNAME&"' and Postion='"&ThisDir&"' and Share>0 and FileName='"&DirnameStr&"'")
	  if DirRs.recordcount>0 then
	      ShareFileImg="<img src='pics/shared.GIF'>"
	  end if
   end if
End Function

Function ShareTypeOut(Str)
   ShareTypeOut=""
   if Str<>"" then
     select case Str
	 case 0
	    ShareTypeOut="不共享"
	 case 1
	    ShareTypeOut="共享本部门"
	 case 2
	    ShareTypeOut="所有人可见"
	 case 3
	    ShareTypeOut="指定人可见"
	 end select    
   end if
End Function

Function OutShare(Str)
   OutShare=""
   if Str<>"" and isnumeric(Str) then
      if Str=1 then response.write "√"
   end if
End Function

function UrlEncoding(vstrin)
    dim i,strreturn,strSpecial,thischr,innercode,hight8,low8
    strSpecial = "!""#$%&'()*+,/:;<=>?@[\]^`{|}~%"
    strreturn = ""
    for i = 1 to len(vstrin)
        thischr = mid(vstrin,i,1)
        if abs(asc(thischr)) < &hff then
        	if thischr=" " then
        		strreturn = strreturn & "+"
            elseif instr(strSpecial,thischr)>0 then
                strreturn = strreturn & "%" & hex(asc(thischr))
            else
                strreturn = strreturn & thischr
            end if
        else
            innercode = asc(thischr)
            if innercode < 0 then
                innercode = innercode + &h10000
            end if
            hight8 = (innercode  and &hff00)\ &hff
            low8 = innercode and &hff
            strreturn = strreturn & "%" & hex(hight8) &  "%" & hex(low8)
        end if
    next
    urlencoding = strreturn
end function

Function HX_ColorOn(Str,ColorWord)
    HX_ColorOn=""
    if Str<>"" then
      HX_ColorOn=Replace(Str,ColorWord,"<font color='#FF0000'>"&ColorWord&"</font>") 
	end if
End Function

function chinese2unicode(Str)
 dim i 
 dim Str_one 
 dim Str_unicode 
 for i=1 to len(Str) 
   Str_one=Mid(Str,i,1)
   Str_unicode=Str_unicode & chr(38)
   Str_unicode=Str_unicode & chr(35)
   Str_unicode=Str_unicode & chr(120)
   Str_unicode=Str_unicode & Hex(ascw(Str_one))
   Str_unicode=Str_unicode & chr(59)
  next
  chinese2unicode=Str_unicode
end function

Function HXAreaiconOption(Dir)
  HXAreaiconOption=""
  if Dir<>"" then
	  Dir=server.MapPath(Dir)
	  Set Fso=Server.CreateObject("Scripting.FileSystemObject")
	  Set FsoFile = Fso.GetFolder(Dir)
	  If Err Then
		Set	FsoFile = Nothing
		HXAreaiconOption="找不到目录，可能参数配置错误！"
	  Else
		   For Each DirFiles in FsoFile.Files
		   if ucase(right(DirFiles.name,4))=".GIF" or ucase(right(DirFiles.name,4))=".JPG" then
			HXAreaiconOption=HXAreaiconOption&"<option value='"&DirFiles.name&"'>"&DirFiles.name&"</option>"
		   End If
		   Next
	  End If
  End If
  Set Fso = Nothing
End Function

'单点登录限制
Function ChangIsLogin(Str)
	if Str="IsLogin" then
	  WS_S.ExeCtSql("update HX_Online set WS_Lasttime='" & now() & "',WS_Viewip='" & request.ServerVariables("REMOTE_ADDR") &"' where WS_Userid="&LoginUID )
	  call WS_S.SaveAdminLog(LOGINUSERNAME,LogAppointment,"登录成功!")
	  response.Redirect "HX_managemain.asp"
	  response.End()
	end if
End Function


Function EditorStypeFunction()
   EditorStypeFunction=AcquEditor
   set EditorRs=WS_S.ExeCtSql("select WS_EditorStype from HX_CompanyUser where WS_Uid="&LoginUID)
   if not(EditorRs.eof or EditorRs.bof) then
     if EditorRs(0)<>"" then EditorStypeFunction=EditorRs(0)
   end if
   WS_S.HX_RSClose EditorRs
End Function

Function ScanSkinFile(Str)
	TopDir=server.mappath("..\HXSkin\")
	Set objFSO = Server.CreateObject("scripting.FileSystemObject")
	Set FsoFile = objFSO.GetFolder(TopDir)
	if Err then
		Set	FsoFile = Nothing
		Response.write "找不到目录，可能参数配置错误！"
		Response.end
	end if
	 SkinAdd=False
	 if Str="Scan" then
		SET ScanSkinRs=HX_SetRSD("WS_SKID,WS_SkinPath","HX_WSOASSkin"," order by WS_SKID asc")
		 if ScanSkinRs.recordcount>0 then
		  do until ScanSkinRs.eof
			if not objFSO.FolderExists(server.mappath("..\HXSkin\"&ScanSkinRs("WS_SkinPath"))) then WS_S.ExeCtSql("Delete from HX_WSOASSkin where WS_SKID="&ScanSkinRs("WS_SKID"))
		  ScanSkinRs.movenext
		  loop
		 end if
		HX_RSClose ScanSkinRs
	 end if 
	 For Each DirFolder in FsoFile.SubFolders
	  if WS_S.ExeCtSql("select WS_SkinPath from HX_WSOASSkin where WS_SkinPath='"&LCase(DirFolder.name)&"'").eof then
		ThisDir=server.mappath("..\HXSkin\"&DirFolder.name)
		if objFSO.FileExists(ThisDir&"\"&"Css.css") and objFSO.FileExists(ThisDir&"\"&"SkinICO.jpg") and objFSO.FolderExists(ThisDir&"\"&"Images") then
		   if Str="Scan" then
			 SkinAdd=True	
			 exit for
		   else
		     WS_S.ExeCtSql("INSERT INTO HX_WSOASSkin(WS_SkinTitle,WS_SkinPath,WS_SkinAddate,WS_SkinFlag) values('wygk.cn','"&LCase(DirFolder.name)&"','"&now&"',1) ")
		   end if	
		end if	
	  end if
	next		
	Set	FsoFile = Nothing:Set objFSO = Nothing
	if Str="Scan" then ScanSkinFile=SkinAdd
End Function







Function GetIpAddress(IpAddr)
    GetIpAddress=""
    If IpAddr<>"" Then
	    GetIpAddressArr = split(IpAddr,".")
		
		GetIpAddressArr1=GetIpAddressArr(0)
		GetIpAddress1=""
		If len(GetIpAddressArr1)<3 then
		   for i=0 to 2-len(GetIpAddressArr1)
		     GetIpAddress1=GetIpAddress1&"0"
		   next
		   GetIpAddress1=GetIpAddress1&GetIpAddressArr1
		else
		   GetIpAddress1=GetIpAddressArr1
		end if
			
		GetIpAddressArr2=GetIpAddressArr(1)
		GetIpAddress2=""
		If len(GetIpAddressArr2)<3 then
		   for i=0 to 2-len(GetIpAddressArr2)
		     GetIpAddress2=GetIpAddress2&"0"
		   next
		   GetIpAddress2=GetIpAddress2&GetIpAddressArr2
		else
		   GetIpAddress2=GetIpAddressArr2
		end if
		
		GetIpAddressArr3=GetIpAddressArr(2)
		GetIpAddress3=""
		If len(GetIpAddressArr3)<3 then
		   for i=0 to 2-len(GetIpAddressArr3)
		     GetIpAddress3=GetIpAddress3&"0"
		   next
		   GetIpAddress3=GetIpAddress3&GetIpAddressArr3
		else
		   GetIpAddress3=GetIpAddressArr3
		end if


		GetIpAddressArr4=GetIpAddressArr(3)
		GetIpAddress4=""
		If len(GetIpAddressArr4)<3 then
		   for i=0 to 2-len(GetIpAddressArr4)
		     GetIpAddress4=GetIpAddress4&"0"
		   next
		   GetIpAddress4=GetIpAddress4&GetIpAddressArr4
		else
		   GetIpAddress4=GetIpAddressArr4
		end if
	
	End If	
	GetIpAddress=GetIpAddress1 & "." & GetIpAddress2 & "." & GetIpAddress3 & "." & GetIpAddress4			
End Function

Sub SendMobile(Str,MStr)
	Dim mobilers
	if Str<>"" then
		SEUserIDArr=split(Str,"|")
		for k=0 to ubound(SEUserIDArr)-1
		SEUserID=trim(SEUserIDArr(k))
			if HX_IsNum(SEUserID) then
				set mobilers=WS_S.HX_SetRSD("WS_Mobile","HX_CompanyUser"," where WS_mobile<>'' and WS_UID="&SEUserID)
				if mobilers.recordcount>0 then
					Call MobileSend(mobilers("WS_Mobile"),MStr)
				end if
				mobilers.close:set mobilers=nothing
			end if
		next	
	else
		set mobilers=WS_S.HX_SetRSD("WS_Mobile","HX_CompanyUser"," where WS_mobile<>''")
		if mobilers.recordcount>0 then
			do until mobilers.eof
				Call MobileSend(mobilers("WS_Mobile"),MStr)
			mobilers.movenext
			loop
		end if
		mobilers.close:set mobilers=nothing
	end if
End Sub

Public Function MobileSend(MobileNo,MStr)
	   if MobileNo<>"" then MobileNo=replace(mid(MobileNo,1,len(MobileNo)-1),",",";")
	   SendTimer=now
	   URL = "http://web.mobset.com/SDK/Sms_Send.asp?CorpID="&SmsID&"&LoginName="&SmsUSE&"&send_no="&MobileNo&"&passwd="&WS_S.decryptstr(SMSPWD)&"&Timer="&SendTimer&"&msg="&Server.URLEncode(MStr)
	    set objHttpRequest = CreateObject("MSXML2.ServerXMLHTTP" )
        if objHttpRequest is Nothing Then
          response.write "创建Msxl2.ServerXMLHTTP错误！"
          response.end
       end if
      objHttpRequest.open "GET",URL,False
      objHttpRequest.send()
      if objHttpRequest.status <> 200  then
       response.write "打开请求错误！"
       response.end
	  end if
      retMsg = objHttpRequest.responseText
      Ret   = left(retMsg,InStr(retMsg,",")-1)
      iRet  = Cint(Ret)
      if iRet>0  then  '判断是否发送成功
        SendID = right(retMsg,len(retMsg)-InStr(retMsg,","))
		If DataBaseType=1 Then
		  WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&MobileNo&"','"&SendTimer&"','发送成功','"&MStr&"','SmsID:"&SendID&"',"&loginuid&")")
		else
		  WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&MobileNo&"',#"&SendTimer&"#,'发送成功','"&MStr&"','SmsID:"&SendID&"',"&loginuid&")")
		end if
      else
		select case iRet
		 case -1 msg="输入参数不完整！"
		 case -2 msg="非法来源IP地址或帐号密码有误！"
		 case -3 msg="目标号码有误！"
		 case -4 msg="企业帐号余额不足，后跟已发送的数量及SmsID！"
		 case -5 msg="用户帐号余额不足，后跟已发送的数量及SmsID！"
		 case -6 msg="输入参数不完整！"
		 case -7 msg="连接数据库失败！"
		 case -8 msg="企业帐号已被禁用！"
		 case -9 msg="短信内容含有过滤关键字！"
		end select  
         If DataBaseType=1 Then
		   WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&MobileNo&"','"&SendTimer&"','发送失败','"&MStr&"','"&msg&"',"&loginuid&")")
          else
		    WS_S.ExeCtSql("insert into HX_WSOASSMS(WS_WSOASSMSSendNO,WS_WSOASSMSSendDate,WS_WSOASSMSStatus,WS_WSOASSMSContent,WS_WSOASSMSSendID,WS_WSOASSMSCreate) values('"&MobileNo&"',#"&SendTimer&"#,'发送失败','"&MStr&"','"&msg&"',"&loginuid&")")
		  end if
	  end if
      Set objHttpRequest = Nothing
End Function

Function HX_OutTaskClassName(Str)
	   HX_OutTaskClassName=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_TaskClass":Orderby=" where WS_TCID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutTaskClassName=Ourtyrs("WS_TaskClass")
		  end if
		  Ourtyrs.close:set Ourtyrs=nothing       
	   end if
End Function


Function HX_OutBuildOfficeName(Str)
	   HX_OutBuildOfficeName=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_BuildOffice":Orderby=" where WS_BFID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutBuildOfficeName=Ourtyrs("WS_BuildOfficeName")
		  end if  
		  Ourtyrs.close:set Ourtyrs=nothing     
	   end if
End Function

Function HX_OutConsumablesClassName(Str)
	   HX_OutConsumablesClassName=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_BuildConsumablesClass":Orderby=" where WS_BCID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutConsumablesClassName=Ourtyrs("WS_BuildConsumablesClass")
		  end if 
		  Ourtyrs.close:set Ourtyrs=nothing      
	   end if
End Function

Function HX_OutBuildEquipmentName(Str) '设备名称
	   HX_OutBuildEquipmentName=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_BuildEquipment":Orderby=" where WS_BEID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutBuildEquipmentName=Ourtyrs("WS_BuildEquipmentName")
		  end if
		   Ourtyrs.close:set Ourtyrs=nothing     
	   end if
End Function

Function HX_OutResearchInfoClassName(Str) '设备名称
	   HX_OutResearchInfoClassName=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_ResearchInfoClass":Orderby=" where WS_RCID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          if Ourtyrs.recordcount>0 then
		    HX_OutResearchInfoClassName=Ourtyrs("WS_ResearchInfoClass")
		  end if
		   Ourtyrs.close:set Ourtyrs=nothing     
	   end if
End Function



Function HX_BuildEquipmentRepairRecord(Str)
	   HX_BuildEquipmentRepairRecord=""
	   if HX_IsNUM(Str) then
	     ColumnName="":tablename="HX_BuildEquipmentRepair":Orderby=" where WS_BEID="&Str
         set Ourtyrs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
		    HX_BuildEquipmentRepairRecord="<a href=""javascript:HrefTarget('设备报修','BuildEquipmentRepairManage.Asp?BEID="&Str&"');"" title='设备报修记录'>"&Ourtyrs.recordcount&"</a>"
	   end if
	   Ourtyrs.close:set Ourtyrs=nothing 
End Function

Function DisplayJobMatchingTite(strID)
DisplayJobMatchingTite=""
	if WS_S.HX_Isnum(strID) then
		set Ders=WS_S.HX_SetRSD("", "HX_JobMatchingOrganizations", " where WS_JMID="&strID)
		if Ders.recordcount>0 then
			DisplayJobMatchingTite=Ders("WS_JobMatchingTite")
		end if
		Ders.close:set Ders=nothing
	end if
End Function

Function CutChar(Str,C)
CutChar=Str
dim CutChar1
CutChar1=Str
if CutChar<>"" then
	if cint(len(CutChar))>=cint(C) then			
		if int(len(CutChar))>int(len(nohtml(CutChar))) then
			CutChar=left(CutChar1,(C+14))
		else
			CutChar=left(CutChar1,C)
		end if
		CutChar="  "&CutChar&".  "
	else
		for i=0 to cint(C-len(Str)/2)
			CutChar=CutChar&" "
		next
		for i=0 to cint(C-len(Str)/2)
			CutChar=" "&CutChar
		next
	end if
end if
End Function


function getdate(a)
if trim(a)<>"" then
dim date1,date2
date1=replace(a,"/","-")
date1=split(date1," ")
date2=split(date1(0),"-")
if date2(1)<10 and instr(date2(1),0)=0 then
date2(1)=0&date2(1)
end if
if date2(2)<10 and instr(date2(2),0)=0 then
date2(2)=0&date2(2)
end if
response.Write ""&date2(0)&"-"&date2(1)&"-"&date2(2)&""
else
response.Write""
end if
end function

	function CheckLogin() '检查是否登录
	   if trim(loginuid)="" then
	      response.Write "<script>location.href='HX_Login.asp'</script>"
		  response.End()
	   end if
	end function
	
	function checkforgetcode(PhoneNumber,VerificationCode)
	    set rs2=WS_S.HX_SetRSD("","code"," where PhoneNumber='"&PhoneNumber&"' and codevalue='"&VerificationCode&"'")
		  if rs2.recordcount=1 then
		     if DateDiff("n",rs2("codedate"),now())>30 then
			    response.Write "<script>alert('短信验证码超时，请重新获取验证码');location.href='forget.asp';</script>"
		        response.End()
			 end if
		  else
		     response.Write "<script>alert('短信验证码出错，请重新填写或重新获取短信验证码');location.href='forget.asp';</script>"
		     response.End()
		  end if
	end function
	function checkcode(PhoneNumber,VerificationCode)
	    set rs2=WS_S.HX_SetRSD("","code"," where PhoneNumber='"&PhoneNumber&"' and codevalue='"&VerificationCode&"'")
		  if rs2.recordcount=1 then
		     if DateDiff("n",rs2("codedate"),now())>30 then
			    response.Write "<script>alert('短信验证码超时，请重新获取验证码');history.go(-1);</script>"
		        response.End()
			 end if
		  else
		     response.Write "<script>alert('短信验证码出错，请重新填写或重新获取短信验证码');history.go(-1);</script>"
		     response.End()
		  end if
	end function
    function Abstract(OrderNo)
	    dim rs_p,rs_t,rs_s,str
	    set rs_p=WS_S.HX_SetRSD("","ProjectOrder"," where OrderNo='"&OrderNo&"'")
		  if rs_p.recordcount>0 then
		    do while not rs_p.eof
		     set rs_t=WS_S.HX_SetRSD("","Project"," where id="&rs_p("P_id")&"")
			   if rs_t.recordcount>0 then
			      set rs_s=WS_S.HX_SetRSD("","Shop"," where id="&rs_t("S_id")&"")
			      str=str&rs_s("Brand")&"-"&rs_t("ProjectName")&","
			   end if
			rs_p.movenext
			loop
			str=left(str,len(str)-1)
			Abstract=left(str,25)
		  end if
	end  function
	function Abstract1(OrderNo)
	    dim rs_p,rs_t,rs_s,str
	    set rs_p=WS_S.HX_SetRSD("","ProjectOrder"," where OrderNo='"&OrderNo&"'")
		  if rs_p.recordcount>0 then
		    do while not rs_p.eof
			 if session("Financetype")="1" then
			 Orderby=" where (WS_EUid=6960 or ParentID=6960 or WS_EUid=522 or ParentID=522 )"
			 else
			 if session("Browsetype")=0 then
			 Orderby=" where (WS_EUid="&session("WS_Uid")&" or ParentID="&session("WS_Uid")&")"
			 else
			 if session("SaleType")=0 then
			 Orderby=" where (WS_EUid="&session("ParentID")&" or ParentID="&session("ParentID")&")"
			 else
			 rs_sale.open "select * from HX_EnterpriseUser where WS_Uid="&session("WS_Uid")&"",conn,1,1
			 Orderby=" where (WS_EUid in ('"&replace(rs_sale("SaleUid"),",","','")&"') or ParentID in ('"&replace(rs_sale("SaleUid"),",","','")&"'))"
			 end if
			 end if
			 end if
		     set rs_t=WS_S.HX_SetRSD("","Project",Orderby&" and id="&rs_p("P_id")&"")
			   if rs_t.recordcount>0 then
			      set rs_s=WS_S.HX_SetRSD("","Shop"," where id="&rs_t("S_id")&"")
			      str=str&rs_s("Brand")&"-"&rs_t("ProjectName")&","
			   end if
			rs_p.movenext
			loop
			str=left(str,len(str)-1)
			Abstract=left(str,25)
		  end if
	end  function
	function ServiceType(WS_ServiceType)
	        dim str
	        str=""
			if trim(WS_ServiceType)<>"" then
			  for i= 0 to ubound(split(WS_ServiceType,","))
			     ServiceTypeid=int(split(WS_ServiceType,",")(i))
				  set rs1=WS_S.HX_SetRSD("","InstallationType"," where ID="&ServiceTypeid)
				  if rs1.recordcount>0 then
				   str=str&rs1("InstallationTypeName")&" "
				  end if
			  next
			end if 
			ServiceType=str
	end function
END CLASS 
Sub sendsms(mobile,msg)
'多个手机号之间用“,”分隔
dim userid,password,status
dim xmlObj,httpsendurl
userid = "56303"		'企业ID，请联系我们索取免费测试帐号
password = "649gj5"	'ID密码，要使用MD5加密为32位密文并转换为小写
password = LCASE(MD5(password))

httpsendurl="http://http.yunsms.cn/tx/?action=send&uid="&userid&"&pwd="&password&"&mobile="&mobile&"&content="&server.URLEncode(msg)
'httpsendurl="http://106.3.37.111:8888/smsGBK.aspx?action=send&userid=257&account=x56303 &password=18982102449&mobile="&mobile&"&content="&server.URLEncode(msg)&"&sendTime=&extno="

Set xmlObj = server.CreateObject("Microsoft.XMLHTTP")
xmlObj.Open "GET",httpsendurl,false
xmlObj.send()
status = xmlObj.responseText
Set xmlObj = nothing
If status = "100" then '发送成功

Else '发送失败
	
End if
End sub
Sub sendsms1(mobile,msg)
'多个手机号之间用“,”分隔
dim userid,password,status
dim xmlObj,httpsendurl
userid = "56555"		'企业ID，请联系我们索取免费测试帐号
password = "qa022a"	'ID密码，要使用MD5加密为32位密文并转换为小写
password = LCASE(MD5(password))

httpsendurl="http://http.yunsms.cn/tx/?uid="&userid&"&pwd="&password&"&mobile="&mobile&"&content="&server.URLEncode(msg)

Set xmlObj = server.CreateObject("Microsoft.XMLHTTP")
xmlObj.Open "GET",httpsendurl,false
xmlObj.send()
status = xmlObj.responseText
Set xmlObj = nothing
If status = "100" then '发送成功
  	
	 
Else '发送失败
	
End if
End sub

	function IsValidMobileNo(MobileNo)
    dim regEx
    set regEx = New RegExp
    regEx.Pattern = "^(13|15|17|18)[0-9]{9}$"
    IsValidMobileNo=regEx.test(MobileNo)
	end function 
	
	function IsValidMobileNo1(MobileNo)
    dim regEx
    set regEx = New RegExp
    regEx.Pattern = "^(\d{3,4}-)?\d{7,8}$"
    IsValidMobileNo1=regEx.test(MobileNo)
	end function 
	
	function IsValidPrice(Price)
    dim regEx
    set regEx = New RegExp
    regEx.Pattern = "^[0-9]+(\.[0-9]{1,2})?$"
    IsValidPrice=regEx.test(Price)
	end function 
	
	function IsUnvalidChar(testStr)
    dim regEx
    set regEx = New RegExp
    regEx.Pattern = "[=%<>/\|'""?]+"
    IsUnvalidChar=regEx.test(testStr)	
	end function 
%>