<%
Server.ScriptTimeout=99999
Dim CONN,DBPATH,CONNSTR,RS,ConfigRS,MODRS,SERS,OutRs,ders,aprs,urs,rs1,rs2,rs3,strs,bars,ars,Qrs,rers,drers,Viewrs,drs,CONN1,CONNSTR1
Dim trs,crs,mrs,ifrs,hrs,irs,nrs,ATRS,ours,lers,aers,Enrs,adrs,udrs,tyrs,Ourtyrs,urlrs,mailrs,Waitrs,MemberPrivrs,dutyrs,isSigned
Dim Buildingrs,BuildingProjectrs,Buildingrs2,BuildingProjectrs2,headid,classname(7)
'数据库方面
Dim WS_CompanyName,WS_LinkTel,WS_LinkFax,WS_WebUrl,WS_Post,WS_Address,WS_CompanyIntr,Registers,WS_Bulletin,REGISTER,RegFlag,GETPASSWORD
Dim iCount,maxpage,page,iPageSize,x,PageControl,nbsp,ifexitsc,onrs
Dim LOGINPASSWORDMD5,Path_Info,Tmpstr,ScriptName,sql,STATUSSET
DIM LOGINUSERNAME,LOGINPASSWORD,LOGINPWRDMD5,LogAppointment,UnitType,LOGINUnitType
Dim WS_AppointmentName,WS_Aid,WS_Code,WS_Photo,Filenamepath,fs
DIM tablename,Tablename1,Tablename2,Tablename3,Tablename4,Tablename5,ColumnName,Orderby,action,msg,sele'变量
Dim WS_Did,WS_DepartmentName,WS_DepartmentTel,WS_DepartmentFax,WS_OrderBy,Appointment
Dim WS_Uid,WS_bornarr,WS_Jobdatearr,WS_born,WS_Jobdate,statetimearr,overtimearr,registerarr
Dim i,ii,j,k,nnn,mmm,mmmm,Content1,answer,Content20,Content21,Content30,Content31,PollNum,WS_VQID
Dim count,yyyy,myip,a1,b1,fip,oip,a,b,c,d,e,T,N,title,startt,endt,active,id,p_total,aaa
Dim sql1,sql2,sql3,uid,uidsarr,pathname,pathid,WS_PAID
Dim WS_Void,WS_AnswerTitle,p_percent,N_Quest,WS_QuestionID
Dim myip1,myip2,nm,num1,num2,RedirectU
Dim searchtype,keywords,searchmode,OfficeReplyNum,OfficeReplyComment,OfficeReplyDate
Dim WS_Province,WS_City,WS_PostCode,WS_TelPhone
Dim EditName,truename,truemoney,WS_bargaintypename
Dim WS_id,WS_Tid,WS_Teid,DESCORASC
DIM WS_S,WS_E,WS_M,jmail,upload,filepath,FormName,File,FileExt,ranNum,FileName'功能
Dim WS_Urid,WS_WebSearchName,WS_WebSearchUrl,WS_webUrlContent
Dim WS_Laid,WS_StartDate,WS_StartCaseDate,WS_LawRuleContent,WS_LawRuleTitle
Dim startime,endtime,pid,aid,Content,choice,G
Dim WS_TAid,style,num_ip,startip1,endip1,ip,WS_ViewUserName
Dim SubjectId,menutitle,NetOA,num,WS_USID
Dim TotalmulAiWi,Ai,wi,arrVerifyCode
Dim modValue,strVerifyCode,passorlost
Dim CheckCookies,LOGINUid,Connect,CRID
Dim WS_InterNetExploertop,WS_InterNetExploerStatus,WS_ICOWidth,WS_ICOHeight,WS_ICOTopIndex
Dim WS_InternetEmail,WS_InternetPOP3,WS_InternetSMTP,WS_InternetSendName,WS_InternetPassword,WS_InternetContent,WS_INID
Dim WS_ConfigInternetEmail,WSOASCOMSTR,WS_ConfigInternetPOP3,WS_ConfigInternetSMTP,WS_ConfigInternetSendName,WS_ConfigInternetPassword,WS_ConfigInternetContent
Dim pop3,Recipients,separator,re,reto,pop3count,WS_BOXID,prs,BOXID,WS_Date,WDate,Attachments,at,boxrs,brs
Dim downpath,WS_downpath,interemail,mailbody,topic
Dim CompactDB,checkuser,WS_OfficeName,WS_OfficeNum,WS_OfficeManageID,WS_OfficeBuyID,WS_OfficeUnitPrice,WS_OfficeMeasurement,WS_OfficeBuydate
Dim WS_OfficeAddDate,WS_OfficeContent,WS_OFID,OfficeManageID,OfficeBuyID,OfficeBuydate,OfficeAddDate,OfficeContent
Dim OutUserName,OutName,OutPhone,OutAddress,OutAppointmentID,OutAppointment,OutdepartmentID,Outdepartment,DocumetMemo
Dim WS_DOID,WS_DCID,WS_DocumentName,DocumetFile,DocumentName,DocumentClass,DocumentInputDate,DocumentExpose,DocumetLicManUid
Dim DocumetDate,msg1,DocumetUID,BookNumber,WS_BOID
Dim CarName,CarDescribe,WS_MAID,CarState,CarMan,CarRoadNUM,CarOilNUM,CarPassNUM,CarRemark
Dim WS_CAID,MeetingName,MeetingDescribe,WS_MMID,MeetingState
Dim PropertyNumber,pnumber,WS_PPID,uidarr,Orderby1,patindex
Dim WorkTypeName,WorkTypeBrief,WS_WTID,WS_WPID
Dim pname,sex,relation,company,duty,tel,Mobile,oicq,address,email,brief
Dim WS_SEID,WS_SchEduleSortName,Emailarr,WS_SchEduleEmialManTwoUid,WS_SchEduleEmialManUid
Dim first_time,last_time,oktime,yy,mm,dd,yy1,mm1,dd1,yy2,mm2,dd2,today,l,WS_SMID,introduce,intr,SchEduleID
Dim pagename,insave,Maid,subject,body,WS_MailToUid,tuserid,tusername
Dim saleman,InfoMan,Infonname,infotel,infofax,infourl,infoemail,infoaddress,infopost,infoDescribe
Dim Ciid,Contactnname,Contacttel,ContactHomeTel,ContactMobile,Contactemail,Contactduty,ContactBorn,ContactHibe
Dim ConnectContent,ConnectMan,ConnectMobile,ConnectDate,ConnectDescribe
Dim BankName,BankNo,SaleShopname,SaleShoptel,SaleShopfax,SaleShopurl,SaleShopemail,SaleShopaddress,SaleShoppost,SaleShopDescribe
Dim ProductName,SSID,Producttype,ProductUnitPrice,ProductPrice,ProductSalePrice,ProductIntr
Dim PTID,SaleDate,SaleDescribe,LOGdepartment
Dim DUTY_NAME,DUTY_TIME1,DUTY_TYPE1,DUTY_TIME2,DUTY_TYPE2,DUTY_TIME3,DUTY_TYPE3,DUTY_TIME4,DUTY_TYPE4,DUTY_TIME5,DUTY_TYPE5,DUTY_TIME6,DUTY_TYPE6,ATID
Dim OPERATION,MPID,WS_MemberPrivName,onliners,users,Ourusers,myoutname,recvid,recvname,hismsglist,WS_UserType,WS_Usersupplier,WS_UserBrand
Dim sendnmb,fontb,fonti,fontu,recvnmb,configs,font,fontcolor,fontcolor1,fontcolor2,fontsize,message,msgtype,flist
Dim WS_AttendanceManUid,AttendanceManUidarr,BEGIN_DATE,END_DATE,AttendanceIntervalStart,AttendanceIntervalEnd
Dim WS_AttendancenodutyManUid,AttendancenodutyManUid,AttendancenodutyManUidarr,LEADER_ID,ALID
Dim IntervalStart,IntervalEnd,StartTime,Orderby2,Orderby3,Orderby4,Orderby5
Dim dat,Module,FlowType,Grade,WS_FCID,ComeDate,ToUid,ToUidarr,Numbers
Dim FolderId,FolderName,FolderMemo,TotalFileNum,TotalFolderSize,SizeString,FolderSize
Dim FolderPriv,folderdir,FileSize,mmessage,NCID,privrs
Dim DeskMyarr,Officearr,InfoChangearr,Manpowerarr,SaleManagearr,SystemSetarr,AnnexProgramarr,Bargainarr,WorkFlowarr,PersonalOfficearr,LogisticsManagementarr
Dim WS_NNID,NotifyTitle,WS_NotifyToUid,NotifyContent,NotifyFlag
Dim sendname,NetDiskFolderEXT,FileID,WS_CRID,WS_CustomRankName,WS_CustomRankPice,cors
Dim DetailDate,DetailContent,SaleCnt,SaleDetailFlag,FileSeverPath,ScanTF
Dim smtpserver,smtpuser,smtppwd,isgo,smtpemail,myemail,path,uploadsuc,Forumupload,WS_WorkFlowTitle,WorkFlowModule,WS_LawRuleAnnex
Dim WS_WorkFlowAnnex,wsoasfile,wsoasnextfile,FileNextName,WS_Annex
Dim FlowDocModelCensorContentArr,CensorArr,WS_FDID,Config,WSOASCOMST
Dim CensorContentArr,CensorUserNameArr,FlowDocStepDateArr,FlowDocStepContentArr,SubmitName
Dim WS_FlowDoczi,WS_FlowDochao,WS_FlowDocGrade,WS_FlowDocmj,WS_FlowDocdepartment,WS_FlowDocTopic,WS_FlowDocCensor,WS_FlowDocIntroduce,WS_FlowDocMemo,WS_FlowDocContent,WS_FlowDocCensorUserNameArr,send,FlowDocCensorUserNameNext
Dim ISID,PNID,WS_StockEarName,WS_StockPriv,WS_SCID,WS_StockCategoryName,selec,WS_StockCategoryPicture,rss,WS_SCIDNEXT
Dim SEID,SCID,WS_StockBookName,WS_StockBookNumber,WS_StockBookType,WS_StockBookUnit,WS_StNum,otype
Dim WS_StockBookOldDate,WS_StockBookDate,WS_StockBookContent,WS_StockBookIntro,WS_StockBookAddress,WS_StockBookNum,SBID,StockPriv,FSID
Dim ShopMoney,BackMoney,OwingMoney,OwingMoney1,OwingMoney2,OwingMoney3,OwingMoney4,OwingMoney5,selclass,SmsStatus,SmsID,SmsUSE,SmsPWD,objHttpRequest,retMsg,Ret,iRet,SendID,SendTimer,WS_Register

