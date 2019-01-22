<%
Class HX_WSOASMENU
'下边框菜单
Sub HXManage_Down()
   WSOASCOMSTR="<script Language=JavaScript>function MStatusTitle(Strid){ var txt; var Strid;  switch(Strid){ case '0': txt='联机'; case 1: txt='忙碌'; case '2': txt='离开'; } return txt; } function ChangeMemberStatus(){if(document.getElementById('ONSTATUS').style.display=='none')  document.getElementById('ONSTATUS').style.display=''; else document.getElementById('ONSTATUS').style.display='none';}"
   WSOASCOMSTR=WSOASCOMSTR&" function MyOnStatus(){ var Onstatus =document.getElementById('ONSTATUS').value; document.all.ChangeMStatus.innerHTML = document.getElementById('ONSTATUS').options[document.getElementById('ONSTATUS').selectedIndex].text;  send_root_request('SelectWSOASAjax.Asp?Action=ChangeStatus&STATUSSET=' + Onstatus); document.getElementById('ONSTATUS').style.display='none';}"
   WSOASCOMSTR=WSOASCOMSTR&" </script>"
   WSOASCOMSTR=WSOASCOMSTR&"<bgsound id='psd' name='psd' src='' loop='1'><table width='100%' cellspacing cellpadding><tr><td width='100%' height='20'><table width='100%' cellspacing cellpadding class='ManageMainMenuHref'>"
   WSOASCOMSTR=WSOASCOMSTR&"<tr style=""filter:dropshadow(color=#666666,offx=1,offy=1,positive=1); WIDTH: 100%;FONT-WEIGHT: bold;"">"
   WSOASCOMSTR=WSOASCOMSTR&"<td width='106' align='center'><a href=""javascript:show_WEBSMS();"" style=""filter:dropshadow(color=#666666,offx=1,offy=1,positive=1);"" title='查看在线人数'>当前共有 <b><font id='onlinecount' color='FFC0FF'></font></b> 人在线</a></td><td width='70' align='center'><a href=""javascript:HrefTarget('查看短信','HX_WEBSMS/allsmsview.asp')"" title='发短信'><img src='hximages/websms/websms.gif' id='comesms' name='comesms' align='absmiddle' border='0'>短 信</a></td>"
   if SmsStatus=0 then WSOASCOMSTR=WSOASCOMSTR&"<td width='70' align='center'></td>"
   '<td width='70' align='center'><a href=""javascript:HrefTarget('查看邮件','HXPersonalOffice/MyMessage.asp')""><img src='hximages/websms/change.gif' align='absmiddle' border='0'>邮 件</a></td>
   WSOASCOMSTR=WSOASCOMSTR&"<td width='70' align='center'><a href='javascript:' onclick=""showModalDialog('../HXINCLUDE/Calculator.htm','','dialogWidth:21em; dialogHeight:13em; status:0;help:0')""><img src='hximages/Calculator/Calculator.gif' align='absmiddle' border='0'>计算器</a></td><td width='30' align='center'></td><td title='更改状态'>您的登录身份："
   Call WS_S.HX_OutUserInfo(LOGINUID):WSOASCOMSTR=WSOASCOMSTR&Outdepartment&OutAppointment&"["&outName&"]"
   WSOASCOMSTR=WSOASCOMSTR&"　<font id='WSOAS' onclick=""openwin(320,160,'"&config&"');"" style='cursor:hand'></font></td></tr></table></td></tr></table><iframe src='../HXINCLUDE/refresh.asp' width='800' marginwidth='0' height='0' marginheight='0' scrolling='no' hspace='0' vspace='0'></iframe>"
   RESPONSE.WRITE WSOASCOMSTR
End Sub

'下边框菜单
   Sub HX_Register()
	   action=request("action")
	   response.write "<head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>软件注册</title><link rel=stylesheet type=text/css href='../../HXINCLUDE/HX_Css.css'></head><body topmargin='2' leftmargin='0' bottommargin='2' oncontextmenu='event.returnValue=false'>"
	   if action="saveinfo" then WS_S.HX_Reg
		response.write "<script language='JavaScript'>function amsub(form){if (form.msg.value==''){ alert('请填写注册码!');  form.msg.focus();  return false;}return true;}</script><table cellpadding='2' cellspacing='1' border='0' class='border' align=center><tr><td class='title' colspan=2>软件注册</td></tr><form name='form1' method='post' action='' onSubmit='return amsub(this);' target='_self'><tr class=titletdbg><td width='25%' align='right'>注册码：</td><td width='75%'><textarea name='msg' id=tt cols='30' rows='6'></textarea></td></tr><tr class=titletdbg><td align='right'>&nbsp;</td><td><input type=""button"" class=button value="" 粘 贴 "" onclick=""javascript:tt.select();document.execCommand('paste');"">　<input type='submit' class='button' name='Submit' value=' 注 册 '> <input type='reset' class='button' name='Submit2' value=' 重 置 '> <input type='hidden' name='action' value='saveinfo'></td></tr></form></table>"
   End Sub
   
