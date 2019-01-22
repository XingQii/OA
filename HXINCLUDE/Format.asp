<%
function HTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
    fString = Replace(fString, CHR(10), "<BR> ")

    fString=ChkBadWords(fString)
    HTMLEncode = fString
end if
end function


function ChkBadWords(fString)
    dim bwords,ii
    const badwords="妈妈的|fuck|bitch|他妈的|性爱|法轮|falundafa|falun|江泽民|操你妈|三级片|鸡吧|傻逼|傻B"
    if not(isnull(BadWords) or isnull(fString)) then
    bwords = split(BadWords, "|")
    for ii = 0 to ubound(bwords)
        fString = Replace(fString, bwords(ii), string(len(bwords(ii)),"*")) 
    next
    ChkBadWords = fString
    end if
end function


function UBBCode(strContent)
	
	dim re,i
	'strContent=encodestr(strContent)

	'strContent=funkillWord(strContent)
	UbbCode=strContent
	if (instr(strContent,"[")=0 or instr(strContent,"]")=0) and instr(strContent,"http://")=0 then
		exit function
	end if
	
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	
	if instr(1,strContent,"[IMG]",1)>0 then
		re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
		strContent=re.Replace(strContent,"<TABLE style=""TABLE-LAYOUT: fixed; WORD-WRAP: break-word"" cellSpacing=0   cellPadding=0 width=""100%""   border=0><TBODY><TR><TD vAlign=top width=""100%"" ><TABLE style=""TABLE-LAYOUT: fixed; WORD-WRAP: break-word""   cellSpacing=0 cellPadding=0 width=""100%"" border=0><TBODY><TR><TD><a href=$2 target=_black><img src=$2 border=0></a></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE> ")
	end if

	if instr(1,strContent,"[face]",1)>0 then
		re.Pattern="(\[face\])(.[^\[]*)(\[\/face\])"
		strContent=re.Replace(strContent,"<IMG SRC=images/face/$2.gif  border=0  > ")
	end if
	

		if instr(1,strContent,"[/dir]",1)>0 then
			re.Pattern="\[DIR=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/DIR]"
			strContent=re.Replace(strContent,"<object classid=clsid:166B1BCA-3F9C-11CF-8075-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0 width=$1 height=$2><param name=src value=$3><embed src=$3 pluginspage=http://www.macromedia.com/shockwave/download/ width=$1 height=$2></embed></object>")
		end if
		if instr(1,strContent,"[/qt]",1)>0 then
			re.Pattern="\[QT=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/QT]"
			strContent=re.Replace(strContent,"<embed src=$3 width=$1 height=$2 autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#000000 kioskmode=false targetcache=false pluginspage=http://www.apple.com/quicktime/>")
		end if
		if instr(1,strContent,"[/mp]",1)>0 then
			re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
			strContent=re.Replace(strContent,"<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>")
		end if
		if instr(1,strContent,"[/rm]",1)>0 then
			re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
			strContent=re.Replace(strContent,"<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>")
		end if
	if instr(1,strContent,"[flash]",1)>0 then
		re.Pattern="(\[FLASH\])(.[^\[]*)(\[\/FLASH\])"
		strContent= re.Replace(strContent,"<a href=""$2"" TARGET=_blank><IMG SRC=images/ubbpic/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")
	end if
	
	if instr(1,strContent,"[/url]",1)>0 then
		re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")
		re.Pattern="(\[URL=(.[^\]]*)\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")
	end if


	if instr(1,strContent,"[/email]",1)>0 then
		re.Pattern="(\[EMAIL\])(.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/email.gif> <A HREF=""mailto:$2"">$2</A>")
		re.Pattern="(\[EMAIL=(.[^\[]*)\])(.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/email.gif> <A HREF=""mailto:$2"">$3</A>")
	end if
	
	if instr(1,strContent,"http://",1)>0 then
		re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		
		re.Pattern = "([^>=""])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"ftp://",1)>0 then
		re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(ftp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"rtsp://",1)>0 then
		re.Pattern = "^(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(rtsp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"mms://",1)>0 then
		re.Pattern = "^(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(mms://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/ubbpic/url.gif> <a target=_blank href=$2>$2</a>")
	end if
	
	're.Pattern="(\[HTML\])(.+?)(\[\/HTML\])"
	'strContent=re.Replace(strContent,"<table width='100%' border='0' cellspacing='0' cellpadding='6' class=table002><td><b>以下内容为程序代码:</b><br>$2</td></table>")
	
	if instr(1,strContent,"[/color]",1)>0 then
		re.Pattern="(\[color=(.[^\[]*)\])(.[^\[]*)(\[\/color\])"
		strContent=re.Replace(strContent,"<font color=$2>$3</font>")
	end if
	if instr(1,strContent,"[/face]",1)>0 then
		re.Pattern="(\[face=(.[^\[]*)\])(.[^\[]*)(\[\/face\])"
		strContent=re.Replace(strContent,"<font face=$2>$3</font>")
	end if
	if instr(1,strContent,"[/align]",1)>0 then
		re.Pattern="(\[align=(.[^\[]*)\])(.[^\[]*)(\[\/align\])"
		strContent=re.Replace(strContent,"<div align=$2>$3</div>")
	end if
	
	if instr(1,strContent,"[/fly]",1)>0 then
		re.Pattern="(\[fly\])(.[^\[]*)(\[\/fly\])"
		strContent=re.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$2</marquee>")
	end if
	if instr(1,strContent,"[/move]",1)>0 then
		re.Pattern="(\[move\])(.[^\[]*)(\[\/move\])"
		strContent=re.Replace(strContent,"<MARQUEE scrollamount=3>$2</marquee>")	
	end if
	if instr(1,strContent,"[/glow]",1)>0 then
		re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
		strContent=re.Replace(strContent,"<table width=$1 style=""filter:glow(color=$2, strength=$3)"">$4</table>")
	end if
	if instr(1,strContent,"[/shadow]",1)>0 then
		re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
		strContent=re.Replace(strContent,"<table width=$1 style=""filter:shadow(color=$2, strength=$3)"">$4</table>")
	end if
	
	if instr(1,strContent,"[/i]",1)>0 then
		re.Pattern="(\[i\])(.[^\[]*)(\[\/i\])"
		strContent=re.Replace(strContent,"<i>$2</i>")
	end if
	if instr(1,strContent,"[/u]",1)>0 then
		re.Pattern="(\[u\])(.[^\[]*)(\[\/u\])"
		strContent=re.Replace(strContent,"<u>$2</u>")
	end if
	if instr(1,strContent,"[/b]",1)>0 then
		re.Pattern="(\[b\])(.[^\[]*)(\[\/b\])"
		strContent=re.Replace(strContent,"<b>$2</b>")
	end if
	
	if instr(1,strContent,"[/size]",1)>0 then
		re.Pattern="(\[size=1\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=1>$2</font>")
		re.Pattern="(\[size=2\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=2>$2</font>")
		re.Pattern="(\[size=3\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=3>$2</font>")
		re.Pattern="(\[size=4\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=4>$2</font>")
	end if
	
	if instr(1,strContent,"[/center]",1)>0 then
		re.Pattern="(\[center\])(.[^\[]*)(\[\/center\])"
		strContent=re.Replace(strContent,"<center>$2</center>")
	end if

	if instr(1,strContent,"[/list]",1)>0 then
		strContent = doCode(strContent, "[list]", "[/list]", "<ul>", "</ul>")
		strContent = doCode(strContent, "[list=1]", "[/list]", "<ol type=1>", "</ol id=1>")
		strContent = doCode(strContent, "[list=a]", "[/list]", "<ol type=a>", "</ol id=a>")
	end if
	if instr(1,strContent,"[/*]",1)>0 then
		strContent = doCode(strContent, "[*]", "[/*]", "<li>", "</li>")
	end if
	if instr(1,strContent,"[/code]",1)>0 then
		strContent = doCode(strContent, "[code]", "[/code]", "<pre id=code><font size=1 face=""Verdana, Arial"" id=code>", "</font id=code></pre id=code>")
	end if
  for i=0 to 31
	 re.Pattern="(\[em"&i&"\])"
	 strContent=re.Replace(strContent,"<img src=em/em"&i&".gif border=0 align=middle>")
  next

	set re=Nothing
	UBBCode=strContent