'******************************和装修行业模块有关的新定义 2011年 董***************************************************
'********************财务模块**********************
Dim FlowStep,FlowStepName
'********************任务模块**********************
Dim LoginPersonName,MarketDepartmentSequenceNumber,ProjectBuildingName,ProjectBuildingProjectName,Projectleader
'************************WSOAS3.5**********************************************************************************************
Dim WS_Appointment,Appointmentarr,s_Filter,WS_F
Dim DepartmentNamearr,Display,RegisterOut,GETPASSWORDOUT,GetCodeOut,ColorWord,UserName
Dim InteFacers,poprs,pagecnt,stepcnt
Dim NotifyHaveDate,NotifyEndDate
Dim WS_NCID,WS_NotifyClass,MAIDARR,FileExtStr
Dim FromName,DateTime,MailSize,messageid
Dim NewName,OldName,strNewName,strFilename,s,intFilelength,f
Dim NewFileExt,DirnameStr,DirRs,DirSize,DirModified,Share
Dim FileDir,ShareType,AddFile,EditFile,DelFile,ShareSee,ShareAdd,ShareEdit,ShareDel,OpenPass,UserArr
Dim DimFileExt,SelectLogin,DirPath,ShareFolderPath,FID,TopFoFi,DirOutType,FolderFileID,FolderFileRS
Dim FolderFileShare,FolderFileShareType,FolderFileAddFile,FolderFileEditFile,FolderFileDelFile,FolderFileShareSee,FolderFileShareAdd,FolderFileShareEdit,FolderFileShareDel
Dim TopDir,TopThisDir,ComeUrl,SumFiles,SumFolders,SumShell,fc2,myfile,Ext,fc
Dim Fso,FsoFile,AllFileSize,f1,TheTime
Dim ThisDir,DirFiles,DirFolder,strTitle,TotalPut
Dim NCRS,URL
Dim Checker,Tt,sYear,sMonth,sDay,sHour,sMinute,sSecond
Dim objFSO,tPath
Dim P,names, name
Dim server_v1,server_v2,xTestObj
Dim s_BadStr
Dim query, temp
Dim deStr,v,UserID,OutNum,UserIDArr
Dim basepath,ServerAddress,DataBase,DataConnUid,DataConnPWD,DataBaseAc
Dim MyDeskDisplay,MyDeskDisplayArr,MyDeskDisplayLeft,MyDeskDisplayRight,MyDeskDisplayLeftArr,MyDeskDisplayLeftU,MyDeskDisplayRightArr,MyDeskDisplayRightU,MYTABLE