'下边框菜单
   Sub HX_MemberPrivManage()
       DeskMyarr=trim(request("01")):Officearr=trim(request("02")):PersonalOfficearr=trim(request("03")):EngineeringManagearr=trim(request("04")):Bargainarr=trim(request("05")):WorkFlowarr=trim(request("06")):Manpowerarr=trim(request("07")):InfoChangearr=trim(request("08")):AnnexProgramarr=trim(request("09")):SystemSetarr=trim(request("10")):LogisticsManagementArr=trim(request("11")):StudentsManageArr=trim(request("12")):BuildManageArr=trim(request("13"))
       if instr(DeskMyarr,"DeskMyoffice")>0 then rs("WS_DeskMyoffice")=1 else rs("WS_DeskMyoffice")=0 end if
	   if instr(DeskMyarr,"DeskMyWORKFLOW")>0 then rs("WS_DeskMyWORKFLOW")=1 else rs("WS_DeskMyWORKFLOW")=0 end if
	   if instr(DeskMyarr,"DeskMyAdministration")>0 then rs("WS_DeskMyAdministration")=1 else rs("WS_DeskMyAdministration")=0 end if
	   if instr(DeskMyarr,"DeskMyManpowerResource")>0 then rs("WS_DeskMyManpowerResource")=1 else rs("WS_DeskMyManpowerResource")=0 end if
	   if instr(DeskMyarr,"DeskMobileGroup")>0 then rs("WS_DeskMobileGroup")=1 else rs("WS_DeskMobileGroup")=0 end if
	   if instr(DeskMyarr,"MobileManage")>0 then rs("WS_MobileManage")=1 else rs("WS_MobileManage")=0 end if
	   if instr(DeskMyarr,"MobileSend")>0 then rs("WS_MobileSend")=1 else rs("WS_MobileSend")=0 end if
	   if instr(DeskMyarr,"DeskMyInfoChange")>0 then rs("WS_DeskMyInfoChange")=1 else rs("WS_DeskMyInfoChange")=0 end if
	   if instr(DeskMyarr,"DeskTaskManage")>0 then rs("WS_DeskTaskManage")=1 else rs("WS_DeskTaskManage")=0 end if
	   if instr(DeskMyarr,"DeskNewTaskManage")>0 then rs("WS_DeskNewTaskManage")=1 else rs("WS_DeskNewTaskManage")=0 end if
	   
       if instr(trim(request("MENU_02")),"Administration")>0 then rs("WS_Administration")=1 else rs("WS_Administration")=0 end if
	   if instr(Officearr,"AdministrationOfficeView")>0 then rs("WS_AdministrationOfficeView")=1 else rs("WS_AdministrationOfficeView")=0 end if
       if instr(Officearr,"AdministrationOfficeEdit")>0 then rs("WS_AdministrationOfficeEdit")=1 else rs("WS_AdministrationOfficeEdit")=0 end if
       if instr(Officearr,"AdministrationOfficeAdd")>0 then rs("WS_AdministrationOfficeAdd")=1 else rs("WS_AdministrationOfficeAdd")=0 end if
       if instr(Officearr,"AdministrationOfficeDel")>0 then rs("WS_AdministrationOfficeDel")=1 else rs("WS_AdministrationOfficeDel")=0 end if
       if instr(Officearr,"AdministrationDocumentView")>0 then rs("WS_AdministrationDocumentView")=1 else rs("WS_AdministrationDocumentView")=0 end if
       if instr(Officearr,"AdministrationDocumentEdit")>0 then rs("WS_AdministrationDocumentEdit")=1 else rs("WS_AdministrationDocumentEdit")=0 end if
       if instr(Officearr,"AdministrationDocumentAdd")>0 then rs("WS_AdministrationDocumentAdd")=1 else rs("WS_AdministrationDocumentAdd")=0 end if
       if instr(Officearr,"AdministrationDocumentDel")>0 then rs("WS_AdministrationDocumentDel")=1 else rs("WS_AdministrationDocumentDel")=0 end if
       if instr(Officearr,"AdministrationDocumentTypeMange")>0 then rs("WS_AdministrationDocumentTypeMange")=1 else rs("WS_AdministrationDocumentTypeMange")=0 end if
       if instr(Officearr,"AdministrationBookView")>0 then rs("WS_AdministrationBookView")=1 else rs("WS_AdministrationBookView")=0 end if
       if instr(Officearr,"AdministrationBookAdd")>0 then rs("WS_AdministrationBookAdd")=1 else rs("WS_AdministrationBookAdd")=0 end if
	   if instr(Officearr,"AdministrationBookManage")>0 then rs("WS_AdministrationBookManage")=1 else rs("WS_AdministrationBookManage")=0 end if
	   if instr(Officearr,"AdministrationCarManage")>0 then rs("WS_AdministrationCarManage")=1 else rs("WS_AdministrationCarManage")=0 end if
	   if instr(Officearr,"AdministrationCarApply")>0 then rs("WS_AdministrationCarApply")=1 else rs("WS_AdministrationCarApply")=0 end if
	   if instr(Officearr,"AdministrationCarView")>0 then rs("WS_AdministrationCarView")=1 else rs("WS_AdministrationCarView")=0 end if
	   if instr(Officearr,"AdministrationCarModify")>0 then rs("WS_AdministrationCarModify")=1 else rs("WS_AdministrationCarModify")=0 end if
       if instr(Officearr,"AdministrationMeetingManage")>0 then rs("WS_AdministrationMeetingManage")=1 else rs("WS_AdministrationMeetingManage")=0 end if
	   if instr(Officearr,"AdministrationMeetingApply")>0 then rs("WS_AdministrationMeetingApply")=1 else rs("WS_AdministrationMeetingApply")=0 end if
	   if instr(Officearr,"AdministrationMeetingView")>0 then rs("WS_AdministrationMeetingView")=1 else rs("WS_AdministrationMeetingView")=0 end if
	   if instr(Officearr,"AdministrationMeetingModify")>0 then rs("WS_AdministrationMeetingModify")=1 else rs("WS_AdministrationMeetingModify")=0 end if
       if instr(Officearr,"AdministrationPropertyManage")>0 then rs("WS_AdministrationPropertyManage")=1 else rs("WS_AdministrationPropertyManage")=0 end if
	   if instr(Officearr,"AdministrationPropertySearch")>0 then rs("WS_AdministrationPropertySearch")=1 else rs("WS_AdministrationPropertySearch")=0 end if
	   if instr(Officearr,"AdministrationPropertyView")>0 then rs("WS_AdministrationPropertyView")=1 else rs("WS_AdministrationPropertyView")=0 end if
	   if instr(Officearr,"AdministrationPropertyModify")>0 then rs("WS_AdministrationPropertyModify")=1 else rs("WS_AdministrationPropertyModify")=0 end if
	   if instr(trim(request("MENU_03")),"PersonalOffice")>0 then rs("WS_PersonalOffice")=1 else rs("WS_PersonalOffice")=0 end if
	   if instr(PersonalOfficearr,"PersonalOfficeMessage")>0 then rs("WS_PersonalOfficeMessage")=1 else rs("WS_PersonalOfficeMessage")=0 end if
	   if instr(PersonalOfficearr,"PersonalOfficeInternetEmail")>0 then rs("WS_PersonalOfficeInternetEmail")=1 else rs("WS_PersonalOfficeInternetEmail")=0 end if
	   if instr(PersonalOfficearr,"PersonalOfficeSchEdule")>0 then rs("WS_PersonalOfficeSchEdule")=1 else rs("WS_PersonalOfficeSchEdule")=0 end if
	   if instr(PersonalOfficearr,"PersonalOfficePDA")>0 then rs("WS_PersonalOfficePDA")=1 else rs("WS_PersonalOfficePDA")=0 end if
	   if instr(PersonalOfficearr,"PersonalOfficeDocument")>0 then rs("WS_PersonalOfficeDocument")=1 else rs("WS_PersonalOfficeDocument")=0 end if
	   
   
	   if instr(trim(request("MENU_11")),"LogisticsManagement")>0 then rs("WS_LogisticsManagement")=1 else rs("WS_LogisticsManagement")=0 end if
	   if instr(LogisticsManagementarr,"NewProduceLists")>0 then rs("WS_NewProduceLists")=1 else rs("WS_NewProduceLists")=0 end if
	   if instr(LogisticsManagementarr,"InvestigationsSearchs")>0 then rs("WS_InvestigationsSearchs")=1 else rs("WS_InvestigationsSearchs")=0 end if
	   if instr(LogisticsManagementarr,"NewProduceListManage")>0 then rs("WS_NewProduceListManage")=1 else rs("WS_NewProduceListManage")=0 end if
	   if instr(LogisticsManagementarr,"InvestigationsSearchManage")>0 then rs("WS_InvestigationsSearchManage")=1 else rs("WS_InvestigationsSearchManage")=0 end if     
	   
	   

	   if instr(trim(request("MENU_04")),"EngineeringManage")>0 then rs("WS_EngineeringManage")=1 else rs("WS_EngineeringManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomInfo")>0 then rs("WS_EngineeringManageCustomInfo")=1 else rs("WS_EngineeringManageCustomInfo")=0 end if
	   if instr(EngineeringManagearr,"FinancialStatusInfo")>0 then rs("WS_FinancialStatusInfo")=1 else rs("WS_FinancialStatusInfo")=0 end if
	   if instr(EngineeringManagearr,"FinancialStatusManage")>0 then rs("WS_FinancialStatusManage")=1 else rs("WS_FinancialStatusManage")=0 end if
	   if instr(EngineeringManagearr,"FinancialStatusView")>0 then rs("WS_FinancialStatusView")=1 else rs("WS_FinancialStatusView")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomRank")>0 then rs("WS_EngineeringManageCustomRank")=1 else rs("WS_EngineeringManageCustomRank")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomContactManage")>0 then rs("WS_EngineeringManageCustomContactManage")=1 else rs("WS_EngineeringManageCustomContactManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomInfoManage")>0 then rs("WS_EngineeringManageCustomInfoManage")=1 else rs("WS_EngineeringManageCustomInfoManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomConnectManage")>0 then rs("WS_EngineeringManageCustomConnectManage")=1 else rs("WS_EngineeringManageCustomConnectManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageCustomSearch")>0 then rs("WS_EngineeringManageCustomSearch")=1 else rs("WS_EngineeringManageCustomSearch")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageProduct")>0 then rs("WS_EngineeringManageProduct")=1 else rs("WS_EngineeringManageProduct")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageProductManage")>0 then rs("WS_EngineeringManageProductManage")=1 else rs("WS_EngineeringManageProductManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageProductSearch")>0 then rs("WS_EngineeringManageProductSearch")=1 else rs("WS_EngineeringManageProductSearch")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageProductEngineeringRecord")>0 then rs("WS_EngineeringManageProductEngineeringRecord")=1 else rs("WS_EngineeringManageProductEngineeringRecord")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageShopManage")>0 then rs("WS_EngineeringManageShopManage")=1 else rs("WS_EngineeringManageShopManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageEngineeringShopManage")>0 then rs("WS_EngineeringManageEngineeringShopManage")=1 else rs("WS_EngineeringManageEngineeringShopManage")=0 end if
	   if instr(EngineeringManagearr,"EngineeringManageEngineeringShopSearch")>0 then rs("WS_EngineeringManageEngineeringShopSearch")=1 else rs("WS_EngineeringManageEngineeringShopSearch")=0 end if
       if instr(trim(request("MENU_05")),"Bargain")>0 then rs("WS_Bargain")=1 else rs("WS_Bargain")=0 end if
	   if instr(Bargainarr,"Bargaintype")>0 then rs("WS_Bargaintype")=1 else rs("WS_Bargaintype")=0 end if
	   if instr(Bargainarr,"BargainAdd")>0 then rs("WS_Bargainadd")=1 else rs("WS_Bargainadd")=0 end if
	   if instr(Bargainarr,"Bargainmanage")>0 then rs("WS_Bargainmanage")=1 else rs("WS_Bargainmanage")=0 end if
       if instr(trim(request("MENU_06")),"WORKFLOW")>0 then rs("WS_WORKFLOW")=1 else rs("WS_WORKFLOW")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWWaitList")>0 then rs("WS_WORKFLOWWaitList")=1 else rs("WS_WORKFLOWWaitList")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWIndex")>0 then rs("WS_WORKFLOWIndex")=1 else rs("WS_WORKFLOWIndex")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWNews")>0 then rs("WS_WORKFLOWNews")=1 else rs("WS_WORKFLOWNews")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWAdd")>0 then rs("WS_WORKFLOWAdd")=1 else rs("WS_WORKFLOWAdd")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWNewNiBan")>0 then rs("WS_WORKFLOWNewNiBan")=1 else rs("WS_WORKFLOWNewNiBan")=0 end if
	   if instr(WorkFlowarr,"WORKFLOWSearch")>0 then rs("WS_WORKFLOWSearch")=1 else rs("WS_WORKFLOWSearch")=0 end if
	   if instr(trim(request("MENU_07")),"ManpowerResource")>0 then rs("WS_ManpowerResource")=1 else rs("WS_ManpowerResource")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceView")>0 then rs("WS_ManpowerResourceView")=1 else rs("WS_ManpowerResourceView")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceSearch")>0 then rs("WS_ManpowerResourceSearch")=1 else rs("WS_ManpowerResourceSearch")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceUserManage")>0 then rs("WS_ManpowerResourceUserManage")=1 else rs("WS_ManpowerResourceUserManage")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceWageMonth")>0 then rs("WS_ManpowerResourceWageMonth")=1 else rs("WS_ManpowerResourceWageMonth")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceWageMonthView")>0 then rs("WS_ManpowerResourceWageMonthView")=1 else rs("WS_ManpowerResourceWageMonthView")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceWageMonthAdd")>0 then rs("WS_ManpowerResourceWageMonthAdd")=1 else rs("WS_ManpowerResourceWageMonthAdd")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceWageMonthEdit")>0 then rs("WS_ManpowerResourceWageMonthEdit")=1 else rs("WS_ManpowerResourceWageMonthEdit")=0 end if
	   if instr(Manpowerarr,"ManpowerResourceConfirm")>0 then rs("WS_ManpowerResourceConfirm")=1 else rs("WS_ManpowerResourceConfirm")=0 end if
	   if instr(Manpowerarr,"AttendanceSearch")>0 then rs("WS_AttendanceSearch")=1 else rs("WS_AttendanceSearch")=0 end if
	   if instr(Manpowerarr,"AttendanceCount")>0 then rs("WS_AttendanceCount")=1 else rs("WS_AttendanceCount")=0 end if
	   if instr(trim(request("MENU_08")),"InfoChange")>0 then rs("WS_InfoChange")=1 else rs("WS_InfoChange")=0 end if
	   if instr(InfoChangearr,"InfoChangeTalkEAR")>0 then rs("WS_InfoChangeTalkEAR")=1 else rs("WS_InfoChangeTalkEAR")=0 end if
	   if instr(InfoChangearr,"InfoChangeNetChat")>0 then rs("WS_InfoChangeNetChat")=1 else rs("WS_InfoChangeNetChat")=0 end if
	   if instr(InfoChangearr,"InfoChangeNetChatFlag")>0 then rs("WS_InfoChangeNetChatFlag")=1 else rs("WS_InfoChangeNetChatFlag")=0 end if
	   if instr(InfoChangearr,"InfoChangeNetDisk")>0 then rs("WS_InfoChangeNetDisk")=1 else rs("WS_InfoChangeNetDisk")=0 end if
	   if instr(InfoChangearr,"InfoChangeNetVoteInfo")>0 then rs("WS_InfoChangeNetVoteInfo")=1 else rs("WS_InfoChangeNetVoteInfo")=0 end if
	   if instr(trim(request("MENU_09")),"AnnexProgram")>0 then rs("WS_AnnexProgram")=1 else rs("WS_AnnexProgram")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramCalendar")>0 then rs("WS_AnnexProgramCalendar")=1 else rs("WS_AnnexProgramCalendar")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramworldtime")>0 then rs("WS_AnnexProgramworldtime")=1 else rs("WS_AnnexProgramworldtime")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramnetipsearch")>0 then rs("WS_AnnexProgramnetipsearch")=1 else rs("WS_AnnexProgramnetipsearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgrammobilesearch")>0 then rs("WS_AnnexProgrammobilesearch")=1 else rs("WS_AnnexProgrammobilesearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramlawrulesearch")>0 then rs("WS_AnnexProgramlawrulesearch")=1 else rs("WS_AnnexProgramlawrulesearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramtelsearch")>0 then rs("WS_AnnexProgramtelsearch")=1 else rs("WS_AnnexProgramtelsearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgramweburlsearch")>0 then rs("WS_AnnexProgramweburlsearch")=1 else rs("WS_AnnexProgramweburlsearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgrampostcardsearch")>0 then rs("WS_AnnexProgrampostcardsearch")=1 else rs("WS_AnnexProgrampostcardsearch")=0 end if
	   if instr(AnnexProgramarr,"AnnexProgrampostcodesearch")>0 then rs("WS_AnnexProgrampostcodesearch")=1 else rs("WS_AnnexProgrampostcodesearch")=0 end if
	   if instr(trim(request("MENU_10")),"SystemSet")>0 then rs("WS_SystemSet")=1 else rs("WS_SystemSet")=0 end if
	   if instr(SystemSetarr,"SystemSetWebOAconfig")>0 then rs("WS_SystemSetWebOAconfig")=1 else rs("WS_SystemSetWebOAconfig")=0 end if
	   if instr(SystemSetarr,"SystemSetOAInterFaceSet")>0 then rs("WS_SystemSetOAInterFaceSet")=1 else rs("WS_SystemSetOAInterFaceSet")=0 end if
	   if instr(SystemSetarr,"SystemSetModule")>0 then rs("WS_SystemSetModule")=1 else rs("WS_SystemSetModule")=0 end if
	   if instr(SystemSetarr,"SystemSetDepartment")>0 then rs("WS_SystemSetDepartment")=1 else rs("WS_SystemSetDepartment")=0 end if
	   if instr(SystemSetarr,"SystemSetAppointment")>0 then rs("WS_SystemSetAppointment")=1 else rs("WS_SystemSetAppointment")=0 end if
	   if instr(SystemSetarr,"SystemSetMemberPriv")>0 then rs("WS_SystemSetMemberPriv")=1 else rs("WS_SystemSetMemberPriv")=0 end if
	   if instr(SystemSetarr,"SystemSetAttendanceSet")>0 then rs("WS_SystemSetAttendanceSet")=1 else rs("WS_SystemSetAttendanceSet")=0 end if
	   if instr(SystemSetarr,"SystemSettalkear")>0 then rs("WS_SystemSettalkear")=1 else rs("WS_SystemSettalkear")=0 end if
	   if instr(SystemSetarr,"StockEar")>0 then rs("WS_StockEar")=1 else rs("WS_StockEar")=0 end if
	   if instr(SystemSetarr,"TaskClassManage")>0 then rs("WS_TaskClassManage")=1 else rs("WS_TaskClassManage")=0 end if	   
	   if instr(SystemSetarr,"StockCategory")>0 then rs("WS_StockCategory")=1 else rs("WS_StockCategory")=0 end if
	   if instr(SystemSetarr,"SystemSetNotifyManage")>0 then rs("WS_SystemSetNotifyManage")=1 else rs("WS_SystemSetNotifyManage")=0 end if
	   if instr(SystemSetarr,"SystemSetWorkFlowType")>0 then rs("WS_SystemSetWorkFlowType")=1 else rs("WS_SystemSetWorkFlowType")=0 end if
	   if instr(SystemSetarr,"SystemSetnetvoteinfo")>0 then rs("WS_SystemSetnetvoteinfo")=1 else rs("WS_SystemSetnetvoteinfo")=0 end if
	   if instr(SystemSetarr,"SystemSetlawrule")>0 then rs("WS_SystemSetlawrule")=1 else rs("WS_SystemSetlawrule")=0 end if
	   if instr(SystemSetarr,"SystemSettel")>0 then rs("WS_SystemSettel")=1 else rs("WS_SystemSettel")=0 end if
	   if instr(SystemSetarr,"SystemSetweburl")>0 then rs("WS_SystemSetweburl")=1 else rs("WS_SystemSetweburl")=0 end if
	   if instr(SystemSetarr,"SystemSetInterviewControl")>0 then rs("WS_SystemSetInterviewControl")=1 else rs("WS_SystemSetInterviewControl")=0 end if
	   if instr(SystemSetarr,"SystemSetOperation")>0 then rs("WS_SystemSetOperation")=1 else rs("WS_SystemSetOperation")=0 end if
	   if instr(SystemSetarr,"SystemSetWSOADATABASEMANAGE")>0 then rs("WS_SystemSetWSOADATABASEMANAGE")=1 else rs("WS_SystemSetWSOADATABASEMANAGE")=0 end if
	   if instr(SystemSetarr,"SystemSetWSOASSkinManage")>0 then rs("WS_SystemSetWSOASSkinManage")=1 else rs("WS_SystemSetWSOASSkinManage")=0 end if
	   if instr(SystemSetarr,"SystemSetWSOASSystemRegister")>0 then rs("WS_SystemSetWSOASSystemRegister")=1 else rs("WS_SystemSetWSOASSystemRegister")=0 end if
	   if instr(SystemSetarr,"NotifyClassManage")>0 then rs("WS_NotifyClassManage")=1 else rs("WS_NotifyClassManage")=0 end if
	   rs.update:WS_S.HX_Redirect "MemberPrivManage.asp?MPID="&MPID
   End Sub