end function


Function FormatWord(ly)
ly=server.HTMLEncode(ly)
ly=Replace(ly, "'", "＇")
ly=Replace(ly, chr(13) & chr(10), "<br>")
ly=Replace(ly, chr(10), "<br>")
ly=Replace(ly, chr(13), "<br>")
ly=Replace(ly,CHR(32),"&nbsp;")
FormatWord=ly
End function


Sub TransTag(sTmp, iType)

	If Len(sTmp)=0 Then Exit Sub

    Dim sTag_Open
    Dim sTag_Close

    Select Case iType
        Case 1
            sTag_Open = "[quote]"
            sTag_Close = "[/quote]"

        Case 2
            sTag_Open = "[IMG]"
            sTag_Close = "[/IMG]"
        Case 3
            sTag_Open = "[EMB]"
            sTag_Close = "[/EMB]"
        Case 4
            sTag_Open = "[FACE]"
            sTag_Close = "[/FACE]"
        Case 5
            sTag_Open = "[url]"
            sTag_Close = "[/url]"
        Case 6
            sTag_Open = "[B]"
            sTag_Close = "[/B]"
        Case 7
            sTag_Open = "[i]"
            sTag_Close = "[/i]"
        Case 8
            sTag_Open = "[u]"
            sTag_Close = "[/u]"			
		
    End Select

    Dim iPos
    Dim iPosEnd

    Dim sPartL
    Dim sPartM
    Dim sPartR

    iPos = 1

    Do

        iPos = InStr(iPos, sTmp, sTag_Open, 1)

        If iPos > 0 Then
            iPosEnd = InStr(iPos, sTmp, sTag_Close, 1)

            If iPosEnd = 0 Then
                iPos = 0
            Else

                sPartL = Mid(sTmp, 1, iPos - 1)
                sPartM = Mid(sTmp, iPos + Len(sTag_Open), iPosEnd - iPos - Len(sTag_Open))
                sPartR = Mid(sTmp, iPosEnd + Len(sTag_Close))


                Select Case iType
                    Case 1
                        sTmp = sPartL & _
                               "<TABLE cellSpacing=0 cellPadding=0 width=""50%""  border=0 ><TBODY><TR><TD><TABLE cellSpacing=0 cellPadding=0 width=""100%""   border=0 ><TBODY><TR><TD width=75><TABLE  cellSpacing=0   cellPadding=0 width=50 border=0><TBODY><TR><TD width=28><IMG height=19  src=images/quote//quot-top-left.gif  width=28></TD><TD vAlign=center width=""100%""   background=images/quote//quote-bg.gif><SPAN class=smallfont>Quote:</SPAN></TD><TD width=14><IMG height=19 src=images/quote//quot-top-right.gif  width=14></TD></TR></TBODY></TABLE></TD><TD align=right width=""100%""><TABLE cellSpacing=0 cellPadding=0 width=""100%"" border=0 ><TBODY><TR><TD width=""100%""><TABLE cellSpacing=0 cellPadding=0 width=""100%""  border=0 ><TBODY><TR><TD width=""100%""  background=images/quote//quot-top-bg.gif></TD><TD align=right width=10><IMG height=19  src=images/quote//quot-top-right-10.gif  width=15></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><TABLE cellSpacing=0 cellPadding=0 width=""100%""   border=0 ><TBODY><TR><TD width=10  background=images/quote//quoting-left.gif></TD><TD vAlign=top width=""100%"" bgColor=#ffffff></TD><TD width=10 background=images/quote//quoting-right.gif></TD></TR><TR><TD width=10  background=images/quote//quot-left-bg.gif></TD><TD vAlign=top width=""100%""  bgColor=#ffffff><SPAN class=smallfont>"& sPartM &"</span></TD><TD width=10  background=images/quote//quot-right-bg.gif></TD></TR><TR><TD vAlign=top width=10><IMG height=15 src=images/quote//quot-bot-left.gif   width=15></TD><TD width=""100%"" background=images/quote//quot-bot-bg.gif></TD><TD vAlign=top width=10><IMG height=15  src=images/quote//quot-bot-right.gif   width=15></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>" & _
                               sPartR                
                


                    Case 2
                        sTmp = sPartL & _
                               "<TABLE style=""TABLE-LAYOUT: fixed; WORD-WRAP: break-word"" cellSpacing=0   cellPadding=0 width=""100%""   border=0><TBODY><TR><TD vAlign=top width=""100%"" ><TABLE style=""TABLE-LAYOUT: fixed; WORD-WRAP: break-word""   cellSpacing=0 cellPadding=0 width=""100%"" border=0><TBODY><TR><TD><a href='" & sPartM & "' target=_black>" & _
                               "<img src='" & sPartM & "' border='0'>" & _
                               "</a></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>" & _
                               sPartR

                    Case 3
                        sTmp = sPartL & _
                               "<a href='" & sPartM & "'   target=_black>" & sPartM & "</a>" & _
                               "<p><embed src='" & sPartM & "' width='440' height='380'></p>" & _
                               sPartR

                    Case 4
                        sTmp = sPartL & _
                               "<img src='images/face/" & sPartM & ".gif' border='0'>" & _
                               sPartR
                    Case 5
                        sTmp = sPartL & _
                               "<a href='" & sPartM & "'  target=_black>" & sPartM & "</a>" & _
                               sPartR

                    Case 6
                        sTmp = sPartL & _
                               "<b> "& sPartM & "</b>" & _
                               sPartR
                    Case 7
                        sTmp = sPartL & _
                               "<i> "& sPartM & "</i>" & _
                               sPartR
                    Case 8
                        sTmp = sPartL & _
                               "<u> "& sPartM & "</u>" & _
                               sPartR
                End Select


                iPos = iPosEnd + Len(sTag_Close)

            End If
        End If

    Loop While iPos > 0

End Sub
%>