Const DataBaseType=0
Const UserNetDiskSize=100         '默认网络硬盘大小（Ｍ）
Const AcquEditor="eWebEditor"     '默认编辑器
'Forumupload=split("html,htm,asp,aspx,asa,asax,ascx,ashx,asmx,axd,cdx,cer,config,cs,csproj,licx,rem,resx,shtml,shtm,soap,stm,vb,vbproj,webinfo,cgi,pl,php,phtml,php3",",")
Forumupload=split("html,htm,asp,aspx,asa,asax,ascx,ashx,asmx,axd,cdx,cer,cgi,pl,php,phtml,php3",",")
'''''''''''''''''''''''''''''''''''WSOAS4.0'''''''''''''''''''''
Dim WSOASSkin,WS_DefaultSkin,skin,SkinRs
Dim font1,font2,font3,WS_WSOASLogo,Outfile
Dim Viewip,Outtime,OuttimeAdd,LOGINNAME
Dim Expired,ExpiredTime,EditRs,rsc,WS_ClassID,Act
Dim countRs,writecount,Replycount,todaywrite,todayreply
Dim rsclass,sqlclass,sqlmem,rsmem
Dim rsarea,sqlarea,WS_Areaid
Dim areaWS_Classid,lasttheme,lastthemeid
Dim themecount,lasttime,lastthemeauthor
Dim WS_Areamaster,WS_Areaname,themeid,themetitle,themecontent,WS_Writetime,WS_Islock,Author,regtime,WS_Phone
Dim rstheme,sqltheme,rscon,titlelen
Dim go,WS_Classname,parid,WS_Isreply,areaid,areaname
Dim EditorStype,EditorRs,SkinAdd,ScanSkinRs,WSOASSystemRs
Dim WSOASMysn,WSOASType,Serverip,Servername,Geturl,Newdata,myupdate,ndate
Dim myfield,TOEXCELLR,datename,adf,ads,tou,di,ts,Keyword,SystemUser,sType
Dim SystemCtiy,IPAddress,Clint
Dim GetIpAddressArr,GetIpAddressArr1,GetIpAddress1,GetIpAddressArr2,GetIpAddress2,GetIpAddressArr3,GetIpAddress3,GetIpAddressArr4,GetIpAddress4,IPConn,IPRS,ClintIPArr,StrIP
Dim WS_SGID,WS_StudentGradeName,WS_StudentClassName
Dim WS_SIID,WS_SSID,WS_StudentSubjectName,WS_STID,StudentTestObject,StudentTestObjectArr
Dim Scores,ScoresArr,WS_StudentNum,StudentNum,TotalScores,Total,StudentsManageArr,SystemOrderby
Dim SEUserID,WS_OrderbyArr,SEUserIDArr,WS_WatchDate,WS_Watch,WS_WatchArr
'''''''''''''''''''''''''''''''''''''''''''''''''WSOAS45'''''''''''''''''''''''
Dim FIELDNAME,GROUP_ID,send_no
Dim UserListName,UserListMoblie,ULID,WS_WatchHourDate
Dim WS_TCID,WS_TaskClass,WS_BCID,WS_BuildConsumablesClass,WS_TaskWarningHourDate,WS_TaskWarnedHourDate
Dim WS_BEID,BOID,WS_RCID,WS_ResearchInfoClass,BuildManageArr
Dim SystemCreatUser,SystemEditUser,SystemDelUser,WS_CodeArr

'******************************以下路径修改后请自行添加文件  请在后面加入"\"
Const NetDiskPath="../HX_UpLoadFile/UserFiles/"   '网络硬盘目录，为了安全最好是设置空间根目录上一级目录
Const EmailannexFilePath="../HX_UpLoadFile/Emailannex/"  '内部电邮附件存放地址;
Const EmailAttachmentsFilePath="../HX_UpLoadFile/Attachments/" '外部邮件下载附件存放地址
Const DocumentAnnex="../HX_UpLoadFile/DocumentAnnex/"  '文档资料存放地址
Const WorkFlowFilePath="../HX_UpLoadFile/workannex/"  '公文附件
Const BargainAnnex="../HX_UpLoadFile/BargainAnnex/"  '合同管理、外部邮件上传附件、法律法规附件存放地址
Const UserPhotoPath="../HX_UpLoadFile/UserPhotoPath/"      '安装师傅身份证图片
Const StockCategoryImage="../HX_UpLoadFile/StockCategoryImage/"  '库存分类图片
Const ToExcelPath="../HX_UpLoadFile/ToExcel/"          '导出Excel地址
Const ToMemberSendFilePath="../HX_UpLoadFile/MemberSendFile/"          '文件传送目录
Const AreaiconPath = "../HXIMAGES/Areaicon/"  '论坛图标地址
Const UpDataSystem="http://www.wygk.cn/SystemOA/"

Const DesignProjectDrawings="../HX_UpLoadFile/DesignProjectDrawings/"      '设计任务图纸地址
Const ProjectContract="../HX_UpLoadFile/ProjectContract/"      '任务合同附件地址
Const ProjectDrawing="../HX_UpLoadFile/ProjectDrawing/"      '设计任务图纸地址
Const AttendanceExcel="../HX_UpLoadFile/AttendanceExcel/"      '考勤Excel表保存地址
Const Contract="../HX_UpLoadFile/Contract/"         '合同管理附件
Const Custom="../HX_UpLoadFile/Custom/"         '自定义申请附件
Const SalesWorkDiary="../HX_UpLoadFile/SalesWorkDiary/"         '工作日志附件
Const Task="../HX_UpLoadFile/Task/"         '工作日志附件

'***********************End***********************************************************************************************
Set WS_S=NEW HX_SYSTEMCONFIG
HX_Conn Dir
CONST PREFIX="qq394488361"


%>