'下边框菜单
	 Sub HX_BargainType()
	 
     ColumnName="":Tablename="HX_bargaintype":action=request("action"):WS_Tid=request("WS_Tid")
     if WS_Tid<>"" and isnumeric(WS_Tid) then Orderby=" where WS_Tid="&WS_Tid else Orderby=" ORDER BY WS_OrderBy ASC" end if
     set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
     WS_bargaintypename=WS_S.HX_Replace(request.form("WS_bargaintypename")):WS_OrderBy=WS_S.HX_Replace(request.form("WS_OrderBy"))
     if WS_OrderBy="" then WS_OrderBy=1
     select case action
       case "addsaveinfo"      
       WS_S.HX_Isnull "类别名称不能为空",WS_bargaintypename
       set SERS=WS_S.HX_SetRSD(ColumnName,Tablename," where WS_bargaintypename='"&WS_bargaintypename&"'")	 
	   If SERS.recordcount>0 then
	   HX_GoBack "添加失败:\n此类别已存在!",""
	   End If
	   Call WS_S.HX_RSClose(SERS)  
       msg="“"&WS_bargaintypename&"”类别添加成功!"
       rs.addnew    
       rs("WS_bargaintypename")=WS_bargaintypename
       rs("WS_OrderBy")=WS_OrderBy
       rs.update
	   Call WS_S.SaveAdminLog(LOGINUSERNAME,LogAppointment,msg)
       HX_GoBack msg,"bargaintype.asp"
   case "editsaveinfo"
       WS_S.HX_Isnull "类别名称不能为空",WS_bargaintypename
       set SERS=WS_S.HX_SetRSD(ColumnName,Tablename," where WS_bargaintypename='"&WS_bargaintypename&"' and WS_Tid<>"&WS_Tid)	 
	   If SERS.recordcount>0 then
	   HX_GoBack "修改失败:\n此类别已存在!",""
	   End If
       msg="“"&rs("WS_bargaintypename")&"”类别修改成功!"
	   rs("WS_bargaintypename")=WS_bargaintypename:rs("WS_OrderBy")=WS_OrderBy:rs.update
	    call WS_S.SaveAdminLog(LOGINUSERNAME,LogAppointment,msg)
        HX_GoBack msg,"bargaintype.asp"
    case "del"
        msg="“"&rs("WS_bargaintypename")&"”类别删除成功"
        conn.execute("delete from HX_bargaintype where WS_Tid="&WS_Tid)	
	    call WS_S.SaveAdminLog(LOGINUSERNAME,LogAppointment,msg) 
	   HX_GoBack msg,"bargaintype.asp"  
    end select
    End Sub
  Sub HX_BargainManage() 
      
      action=request("action"):WS_Uid=request("WS_Uid"):WS_id=request("WS_id"):DESCORASC=request("DESCORASC"):ColumnName="":Tablename="HX_compactinfo":Orderby=""
      if WS_Uid<>"" and isnumeric(WS_Uid) then  Orderby=" where WS_Uid="&WS_Uid
      if WS_id<>"" and isnumeric(WS_id) then  Orderby=" where WS_id="&WS_id
      if DESCORASC<>"" then  Orderby=" order by "&DESCORASC
      set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
      if action="editcompactsave" then
      rs("WS_statetime")=request("byys")&"-"&request("bmms")&"-"&request("bdds"):rs("WS_overtime")=request("byyo")&"-"&request("bmmo")&"-"&request("bddo"):rs("WS_register")=request("byy")&"-"&request("bmm")&"-"&request("bdd"):rs("WS_state")=request("WS_state"):rs("WS_brief")=request("WS_brief"):rs("WS_notice")=request("WS_notice"):rs("WS_Annex")=request("WS_Annex"):rs("WS_Uid")=WS_Uid:rs.update
      response.redirect "bargainmanage.asp":response.end
      elseif action="del" then
       conn.execute("delete from HX_compactinfo where WS_id="&WS_id)
        response.redirect "bargainmanage.asp"
        response.end
      end if
   End Sub
   Sub HX_BargainAdd()
   
     action=request("action"):WS_Uid=request("WS_Uid"):ColumnName="":Tablename="HX_compactinfo":Orderby=""
     set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
     if action="addcompact" then
      if (WS_Uid<>"" and not isnumeric(WS_Uid)) or WS_Uid="" or isnull(WS_Uid) then  HX_GoBack "参数错误",""
       rs.addnew:rs("WS_statetime")=request("byys")&"-"&request("bmms")&"-"&request("bdds"):rs("WS_overtime")=request("byyo")&"-"&request("bmmo")&"-"&request("bddo"):rs("WS_register")=request("byy")&"-"&request("bmm")&"-"&request("bdd"):rs("WS_state")=request("WS_state"):rs("WS_brief")=request("WS_brief"):rs("WS_notice")=request("WS_notice"):rs("WS_Annex")=request("WS_Annex"):rs("WS_Uid")=WS_Uid:rs.update 
       HX_GoBack "录入成功！","bargainmanage.asp"
     end if
   End Sub
	 Sub HX_ChangUserSet()
	    action=request("action"):ColumnName="":Tablename="HX_CompanyUser"
        Orderby=" where WS_Uid="&loginuid
        set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
        if action="saveinfo" then    
			if rs("WS_PassWord")<>MD5(request.form("Oldpassword")) then
				 msg="旧密码错误！"
			else	
				 msg="设置成功！"
				 if request.form("password")<>"" and request.form("repassword")<>"" then
				   rs("WS_password")=MD5(request.form("password")) 
				   if MD5(request.form("Oldpassword"))<>MD5(request.form("password")) then msg=msg&"\n密码已更改需重新登录！" else msg=msg&"\n密码未更改无需重新登录！"
				 end if
				 rs("WS_Question")=request("WS_Question")
				 if request("WS_Answer")<>"" then 
				  if rs("WS_Answer")=MD5(request("WS_Answer")) then msg=msg&"\n问题答案没有做任何改动！" else msg=msg&"\n问题答案已修改，请牢记！"
				  rs("WS_Answer")=MD5(request("WS_Answer"))
				 end if
				 rs("WS_EditorStype")=request("EditorStype")
				 rs("WS_mobile")=request("WS_mobile")
				 rs("WS_phone")=request("WS_phone")
				 rs("WS_address")=request("WS_address")
				 rs("WS_email")=request("WS_email")
				 rs("WS_oicq")=request("WS_oicq")
				 rs.update
			end if
			HX_GoBack msg,""
			WS_S.HX_RSClose rs
         response.write msg:response.end
       end if
       response.write "<head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>个人设置</title></head><body><br /><script language='JavaScript'>function amsub(form){if (form.OldPassword.value==''){ alert('请输入旧密码!');  form.OldPassword.focus();  return false;} if((form.password.value!='')||(form.repassword.value!='')) {if ((form.password.value=='')||(form.password.value!=form.repassword.value)){ alert('密码不能为空或二次密码不一致!');  form.repassword.focus(); return false;}} if(form.WS_mobile.value!='') {if(!CheckSinglePhone(form.WS_mobile.value)) { alert('输入的手机号码错误！'); form.WS_mobile.focus(); return false ; }return true;}} function CheckSinglePhone(Phone) { var reg=/^(1[0-9]{10})$/; return reg.test(Phone); }</script><table cellpadding='2' style='margin-left:10px' cellspacing='1' border='0' class='border' align=center><tr><td class='title' colspan=2>用户个人设置</td></tr><form name='form1' method='post' action='' onSubmit='return amsub(this);'><tr class=titletdbg><td width='45%' align='right'>用 户 名：</td><td><input name='WS_UserName' type='text' autocomplete=off value='"&LOGINUSERNAME&"' size=23 readonly></td></tr><tr class=titletdbg><td align='right'>旧 密 码：</td><td><input type='password' name='OldPassword' size=25></td></tr><tr class=titletdbg><td align='right'>密　　码：</td><td><input type='password' name='password' size=25></td></tr><tr class=titletdbg><td align='right'>确认密码：</td><td><input type='password' name='repassword' size=25></td></tr>"'<tr class=titletdbg><td align='right'>手机号码：</td><td><input type='text' name='WS_mobile' size=13 value='"&trim(rs("WS_mobile"))&"'></td></tr><tr class=titletdbg><td align='right'>电话号码：</td><td><input type='text' autocomplete=off name='WS_phone' maxlength='50' size='15' value='"&rs("WS_phone")&"'></td></tr><tr class=titletdbg><td align=right>现 住 址：</td><td colspan='2'><input type='text' autocomplete=off name='WS_address' maxlength='50' size='16' value='"&rs("WS_address")&"'></td></tr><tr class=titletdbg><td align=right>电子邮件：</td><td height='28' colspan='3'><input type='text' autocomplete=off name='WS_email' maxlength='50' size='16' value='"&rs("WS_email")&"' ></td></tr><tr class=titletdbg><td align=right>Oicq：</td><td height='28' colspan='2'><input type='text' autocomplete=off name='WS_oicq' maxlength='12' size='8' value='"&rs("WS_oicq")&"'></td></tr><tr class=titletdbg><td align='right'>密码问题：</td><td><input type='text' name='WS_Question' size=30 value='"&rs("WS_Question")&"'></td></tr><tr class=titletdbg><td align='right'>问题答案：</td><td><input type='text' name='WS_Answer' size=30> <font color=red>*为空不修改</font></td></tr><tr class=titletdbg><td align='right'>编 辑 器：</td><td><select name='EditorStype'>"
	   'EditorStype=WS_S.EditorStypeFunction
	   'response.write "<option value='HtmlEditor'"
	   'if EditorStype="HtmlEditor" then response.write " Selected"
	   'response.write ">HtmlEditor</option><option value='eWebEditor'"
	   'if EditorStype="eWebEditor" then response.write " Selected"
	   'response.write ">eWebEditor</option></select></td>"
	   response.write"</tr><tr class=titletdbg><td align='right'>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 确定修改 '> <input type='reset' class='button' name='Submit2' value=' 重 置 '> <input type='hidden' name='action' value='saveinfo'></td></tr></form></table>"
	   WS_S.HX_RSClose rs
	 End Sub
	 
	 Sub HX_WSOASSMSSEND()	   
	    action=request("action")
        response.write "<head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>手机短信</title><link rel=stylesheet type=text/css href='../HXINCLUDE/HX_Css.css'></head><body><br />"
        if action="saveinfo" then WS_S.HX_WSOASSMSSEND
	    response.write "<script language='JavaScript'>function amsub(form){if (form.send_no.value==''){ alert('您要发给谁!'); return false;}if (form.msg.value==''){ alert('请填写短信内容!');  form.msg.focus();  return false;}return true;}</script><table cellpadding='2' cellspacing='1' border='0' class='border' align=center style='margin-left:10px'><tr class=title><td colspan=2>手机短信</td></tr><form name='form1' method='post' action='' onSubmit='return amsub(this);'><tr class=titletdbg><td width='25%' align='right'>接受人：</td><td width='75%'><input type='text' name='send_no' value='' style='display:none'><textarea cols=40 name=TO_NAME rows=3 wrap='yes' readonly></textarea>&nbsp;<input type='button' value='添 加' class='button' onClick='LoadWindow()' title='添加接受人' name='button'>&nbsp;<input type='button' value='清 空' class='button' onClick='clear_user()' title='清空接受人' name='button'></td></tr><tr class=titletdbg><td align='right'>定时发送时间：</td><td><input type='text' autocomplete=off  name='Timer' size='19' maxlength='19' value=''> <img src='HXIMAGES/calendar.gif' border='0' style='cursor:hand' onclick=""popUpcalendar(this, form1.Timer, 'yyyy-mm-dd');"" align=absmiddle> <img src='HXIMAGES/clock.gif' align=absmiddle border='0' style='cursor:hand' onclick=""td_clock('form1.Timer');""></td></tr><tr class=titletdbg><td align='right'>短信内容：</td><td><textarea name='msg' cols='60' rows='6'></textarea></td></tr><tr class=titletdbg><td align='right'>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 确定发送 '> <input type='reset' class='button' name='Submit2' value=' 重 置 '> <input type='hidden' name='action' value='saveinfo'></td></tr><tr><td colspan=2  class=titletdbg><font color=red> * 定时发送时间不填写则立即发送！</font></td></tr></form></table>"
	 End Sub
	 	 
'下边框菜单
	 Sub HX_MemberAdd()	
	        rs("WS_name")=WS_s.HX_Replace(request.form("WS_name"))
			rs("WS_Appointment")=WS_s.HX_Replace(request.form("WS_Appointment"))
			rs("WS_native")=WS_s.HX_Replace(request.form("WS_native"))
			rs("WS_sex")=WS_s.HX_Replace(request.form("WS_sex"))
			rs("WS_born")=WS_s.HX_Replace(request.form("WS_byy"))&"-"&WS_s.HX_Replace(request.form("WS_bmm"))&"-"&WS_s.HX_Replace(request.form("WS_bdd"))
			rs("WS_folk")=WS_s.HX_Replace(request.form("WS_folk"))
			rs("WS_phone")=WS_s.HX_Replace(request.form("WS_phone"))
			rs("WS_polity")=WS_s.HX_Replace(request.form("WS_polity"))
			rs("WS_jobdate")=WS_s.HX_Replace(request.form("WS_wyy"))&"-"&WS_s.HX_Replace(request.form("WS_wmm"))&"-"&WS_s.HX_Replace(request.form("WS_wdd"))
			rs("WS_marry")=WS_s.HX_Replace(request.form("WS_marry"))
			rs("WS_address")=WS_s.HX_Replace(request.form("WS_address"))
			rs("WS_Duty")=WS_s.HX_Replace(request.form("Duty"))
			rs("WS_MPID")=WS_s.HX_Replace(request.form("MemberPriv"))
			rs("WS_code")=WS_s.HX_Replace(request.form("WS_code"))
			rs("WS_job")=WS_s.HX_Replace(request.form("WS_job"))
			rs("WS_diploma")=WS_s.HX_Replace(request.form("WS_diploma"))
			rs("WS_indentity")=WS_s.HX_Replace(request.form("WS_indentity"))
			rs("WS_department")=WS_s.HX_Replace(request.form("WS_department"))
			rs("WS_register")=WS_s.HX_Replace(request.form("WS_register"))
			rs("WS_title")=WS_s.HX_Replace(request.form("WS_title"))
			rs("WS_username")=WS_s.HX_Replace(request.form("WS_username"))
			if WS_s.HX_Replace(request.form("WS_password"))<>"" then rs("WS_password")=MD5(WS_s.HX_Replace(request.form("WS_password")))
			rs("WS_Appointment")=WS_s.HX_Replace(request.form("WS_Appointment"))
			rs("WS_email")=WS_s.HX_Replace(request.form("WS_email"))
			rs("WS_oicq")=WS_s.HX_Replace(request.form("WS_oicq"))
			rs("WS_college")=WS_s.HX_Replace(request.form("WS_college"))
			if isdate(WS_s.HX_Replace(request.form("WS_graduate_time"))) then rs("WS_graduate_time")=WS_s.HX_Replace(request.form("WS_graduate_time")) else HX_GoBack "毕业时间输入有误！",""
			rs("WS_major")=WS_s.HX_Replace(request.form("WS_major"))
			rs("WS_kincall1")=WS_s.HX_Replace(request.form("WS_kincall1"))
			rs("WS_kincall2")=WS_s.HX_Replace(request.form("WS_kincall2"))
			rs("WS_kinname1")=WS_s.HX_Replace(request.form("WS_kinname1"))
			rs("WS_kinname2")=WS_s.HX_Replace(request.form("WS_kinname2"))
			rs("WS_kin1")=WS_s.HX_Replace(request.form("WS_kin1"))
			rs("WS_kin2")=WS_s.HX_Replace(request.form("WS_kin2"))
			rs("WS_kindept1")=WS_s.HX_Replace(request.form("WS_kindept1"))
			rs("WS_kindept2")=WS_s.HX_Replace(request.form("WS_kindept2"))
			rs("WS_workname1")=WS_s.HX_Replace(request.form("WS_workname1"))
			rs("WS_workname2")=WS_s.HX_Replace(request.form("WS_workname2"))
			rs("WS_worktime1")=WS_s.HX_Replace(request.form("WS_worktime1"))
			rs("WS_worktime2")=WS_s.HX_Replace(request.form("WS_worktime2"))
			rs("WS_workdept1")=WS_s.HX_Replace(request.form("WS_workdept1"))
			rs("WS_workdept2")=WS_s.HX_Replace(request.form("WS_workdept2"))
			rs("WS_workduty1")=WS_s.HX_Replace(request.form("WS_workduty1"))
			rs("WS_workduty2")=WS_s.HX_Replace(request.form("WS_workduty2"))
			rs("WS_workman1")=WS_s.HX_Replace(request.form("WS_workman1"))
			rs("WS_workman2")=WS_s.HX_Replace(request.form("WS_workman2"))
			rs("WS_special")=WS_s.HX_Replace(request.form("WS_special"))
			rs("WS_talkman")=WS_s.HX_Replace(request.form("WS_talkman"))
			rs("WS_okman")=WS_s.HX_Replace(request.form("WS_okman"))
			rs("WS_height")=WS_s.HX_Replace(request.form("WS_height"))
			rs("WS_weight")=WS_s.HX_Replace(request.form("WS_weight"))
			rs("WS_zcnumber")=WS_s.HX_Replace(request.form("WS_zcnumber"))
			rs("WS_zippo")=WS_s.HX_Replace(request.form("WS_zippo"))
			rs("WS_jcry")=WS_s.HX_Replace(request.form("WS_jcry"))
			rs("WS_jjlxr")=WS_s.HX_Replace(request.form("WS_jjlxr"))
			rs("WS_selfgx")=WS_s.HX_Replace(request.form("WS_selfgx"))
			rs("WS_phone1")=WS_s.HX_Replace(request.form("WS_phone1"))
			rs("WS_mobile1")=WS_s.HX_Replace(request.form("WS_mobile1"))
			rs("WS_mobile")=" "
			rs("WS_xphone1")=WS_s.HX_Replace(request.form("WS_xphone1"))
			rs("WS_xphone2")=WS_s.HX_Replace(request.form("WS_xphone2"))
			rs("WS_time1")=WS_s.HX_Replace(request.form("WS_time1"))
			rs("WS_time2")=WS_s.HX_Replace(request.form("WS_time2"))
			rs("WS_time3")=WS_s.HX_Replace(request.form("WS_time3"))
			rs("WS_time4")=WS_s.HX_Replace(request.form("WS_time4"))
			rs("WS_time5")=WS_s.HX_Replace(request.form("WS_time5"))
			rs("WS_time6")=WS_s.HX_Replace(request.form("WS_time6"))
			rs("WS_time7")=WS_s.HX_Replace(request.form("WS_time7"))
			rs("WS_time8")=WS_s.HX_Replace(request.form("WS_time8"))
			rs("WS_collegename1")=WS_s.HX_Replace(request.form("WS_collegename1"))
			rs("WS_collegename2")=WS_s.HX_Replace(request.form("WS_collegename2"))
			rs("WS_collegename3")=WS_s.HX_Replace(request.form("WS_collegename3"))
			rs("WS_collegename4")=WS_s.HX_Replace(request.form("WS_collegename4"))
			rs("WS_collegename5")=WS_s.HX_Replace(request.form("WS_collegename5"))
			rs("WS_collegename6")=WS_s.HX_Replace(request.form("WS_collegename6"))
			rs("WS_collegename7")=WS_s.HX_Replace(request.form("WS_collegename7"))
			rs("WS_collegename8")=WS_s.HX_Replace(request.form("WS_collegename8"))
			rs("WS_spname1")=WS_s.HX_Replace(request.form("WS_spname1"))
			rs("WS_spname2")=WS_s.HX_Replace(request.form("WS_spname2"))
			rs("WS_spname3")=WS_s.HX_Replace(request.form("WS_spname3"))
			rs("WS_spname4")=WS_s.HX_Replace(request.form("WS_spname4"))
			rs("WS_spname5")=WS_s.HX_Replace(request.form("WS_spname5"))
			rs("WS_spname6")=WS_s.HX_Replace(request.form("WS_spname6"))
			rs("WS_spname7")=WS_s.HX_Replace(request.form("WS_spname7"))
			rs("WS_spname8")=WS_s.HX_Replace(request.form("WS_spname8"))
			rs("WS_xw1")=WS_s.HX_Replace(request.form("WS_xw1"))
			rs("WS_xw2")=WS_s.HX_Replace(request.form("WS_xw2"))
			rs("WS_xw3")=WS_s.HX_Replace(request.form("WS_xw3"))
			rs("WS_xw4")=WS_s.HX_Replace(request.form("WS_xw4"))
			rs("WS_xw5")=WS_s.HX_Replace(request.form("WS_xw5"))
			rs("WS_xw6")=WS_s.HX_Replace(request.form("WS_xw6"))
			rs("WS_xw7")=WS_s.HX_Replace(request.form("WS_xw7"))
			rs("WS_xw8")=WS_s.HX_Replace(request.form("WS_xw8"))
			rs("WS_worktime3")=WS_s.HX_Replace(request.form("WS_worktime3"))
			rs("WS_worktime4")=WS_s.HX_Replace(request.form("WS_worktime4"))
			rs("WS_worktime5")=WS_s.HX_Replace(request.form("WS_worktime5"))
			rs("WS_workdept3")=WS_s.HX_Replace(request.form("WS_workdept3"))
			rs("WS_workdept4")=WS_s.HX_Replace(request.form("WS_workdept4"))
			rs("WS_workdept5")=WS_s.HX_Replace(request.form("WS_workdept5"))
			rs("WS_workduty3")=WS_s.HX_Replace(request.form("WS_workduty3"))
			rs("WS_workduty4")=WS_s.HX_Replace(request.form("WS_workduty4"))
			rs("WS_workduty5")=WS_s.HX_Replace(request.form("WS_workduty5"))
			rs("WS_workman3")=WS_s.HX_Replace(request.form("WS_workman3"))
			rs("WS_workman4")=WS_s.HX_Replace(request.form("WS_workman4"))
			rs("WS_workman5")=WS_s.HX_Replace(request.form("WS_workman5"))
			rs("WS_sallary1")=WS_s.HX_Replace(request.form("WS_sallary1"))
			rs("WS_sallary2")=WS_s.HX_Replace(request.form("WS_sallary2"))
			rs("WS_sallary3")=WS_s.HX_Replace(request.form("WS_sallary3"))
			rs("WS_sallary4")=WS_s.HX_Replace(request.form("WS_sallary4"))
			rs("WS_sallary5")=WS_s.HX_Replace(request.form("WS_sallary5"))
			rs("WS_workname3")=WS_s.HX_Replace(request.form("WS_workname3"))
			rs("WS_workname4")=WS_s.HX_Replace(request.form("WS_workname4"))
			rs("WS_workname5")=WS_s.HX_Replace(request.form("WS_workname5"))
			if isnumeric(WS_s.HX_Replace(request.form("UserNetDiskSize"))) then
			   RS("WS_UserNetDiskSize")=WS_s.HX_Replace(request.form("UserNetDiskSize"))
			else
			   RS("WS_UserNetDiskSize")=UserNetDiskSize
			end if   
			rs.update
	 End Sub
     Sub HX_WageWSOASCOM()
	      rs("WS_dotime")=request("yy")&"-"&request("mm")&"-"&"15"
          rs("WS_wage")=request("WS_wage")
          rs("WS_pay")=request("WS_pay")
          if request("WS_house")<>"" then rs("WS_house")=request("WS_house")
          if request("WS_lunch")<>"" then rs("WS_lunch")=request("WS_lunch")
          if request("WS_outpay")<>"" then rs("WS_outpay")=request("WS_outpay")
          if request("WS_bonus")<>"" then rs("WS_bonus")=request("WS_bonus")
          if request("WS_card")<>"" then  rs("WS_card")=request("WS_card")
          if request("WS_ratal")<>"" then  rs("WS_ratal")=request("WS_ratal")
          if request("WS_safe")<>"" then rs("WS_safe")=request("WS_safe")
          if request("WS_other")<>"" then  rs("WS_other")=request("WS_other")
          if request("WS_brief")<>"" then  rs("WS_brief")=request("WS_brief")
          if request("WS_lastmoney")<>"" then rs("WS_lastmoney")=request("WS_lastmoney")
          rs("WS_givetime")=request("yy")&"-"&request("bmm")&"-"&request("bdd")
          rs("WS_Uid")=request("WS_Uid")
         rs.update 
     End Sub
	 
	 Sub HX_Webmsms()
	  
	   Viewip   =   trim(request.ServerVariables("REMOTE_ADDR")) '使用客户IP防止重复统计     
       Outtime   =   1 '如果用户关闭页面一分钟后视为离线  
       OuttimeAdd   =   dateadd("n",-Outtime,now()) 
	     
	   If DataBaseType=1 then
		 conn.Execute   ("delete from HX_Online where WS_Lasttime<'"&OuttimeAdd&"' and WS_Userid<>"&LoginUID) '删除离线用户 
	   Else
		 conn.Execute   ("delete from HX_Online where WS_Lasttime<#"&OuttimeAdd&"# and WS_Userid<>"&LoginUID) '删除离线用户 
	   End If
	   sql="select WS_Viewip from HX_Online where WS_Userid="&LoginUID  
	   set rs = conn.Execute (sql) 		  
	   if rs.eof then  '增加新上线用户   
		  conn.Execute ("insert into HX_Online(WS_Userid,WS_Name,WS_Viewip,WS_Lasttime,WS_Staus,WS_Orderby) values("&LoginUID&",'"&LOGINNAME&"','"&Viewip&"','"&now()& "',0,"&SystemOrderby&")")   
	   else  '修改在线用户请求页面的时间 
	      if Expired=1 then	
				If DataBaseType=1 then
					set Crs=conn.Execute("select WS_Lasttime from HX_Online where WS_Lasttime<='"&dateadd("n",-ExpiredTime,now())&"' and WS_Userid="&LoginUID)
				else
					set Crs=conn.Execute("select WS_Lasttime from HX_Online where WS_Lasttime<=#"&dateadd("n",-ExpiredTime,now())&"# and WS_Userid="&LoginUID)
				end if
				if not(Crs.eof or Crs.bof) then
                   WS_S.HX_RSClose Crs
				   response.write "<script>alert('您在"&ExpiredTime&"分钟内没有对系统进行任何操作,为了维护系统数据安全,系统自动启动过期功能,您需要重新登录!');parent.top.location='../HX_Login.asp?action=loginout';</script>"
					response.end
		        end if
                WS_S.HX_RSClose Crs			
		    end if	       
		    conn.Execute("update HX_Online set WS_Lasttime='" & now() & "' where WS_Userid="&LoginUID ) 		  	  
	   end if 	
	   WS_S.HX_RSClose rs 
	   		     
	   set urs=WS_S.HX_SetRSD("","HX_Online"," where WS_Userid="&LoginUID&" and WS_Viewip<>'" & Viewip &"'")	 
	   'if urs.recordcount>0 then
'		response.write "<script>alert('此账号在别处已登录，您被迫下线！');parent.top.location='../HX_Login.asp?action=loginout&online=wsoas';
       ' response.end  
'        end if
	   WS_S.HX_RSClose urs:WS_S.WSOASCOM
	   
	   	response.write ""

	 Msg="setTimeout('window.location.reload()',10000);parent.onlinecount.innerHTML=' "&WS_S.HX_OutOnline(0)&" ';"
     set rs=WS_S.HX_SetRSD("WS_sendnmb,WS_SMSstype","HX_WebSMS"," where WS_recvnmb="&loginuid&" and WS_Ifread=1 order by WS_SMID asc")
     if rs.recordcount>0 then  
	   session("sendnmb")=rs("WS_Sendnmb")
	   Msg=Msg&"parent.psd.src='HXIMAGES/Websms/sound/mail.wav';parent.comesms.src='HXIMAGES/Websms/comesms.gif';show('"&rs("WS_sendnmb")&"');"
	 else 
	   Msg=Msg&"parent.psd.src='';parent.comesms.src='HXIMAGES/Websms/websms.gif';"
	 end if
	 response.write "<SCRIPT LANGUAGE=javascript>"&Msg&"</script>"
	 WS_S.HX_RSClose rs
	 End Sub
	 
	 Sub HX_Webmsm()
        set rs=WS_S.HX_SetRSD("","HX_SchEduleMain"," where WS_SchEduleMainman="&loginuid&" and awoke=1 and WS_SchEduleMainFirstTime>=#"&now&"# and WS_SchEduleMainSituation<>'已完成' order by WS_SchEduleMainFirstTime desc")
		if rs.recordcount>0 then
		 session.timeout=rs("WS_SchEduleMainAwokeTime")
		 if session("WS_SchEduleMainAwokeTime")="" then
		  conn.execute("insert into HX_WebSMS(WS_Sendnmb,WS_recvnmb,WS_message,WS_SMSstype) values("&loginuid&","&loginuid&",'日程提醒,请<a href=""SchEduleModify.asp?WS_SMID="&rs("WS_SMID")&""" target=""right"">查收</a>！','日程提醒')")
		  session("WS_SchEduleMainAwokeTime")=""
		 end if
		end if
		set rs=WS_S.HX_SetRSD("","HX_SchEduleMain"," where WS_SchEduleMainman="&loginuid&" and awoke=1 and WS_SchEduleMainFirstTime>=#"&now&"# and WS_SchEduleMainSituation<>'已完成' order by WS_SchEduleMainFirstTime desc")
		if rs.recordcount>0 then
		 session.timeout=rs("WS_SchEduleMainAwokeTime")
		 if session("WS_SchEduleMainAwokeTime")="" then
		  conn.execute("insert into HX_WebSMS(WS_Sendnmb,WS_recvnmb,WS_message,WS_SMSstype) values("&loginuid&","&loginuid&",'日程提醒,请<a href=""SchEduleModify.asp?WS_SMID="&rs("WS_SMID")&""" target=""right"">查收</a>！','日程提醒')")
		  session("WS_SchEduleMainAwokeTime")=""
		 end if
		end if
		set rs=WS_S.HX_SetRSD("WS_sendnmb,WS_SMSstype","HX_WebSMS"," where WS_recvnmb="&loginuid&" and WS_Ifread=1")
        if rs.recordcount>0 then session("sendnmb")=rs("WS_Sendnmb"):response.Write("<SCRIPT LANGUAGE=javascript>parent.psd.src='../HXIMAGES/Websms/sound/mail.wav';parent.WSOA"&session("sendnmb")&".src='../HXIMAGES/Websms/4-1.gif';</SCRIPT>")   else   response.Write("<SCRIPT LANGUAGE=javascript>parent.psd.src='';parent.WSOA"&session("sendnmb")&".src='../HXIMAGES/Websms/userface.gif';</SCRIPT>")  end if
        WS_S.HX_RSClose rs			 
	 End Sub
	 Sub HX_WebsmsList()
	    response.write "<html><head><NOSCRIPT><IFRAME SRC=""*.html""></IFRAME></NOSCRIPT><meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312""><script language=""JavaScript"" src=""../../HXINCLUDE/HX_menu.js"" type=""text/JavaScript""></script><script src='../../HXINCLUDE/HX_Function.js'></script><link href=""../../HXINCLUDE/HX_websms.css"" rel=""stylesheet"" type=""text/css""></head><body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'><bgsound src="""" id=""psound"" name=""psound"" loop=1><bgsound id=""psd"" name=""psd"" src="""" loop=""1""><img src='../hximages/websms/userface.gif' width=0 height=0 align='absmiddle' id='WSOA' name='WSOA'><table width=""88"" border=""0"" cellpadding=""0"" cellspacing=""0"" bgcolor=""#848284"" class=""iframe""><tr><td><table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""butup""  onMouseDown=""this.className='tddown1'"" onMouseUp=""this.className='butup'"" onMouseOver=""this.className='but1'"" onMouseOut=""this.className='butup'""><tr><td align=""center"" onclick=""return change(1)"" onMouseDown=""this.className='tddown2'"" onMouseUp=""this.className='';psound.src='../HXIMAGES/Websms/sound/01.wav'"" onMouseOver=""this.className='but2'"" onMouseOut=""this.className=''""><span id=Translateloading style='display:none' dir=ltr></span>在线人员(<span id=onlineUserCNT_box dir=ltr></span><script>function onlineUserCNT(){updater('onlineUserCNT_box','../SelectWSOASAjax.Asp','get','Action=onlineUserCNT','Translateloading','true'); setTimeout('onlineUserCNT()',10000);} onlineUserCNT();</script>)</td></tr></table></td></tr><tr><td height=""300"" align=""center"" valign=""top"" bgcolor=""#8080C0"" id=""a1"" style=""DISPLAY: block""><table width=""100%"" height=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0""><tr><td width=""89%"" rowspan=""3"" align=""right""><div id=""div1"" style=""overflow: hidden;height: 300px;width:85px;""><div id=onlineUser_box dir=ltr></div></div><script>function onlineUser(){updater('onlineUser_box','../SelectWSOASAjax.Asp','get','Action=onlineUser','Translateloading','true'); setTimeout('onlineUser()',10000);} onlineUser();</script></td><td><img src=""../HXIMAGES/Websms/scroll1.gif"" width=""16"" height=""16"" border=""0"" onMousedown=""this.src='../HXIMAGES/Websms/scroll2.gif';mscroll(-30,1)""  onMouseUp=""this.src='../HXIMAGES/Websms/scroll1.gif';mscroll(0,1)"" onMouseOut=""mscroll(0,1);change(1)""></td></tr><tr><td height=""266""></td></tr><tr><td height=""18"" valign=""bottom""><img src=""../HXIMAGES/Websms/scroll3.gif"" width=""16"" height=""16"" border=""0"" onMousedown=""this.src='../HXIMAGES/Websms/scroll4.gif';mscroll(30,1)"" onMouseUp=""this.src='../HXIMAGES/Websms/scroll3.gif';mscroll(0,1)"" onMouseOut=""mscroll(0,1);change(1)""></td></tr></table></td></tr><tr><td><table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""butup""  onMouseDown=""this.className='tddown1'"" onMouseUp=""this.className='butup'"" onMouseOver=""this.className='but1'"" onMouseOut=""this.className='butup'""><tr><td align=""center"" onclick=""return change(2)"" onMouseDown=""this.className='tddown2'"" onMouseUp=""this.className='';psound.src='../HXIMAGES/Websms/sound/01.wav'"" onMouseOver=""this.className='but2'"" onMouseOut=""this.className=''""><span id='Translateloading1' dir=ltr><img src='../HXIMAGES/loadingint.gif' align=absmiddle></span>全部人员(<span id=OutListMemberCNT_box dir=ltr></span><script>function OutListMemberCNT(){updater('OutListMemberCNT_box','../SelectWSOASAjax.Asp','get','Action=OutListMemberCNT','Translateloading','true'); setTimeout('OutListMemberCNT()',10000);} OutListMemberCNT();</script>)</td></tr></table></td></tr><tr><td height=""300"" align=""center"" valign=""top"" bgcolor=""#8080C0"" id=""a2"" style=""DISPLAY:none""><table width=""100%"" height=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0""><tr><td width=""89%"" rowspan=""3"" align=""right""><div id=""div2"" style=""overflow: hidden;height: 300px;width:85px;""><div id=OutListMember_box dir=ltr></div></div><script>function OutListMember(){updater('OutListMember_box','../SelectWSOASAjax.Asp','get','Action=OutListMember','Translateloading1','true'); setTimeout('OutListMember()',100000);} OutListMember();</script></td><td><img src=""../HXIMAGES/Websms/scroll1.gif"" width=""16"" height=""16"" border=""0"" onMousedown=""this.src='../HXIMAGES/Websms/scroll2.gif';mscroll(-30,2)""  onMouseUp=""this.src='../HXIMAGES/Websms/scroll1.gif';mscroll(0,2)"" onMouseOut=""mscroll(0,2);change(2)""></td></tr><tr><td height=""266"">&nbsp;</td></tr><tr><td height=""18"" valign=""bottom""><img src=""../HXIMAGES/Websms/scroll3.gif"" width=""16"" height=""16"" border=""0"" onMousedown=""this.src='../HXIMAGES/Websms/scroll4.gif';mscroll(30,2)"" onMouseUp=""this.src='../HXIMAGES/Websms/scroll3.gif';mscroll(0,2)"" onMouseOut=""mscroll(0,2);change(2)""></td></tr></table></td></tr><tr><td height=""2"" bgcolor=""#D4D0C8""></td></tr><tr><td><table width=""100%"" bordercolor=""#848284"" bgcolor=""#D4D0C8"" border=""1"" cellspacing=""0"" cellpadding=""0""><tr align=""center""><td height=""18"" bordercolor=""#848284"" bgcolor=""#D4D0C8""><table width=""100%"" height=""100%"" border=""1"" cellpadding=""0"" cellspacing=""0""><tr><td align=""center"" bordercolor=""#D4D0C8"" onMouseDown=""this.className='tddown'"" onMouseUp=""this.className='but'"" onMouseOver=""this.className='but'"" onMouseOut=""this.className=''"" onClick=""open('allsmsview.asp','','');"">全部消息</td></tr></table></td></tr></table></td></tr></table></body></html>"
	 End sub
	 Sub HX_Websmssendata()
	  	fontb=request.Form("fontb"):fonti=request.Form("fonti"):fontu=request.Form("fontu"):recvnmb=request("recvnmb"):recvname=request.Form("recvname"):font=trim(request.Form("font")):fontcolor=trim(request.Form("fontcolor")): fontsize=trim(request.Form("fontsize")):message=request("saytext"):msgtype=request.Form("msgtype")
	    if msgtype="" then msgtype=0
	    if len(message)>150 then message=left(message,150)
	    if font<>"" then style="face='"&font&"'"
	    if fontcolor<>"" then style=style&" color='"&fontcolor&"'"
	    if fontsize<>"" then style=style&"style='font-size:"&fontsize&"px;line-height:"&fontsize+10 &"px'"
	    message="<font "&style&">"&message&"</font>"
	    if fontb<>"" then message="<b>"&message&"</b>"
	    if fonti<>"" then message="<i>"&message&"</i>"
	    if fontu<>"" then message="<u>"&message&"</u>"
        ColumnName="":tablename="HX_WebSMS":Orderby=""
         set rs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby)
          rs.addnew:rs("WS_Sendnmb")=loginuid:rs("WS_recvnmb")=recvnmb:rs("WS_message")=message:rs("WS_SMSstype")="个人短信":rs("WS_ifread")=1:rs.update
          session(cstr(session("nmb"))&recvnmb)="<div onMouseOver=this.className='onselect' onMouseOut=this.className='' onDblClick='say.saytext.value=say.saytext.value+this.innerText'><font color=#ff0000>["&now()&"]　"&session("name")&"<br>"&message&""&session(cstr(session("nmb"))&recvnmb)
          response.Write("<script>window.close();</script>")
		  WS_S.HX_RSClose rs
	 End Sub

	 Sub HX_allMobileList()
	 ColumnName="":Tablename="HX_WSOASSMS":action=request("action"):page=request("page")
     if action="del" then 
     WS_SMID=request("SMID") 
     if WS_SMID="" or isnull(WS_SMID) then	HX_GoBack "非法操作",""  
      conn.execute("delete from "&Tablename&" where WS_SMID in("&WS_SMID&")")
      WS_S.HX_Redirect "allMobileList.asp?page="&page
    end if
     'Orderby=" where WS_WSOASSMSCreate="&loginuid&" order by WS_SMID desc"
     Orderby=" order by WS_SMID desc"
     set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
	 response.write "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>短消息管理</title></head><body>"
	 response.write "<table cellpadding='2' cellspacing='1' border='0' class='border' align=center><form method='post' action='allMobileList.asp?action=del&page="&page&"' name='form1'><tr class=title><td width=""27"" align=center><input type=""checkbox"" name=""checkall"" value=""checkbox"" onClick=""chkall1(this)""></td><td align=center>SMSID或错误内容</td><td width=""83""><div align=""center"">接收号码</td><td width=""60""><div align=""center"">发送时间</td><td width=""60""><div align=""center""> 状态 </td><td width=170>短信内容</td></tr>"
	 if rs.recordcount<=0 then
   response.Write "<tr><td colspan=6 class=titletdbg align=center>暂时还没有发送或收到手机短信！</td></tr>"
    else
   rs.PageSize =14 '每页记录条数
	iCount=rs.RecordCount '记录总数
	iPageSize=rs.PageSize
    maxpage=rs.PageCount 
    if Not IsNumeric(page) or page="""" then
        page=1
      else
        page=cint(page)
      end if
      if page<1 then
        page=1
      elseif  page>maxpage then
        page=maxpage
      end if
      rs.AbsolutePage=Page
	  if page=maxpage then
		x=iCount-(maxpage-1)*iPageSize
	   else
		x=iPageSize
	  end if
	  ii=0
	  do while not rs.EOF
	 response.Write "<tr class=titletdbg><td align=center><input type=""checkbox"" name=""SMID"" value='"&rs("WS_SMID")&"' class=""radio""></td><td align=center>"&rs("WS_WSOASSMSSendID")&"</td>"
	 response.Write "<td align=""left"">"&rs("WS_WSOASSMSSendNO")&"</td><td>"&rs("WS_WSOASSMSSendDate")&"</td><td>"&rs("WS_WSOASSMSStatus")&"</td><td>"&rs("WS_WSOASSMSContent")&"</td></tr>"
      ii=ii+1
	  if ii>=rs.PageSize then Exit Do
	  rs.movenext
      loop
      response.write "<tr class=titletdbg><td colspan=""6"" height=""30""><input type=""checkbox"" name=""checkall"" value=""checkbox"" onClick=""chkall1(this)"" id=""checkall""><label for=""checkall"">全选</label>&nbsp;将选中全部&nbsp;<input name=""del"" type=""submit"" class=button value=""删除"">&nbsp;<input name=""Excel"" type=""button"" class=button value=""导出Excel""  onclick=""location.href='MobileToExcel.asp';""></td></tr>"
      call WS_S.PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>",6)
      end if
      call WS_S.HX_RSClose(rs):response.Write "</form></table>"
	 End Sub
	 
	 Sub HX_allsmsview()	  
	 ColumnName="":Tablename="HX_WebSMS":action=request("action"):page=request("page")
     if action="del" then 
     WS_SMID=request("MAID") 
     if WS_SMID="" or isnull(WS_SMID) then	HX_GoBack "非法操作",""  
      conn.execute("update "&Tablename&" set WS_SendnmbDel=1 where WS_Sendnmb="&loginuid&" and WS_SMID in("&WS_SMID&")")
      conn.execute("update "&Tablename&" set WS_RecvnmbDel=1 where WS_Recvnmb="&loginuid&" and WS_SMID in("&WS_SMID&")")
      conn.execute("delete from "&Tablename&" where WS_SendnmbDel=1 and WS_RecvnmbDel=1 and WS_SMID in("&WS_SMID&")")
      WS_S.HX_Redirect "allsmsview.asp?page="&page
    end if
     Orderby=" where (WS_Recvnmb="&loginuid&" and WS_RecvnmbDel=0) or (WS_Sendnmb="&loginuid&" and WS_SendnmbDel=0) order by WS_Wdate desc"
	  set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
	 response.write "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>短消息管理</title></head><body><br><script src='../../HXINCLUDE/HX_menu.js'></script>"
	   response.write "<table cellpadding='2' cellspacing='1' border='0' class='border' align=center style='margin-left:10px;'><form method='post' action='allsmsview.asp?action=del&page="&page&"' name='form1'><tr class=title><td width=""27"" align=center><input type=""checkbox"" name=""checkall"" value=""checkbox"" onClick=""chkall(this)""></td><td width=""54"" align=center>序号</td><td width=""83"">发送人</td><td width=""83"">接收人</td><td width=""69"">类型</td><td width=""201"">消息内容</td><td width=""117"">日期</td></tr>"
   if rs.recordcount<=0 then
   response.Write "<tr><td colspan=7 class=titletdbg align=center>暂时还没有收到短信！</td></tr>"
    else
   rs.PageSize =14 '每页记录条数
	iCount=rs.RecordCount '记录总数
	iPageSize=rs.PageSize
    maxpage=rs.PageCount 
    if Not IsNumeric(page) or page="""" then
        page=1
      else
        page=cint(page)
      end if
      if page<1 then
        page=1
      elseif  page>maxpage then
        page=maxpage
      end if
      rs.AbsolutePage=Page
	  if page=maxpage then
		x=iCount-(maxpage-1)*iPageSize
	   else
		x=iPageSize
	  end if
	  ii=0
	  do while not rs.EOF
	  if ii mod 2=0 then
	   response.Write "<tr class=titletdbg align=center>"
	   else
	    response.Write "<tr class=titletdbg1 align=center>"
		end if
	 response.Write "<td width=""27"" align=center><input type=""checkbox"" name=""MAID"" value='"&rs("WS_SMID")&"' class=""radio""></td><td width=""54"" align=center>"&rs("WS_SMID")&"</td>"
	  Call WS_S.HX_OutUserInfo(rs("WS_Sendnmb"))
	 response.Write "<td width=""83"" align=""left""><a href=""javascript:show('"&rs("WS_Sendnmb")&"');"">"&OutName
	 if rs("WS_Ifread")=1 and trim(rs("WS_Recvnmb"))=trim(loginuid) then response.write "<img src='../hximages/news.gif' border=0>"
	 response.write "</a></td>"
	  Call WS_S.HX_OutUserInfo(rs("WS_Recvnmb"))
	 response.Write "<td width=""83"" align=""left""><a href=""javascript:show('"&rs("WS_Recvnmb")&"');"">"&OutName
	 response.write "</a> </td><td width=""69"">"&rs("WS_SMSstype")&"</td><td width=""201"">"&rs("WS_Message")&"</td><td width=""117"">"&rs("WS_Wdate")&"</td></tr>"
      ii=ii+1
	  if ii>=rs.PageSize then Exit Do
	  rs.movenext
      loop
      response.write "<tr class=titletdbg><td colspan=""7"" height=""30""><input type=""checkbox"" name=""checkall"" value=""checkbox"" onClick=""chkall(this)"" id=""checkall""><label for=""checkall"">全选</label>&nbsp;将选中全部&nbsp;<input name=""del"" type=""submit"" class=button value=""删除""</td></tr></form>"
      call WS_S.PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>",7)
      end if
      call WS_S.HX_RSClose(rs):response.Write "</table>"
	 End Sub
Sub HX_WebsmsSend()
recvid=request.QueryString("id"):Call WS_S.HX_OutUserInfo(recvid):recvname=OutName:ColumnName="":tablename="HX_WebSMS":Orderby=" where WS_Sendnmb="&recvid&" and WS_recvnmb="&loginuid&" and WS_Ifread=1 order by WS_SMID asc":set rs=WS_S.HX_SetRSD(ColumnName,tablename,Orderby):if rs.recordcount>0 then response.Redirect("recv.asp?id="&recvid)
WSOASCOMSTR="<html><head><title>信息发送</title><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><link href='../../HXINCLUDE/HX_websms.css' rel='stylesheet' type='text/css'><script language='JavaScript' src='../../HXINCLUDE/type.js'></script></head><body onkeydown='if(event.ctrlKey)return false;' onFocus='say.saytext.focus()'>"
WSOASCOMSTR=WSOASCOMSTR&"<table width='390' border='1' cellpadding='0' cellspacing='1' bordercolor='#D4D0C8'><tr><td><div style='height:120px; display:none;' id='showmessage'><iframe name='showmetop' scrolling='yes' height=120 width=390 src='HX_ShowMessage.asp?recvid="&recvid&"'></iframe></div></td><tr><form action='senddate.asp' method='post' name='say' id='say'><tr><td width='390' height='70'><fieldset><legend>送给</legend><table width='100%' border='0' cellpadding='0' cellspacing='0' bordercolor='#D4D0C8'><tr><td bordercolor='#D4D0C8'>　姓 名：<input name='name' type='text' autocomplete=off "
WSOASCOMSTR=WSOASCOMSTR&"class='fam' id='name' readonly value='"&recvname&"' size='25'><input name='recvnmb' type='hidden' value='"&recvid&"'>　<div id='facelay' onClick=""MM_showHideLayers('facelay','','hide')"" style='position:absolute; visibility:hidden; width:205px; height:150px; z-index:1; overflow:auto; left: 70px;top:80;background-color: #D4D0C8; border: 1px solid #000000;'><table width='93%' border='0' cellspacing='1' "
WSOASCOMSTR=WSOASCOMSTR&"cellpadding='2'><tr><td><img src='../HXIMAGES/img/12.gif' title='笑脸:)' onClick=selectimg(':)')></td><td><img src='../HXIMAGES/img/9.gif' title='生气:(' onClick=selectimg(':(')></td><td><img src='../HXIMAGES/img/19.gif' title='疑问?_?' onClick=selectimg('?_?')></td><td><img src='../HXIMAGES/img/18.gif' title='吃惊:o' onClick=selectimg(':o')></td><td><img src='../HXIMAGES/img/11.gif' title='眼镜8)' onClick=selectimg('8)')>"
WSOASCOMSTR=WSOASCOMSTR&"</td><td><img src='../HXIMAGES/img/6.gif' title='Kiss:*' onClick=selectimg(':*')></td><td><img src='../HXIMAGES/img/15.gif' title='哭脸:~' onClick=selectimg(':~')></td><td><img src='../HXIMAGES/img/13.gif' title='吐舌头:p' onClick=selectimg(':p')></td></tr><tr><td><img src='../HXIMAGES/img/21.gif' title='媚眼;)' onClick=selectimg(';)')></td><td><img src='../HXIMAGES/img/16.gif' title='害羞=^_^=' onClick=selectimg('=^_^=')></td><td>"
WSOASCOMSTR=WSOASCOMSTR&"<img src='../HXIMAGES/img/8.gif' title='流口水:)~' onClick=selectimg(':)~')></td><td><img src='../HXIMAGES/img/1.gif' title='傻笑:D' onClick=selectimg(':D')></td><td><img src='../HXIMAGES/img/7.gif' title='打颤:{' onClick=selectimg(':{')></td><td><img src='../HXIMAGES/img/14.gif' title='汗颜:_(' onClick=selectimg(':_')></td><td><img src='../HXIMAGES/img/17.gif' title='眨眼b)' onClick=selectimg('b)')></td>""<td><img src='../HXIMAGES/img/10.gif' title='尴尬@_@' onClick=selectimg('@_@')></td></tr>"
WSOASCOMSTR=WSOASCOMSTR&"<tr><td><img src='../HXIMAGES/img/5.gif' title='脸红*^_^*' onClick=selectimg('*^_^*')></td><td><img src='../HXIMAGES/img/4.gif' title='惊讶^o^' onClick=selectimg('^o^')></td><td><img src='../HXIMAGES/img/3.gif' title='酷吧B)' onClick=selectimg('B)')></td><td><img src='../HXIMAGES/img/20.gif' title='明白:0' onClick=selectimg(':0')></td><td><img src='../HXIMAGES/img/2.gif'  title='傲慢K)' onClick=selectimg('K)')></td><td><img src='../HXIMAGES/img/22.gif' title='发怒%(' onClick=selectimg('%(')></td><td>"
WSOASCOMSTR=WSOASCOMSTR&"<img src='../HXIMAGES/img/23.gif' title='羡慕*_*' onClick=selectimg('*_*')></td><td><img src='../HXIMAGES/img/24.gif' title='怒骂:8' onClick=selectimg(':8')></td> </tr><tr> <td><img src='../HXIMAGES/img/25.gif' title='晕倒&)' onClick=selectimg('&)')></td><td><img src='../HXIMAGES/img/26.gif' title='大笑:()' onClick=selectimg(':()')></td><td><img src='../HXIMAGES/img/27.gif' title='欠扁@_#' onClick=selectimg('@_#')></td></tr></table></td></tr></table></fieldset><table width='100%' border='1' cellpadding='0' "
WSOASCOMSTR=WSOASCOMSTR&"cellspacing='0' bordercolor='#D4D0C8'><tr><td width='20' align='center' id='a1' onMouseDown='setstyle(a1)' onMouseOver='mover(a1)' onMouseOut='mout(a1)'><font style='font-size:16px' face='Times New Roman, Times, serif'><strong>B</strong></font></td><td width='20' align='center' id='a2' onMouseDown='setstyle(a2)' onMouseOver='mover(a2)' onMouseOut='mout(a2)'><font style='font-size:16px' face='Times New Roman, Times, serif'><strong><i>I</i></strong></font></td><td width='20' align='center' id='a3' onMouseDown='setstyle(a3)' "
WSOASCOMSTR=WSOASCOMSTR&"onMouseOver='mover(a3)' onMouseOut='mout(a3)'><font style='font-size:16px' face='Times New Roman, Times, serif'><strong><u>U</u></strong></font></td><td><select name='fontcolor'  onChange='document.say.saytext.style.color=this.value'><option value=' ' selected>字色</option><option value='#000000' style='color=#000000'>黑色</option><option value='#ff0000' style='color=#ff0000'>亮红</option><option value='#0088ff' style='color=#0088ff'>海蓝</option><option value='#0000ff' style='color=#0000ff'>亮蓝</option><option value='#000088' style='color=#000088'>"
WSOASCOMSTR=WSOASCOMSTR&"深蓝</option><option value='#888800' style='color=#888800'>黄绿</option><option value='#008888' style='color=#008888'>蓝绿</option><option value='#008800' style='color=#008800'>橄榄</option><option value='#aa00cc' style='color=#aa00cc'>紫色</option><option value='#8800ff' style='color=#8800ff'>蓝紫</option><option value='#888888' style='color=#888888'>灰色</option><option value='#ccaa00' style='color=#ccaa00'>土黄</option><option value='#ff8800' style='color=#ff8800'>金黄</option><option value='#cc3366' style='color=#cc3366'>暗红</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='#ff00ff' style='color=#ff00ff'>紫红</option><option value='#ee9966' style='color=#ee9966'>粉红</option><option value='#6699ee' style='color=#6699ee'>天蓝</option><option value='#3366cc' style='color=#3366cc'>蓝黑</option></select> <select name='font' class='select' onChange='document.say.saytext.style.fontFamily=this.value'><option value='宋体' selected>字体</option><option value='宋体'>宋体</option><option value='楷体'>楷体</option><option value='隶书'>隶书</option><option value='仿宋'>仿宋</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='黑体'>黑体</option><option value='Georgia'>Georgia</option><option value='PMingLiU'>PMingLiU</option><option value='Courier New'>CourierNew</option><option value='Webdings'>Webdings</option><option value='Wingdings'>Wingdings</option></select> <select name='fontsize' id='fontsize'  onChange='document.say.saytext.style.fontSize=this.value'><option value=' ' selected>大小</option><option value='6'>6</option><option value='8'>8</option><option value='10'>10</option><option value='12'>12</option><option value='14'>14</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='16'>16</option><option value='18'>18</option><option value='20'>20</option><option value='22'>22</option><option value='24'>24</option><option value='26'>26</option><option value='28'>28</option><option value='30'>30</option></select> <select onChange='document.say.saytext.value=document.say.saytext.value+this.value;this.options[0].selected=true;'><option value='' selected>动作</option><option value='热情地地向"&recvname&"叫了声：“嗨，你好”'>招呼</option><option value='蹑手蹑脚地溜到"&recvname&"背后，掏出一把大锤子，嘿嘿......'>偷偷</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='"&session("name")&"口吐白沫，咕咚一声，栽倒在地。'>晕倒</option><option value='"&session("name")&"眉开眼笑地想：人都说打是疼，骂是爱，人家会不会，这个这个......'>臭美</option><option value='"&session("name")&"低下头，嫣然一笑，露出颊上浅浅的梨涡，害羞地脸红了起来！'>害羞</option><option value='"&session("name")&"说道：“乖乖不得了，在下的老板来了，没功夫聊了。回见！”'>老板</option><option value='"&session("name")&"急得象热锅上的蚂蚁，不停地大叫：“快点！快点！怎么比猪还慢？！”'>太慢</option><option value='"&session("name")&"一屁股坐在地上发起呆来。'>发呆</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='"&session("name")&"大叫一声：“扯呼”，油门一加，意大利版的NSR车头提起，屁股冒烟，消失在一片茫茫白雾中……'>离开</option><option value='"&session("name")&"留恋地说道：“世上没有不散的宴席，我先走一步了，大家保重。'>离开</option><option value='看着"&recvname&"，心想：现在的女孩真厉害……'>厉害</option><option value='觉得"&recvname&"妹妹真是好可爱哟！'>可爱</option><option value='用一根树枝捅了捅"&recvname&"的鼻子：“醒醒呀，快醒醒。”'>醒醒</option><option value='热情地向"&recvname&"打招呼，并递上一杯香浓Coffee和一杯清香的茶，自己选哦。'>饮料</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='见"&recvname&"不怀好意，连忙抓起电话：114，119，120，122，96315 ... 心想：“警察叔叔怎么还不来呀？”'>求助</option><option value='对着"&recvname&"狠狠的一锤当头敲下,微笑道：“"&recvname&"，你给我发呆去吧！”'>锤子</option><option value='从天上召来一道闪电把"&recvname&"化为一堆灰烬。'>灰烬</option><option value='结结巴巴地跟"&recvname&"道歉“实在是对不住，我下次再也不敢了。”'>道歉</option><option value='和"&recvname&"正邪恶地笑着,八成同时想到什么坏事头上。'>坏事</option><option value='对"&recvname&"小声嘀咕：“君子报仇，十年不晚，五年后再来找你。”'>报仇</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='看着"&recvname&"偷偷直乐，幸灾乐祸地说道：活该。'>活该</option><option value='笑呵呵地对"&recvname&"抱拳打揖“久仰阁下大名，如雷灌耳，今日相见，三生有幸！”'>久仰</option><option value='依依不舍地对"&recvname&"说道：“各位，我有事要先走了，咱们后会有期！”'>离开</option><option value='对着"&recvname&"拍手叫好。'>叫好</option><option value='迎风傲立船首，望滚滚江水东逝，仰天长啸“古往今来多英杰，中游击橹几轮回？”'>长啸</option><option value='不由得十分佩服地叹道：“普天之下，茫茫苍穹还有谁能与"&recvname&"争锋啊？”'>佩服</option><option value='觉得天下英雄舍我其谁？'>"
WSOASCOMSTR=WSOASCOMSTR&"英雄</option><option value='非常同意"&recvname&"的讲法！'>同意</option><option value='看都不看"&recvname&"一眼，哼了一声，高高的把头扬了起来……不理你……'>不理</option><option value='痴痴地望着"&recvname&"的身影，不禁呆了……'>痴痴</option><option value='拍了拍"&recvname&"的头道：“"&recvname&"乖，一会ㄦ给你买棒棒冰。”'>听话</option><option value='不怀好意地绕着"&recvname&"打转，嘴巴里不知在嘀咕些什么。'>打转</option><option value='向"&recvname&"摇摇食指，“小朋友，不可以这样喔！”'>不许</option></select> </td></tr></table></td></tr><tr><td bordercolor='#D4D0C8'>"
WSOASCOMSTR=WSOASCOMSTR&"<textarea name='saytext' wrap='VIRTUAL' id='textarea' onKeyDown='center()'></textarea></td></tr><tr><td height='30' align='right' bordercolor='#D4D0C8'><input name='fontb' type='hidden' id='fontb'><input name='fonti' type='hidden' id='fonti'> <input name='fontu' type='hidden' id='fontu'> <input name='Button' type='button' accesskey='s' value='信息发送(S)' onClick='return checkform()'> <input name='histext' type='button' id='showtmsgtext' accesskey='t' onClick='showtmsg()' value='聊天模式(T)' style='display:none;'><!-- <input name='histext' type='button' id='histext' accesskey='h' onClick='showhis()' value='聊天记录'>-->"
WSOASCOMSTR=WSOASCOMSTR&" <input name='button' type='button'  accesskey='c' onClick='window.close()' value='取消发送(C)'></td></tr><tr><td valign='top'><div class='textarea'>"
WSOASCOMSTR=WSOASCOMSTR&session(cstr(session("nmb"))&recvid)&hismsglist&" </div></td></tr></form></table></body></html>"

response.write WSOASCOMSTR

End Sub

Sub HX_SearchPropertyWSOAS()

WSOASCOMSTR="<head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>资产查询</title></head><body><br>"
WSOASCOMSTR=WSOASCOMSTR&"<table cellpadding='2' cellspacing='1' border='0' class='border' align=center style='margin-left:10px;'><tr><td class='title' colspan=2>资产查询</td></tr><form name='form1' method='post' action='propertylist.asp?action=search'><tr class=titletdbg align='right'><td width='50%'>关键字：</td>"
WSOASCOMSTR=WSOASCOMSTR&"<td width='82%' align='left'><input type='text' autocomplete=off name='keywords' size='40'></td></tr><tr class=titletdbg><td width='18%' align='right'>选　项：</td><td width='82%'><select name='selectname'><option value='PropertyName' selected>财产名称</option><option value='PropertyNUM'>财产编号</option>"
WSOASCOMSTR=WSOASCOMSTR&"<option value='PropertyTableDate'>制表日期</option><option value='PropertyBuyDate'>购买日期</option><option value='PropertyKind'>规格型号</option></select></td></tr><tr class=titletdbg><td>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 搜 索 '></td></tr></form></table></td></tr></table>"
response.write WSOASCOMSTR
End Sub	
Sub HX_GetPassWord() 
	if GETPASSWORD=1 then HX_GoBack "",""
	action=request("action"):ColumnName="":Tablename="HX_CompanyUser"
	select case action
	case "searchinfo"
		Orderby=" where WS_UserName='"&request.form("UserName")&"' and WS_Name='"&request.form("truename")&"'"
		set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
		if rs.recordcount<=0 then HX_GoBack "用户名或真实姓名有误！","" else WS_S.HX_Redirect "HX_GetPassWord.asp?action=step&username="&request("username")
	case "AnswerQuestion"
		if request("Answer")<>"" then
		Set Rs=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_UserName='"&request("username")&"' and WS_Answer='"&md5(request("Answer"))&"'")		
		if rs.recordcount<=0 then HX_GoBack "答案有误！","" else WS_S.HX_Redirect "HX_GetPassWord.asp?action=step1&username="&request("username")
		else
		 HX_GoBack "答案不能为空！",""
		end if
	case "changeinfo"
		if request("password")=request("repassword") and request("password")<>"" then
		conn.execute("update HX_CompanyUser set WS_PassWord='"&md5(request("password"))&"' where WS_UserName='"&request.form("UserName")&"'")
		response.Write "<script>alert('设置成功，请用设置的密码登录!');window.close();</script>":response.end
		else
		HX_GoBack "二次密码不相同！",""
		end if
	end select
	
	WSOASCOMSTR="<html><head><title>找回密码</title><meta http-equiv='Content-Type' content='text/html; charset=gb2312'></head><body>"
	select case action
	case "step"
	    Set Rs=WS_S.HX_SetRSD("","HX_CompanyUser"," where WS_UserName='"&request("username")&"'") 
		if Rs.recordcount>0 then
		WSOASCOMSTR=WSOASCOMSTR&"<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>"
		WSOASCOMSTR=WSOASCOMSTR&"<tr class=title> <td colspan=2>回答问题(第二步)</td></tr><form name='form1' method='post' action='HX_GetPassWord.asp'><tr class=titletdbg><td width='27%' align='right'>问题：</td>"
		WSOASCOMSTR=WSOASCOMSTR&"<td width='73%'>"&rs("WS_Question")&"</td></tr><tr class=titletdbg><td align='right'>答案：</td><td><input type='text' name='Answer' size=35></td></tr><tr class=titletdbg><td align='right'>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 确定 '> "
		WSOASCOMSTR=WSOASCOMSTR&"<input type='reset' class='button' name='Submit2' value=' 重 置 '><input type='hidden' name='action' value='AnswerQuestion'><input name='UserName' type='hidden' value='"&request("username")&"' size=21></td></tr></form></table>"
		else
		  WS_S.HX_RSClose rs 
		  HX_GoBack "没有此用户名！",""
		end if
		WS_S.HX_RSClose rs
		RESPONSE.WRITE WSOASCOMSTR
	case "step1"
		WSOASCOMSTR=WSOASCOMSTR&"<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>"
		WSOASCOMSTR=WSOASCOMSTR&"<tr class=title> <td colspan=2>找回密码(第三步)</td></tr><form name='form1' method='post' action='HX_GetPassWord.asp'><tr class=titletdbg><td width='27%' align='right'>新 密 码：</td>"
		WSOASCOMSTR=WSOASCOMSTR&"<td width='73%'><input name='password' type='password' size=21></td></tr><tr class=titletdbg><td align='right'>确认密码：</td><td><input type='password' name='repassword' size=21></td></tr><tr class=titletdbg><td align='right'>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 确定修改 '> "
		WSOASCOMSTR=WSOASCOMSTR&"<input type='reset' class='button' name='Submit2' value=' 重 置 '><input type='hidden' name='action' value='changeinfo'><input name='UserName' type='hidden' value='"&request("username")&"' size=21></td></tr></form></table></td></tr></table>"
		RESPONSE.WRITE WSOASCOMSTR
	case else
		WSOASCOMSTR=WSOASCOMSTR&"<table cellpadding='2' cellspacing='1' border='0' class='border' align=center>"
		WSOASCOMSTR=WSOASCOMSTR&"<tr class=title><td colspan='2'>找回密码(第一步)</td></tr>"
		WSOASCOMSTR=WSOASCOMSTR&"<form name='form1' method='post' action=''><tr class=titletdbg><td width='27%' align='right'>用 户 名：</td><td width='73%'><input name='UserName' type='text' autocomplete=off size=21></td></tr><tr class=titletdbg><td align='right'>真实姓名：</td><td><input type='text' autocomplete=off name='truename' size=21></td></tr><tr class=titletdbg>"
		WSOASCOMSTR=WSOASCOMSTR&"<td align='right'>&nbsp;</td><td><input type='submit' class='button' name='Submit' value=' 下一步 '> <input type='reset' class='button' name='Submit2' value=' 重 置 '> <input type='hidden' name='action' value='searchinfo'></td></tr></form></table>"
	RESPONSE.WRITE WSOASCOMSTR
	end select
	WS_S.HX_RSClose rs
End Sub 
End Class
%>