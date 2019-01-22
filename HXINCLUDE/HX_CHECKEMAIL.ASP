<%
Class HX_SendMail
  function SendMail(Myemail,Topic,Emailannex,Body)
      smtpserver = WS_InternetSMTP '发送邮件所使用的SMTP服务器，例如smtp.163.com，请修改
      smtpuser = WS_InternetSendName '与SMTP服务器对应的邮箱用户名，请修改
      smtppwd = WS_InternetPassword '与SMTP服务器对应的邮箱密码，请修改
      smtpemail = WS_InternetEmail  'SMTP服务器发信邮箱，请修改
      email=WS_InternetEmail '用来接收邮件的邮箱，请修改,可以与SMTP服务器发信邮箱不同
      sendname = WS_InternetSendName '发件人名字
      mailbody=mailbody &"<style>A:visited {	TEXT-DECORATION: none	}"
	     mailbody=mailbody &"A:active  {	TEXT-DECORATION: none	}"
	     mailbody=mailbody &"A:hover   {	TEXT-DECORATION: underline	}"
	     mailbody=mailbody &"A:link 	  {	text-decoration: none;}"
	     mailbody=mailbody &"BODY   {	FONT-FAMILY: 宋体; FONT-SIZE: 9pt;}"
	     mailbody=mailbody &"TD	   {	FONT-FAMILY: 宋体; FONT-SIZE: 9pt	}</style>"
	     mailbody=mailbody &"<TABLE border=0 width='95%' align=center><TBODY><TR><TD>"
	     mailbody=mailbody &body
	     mailbody=mailbody &"</TD></TR></TBODY></TABLE>"
        if sendname <> "" and email <> "" then
		on error resume next
		set jmail= server.CreateObject ("jmail.message")
        jmail.Silent = true
       jmail.Charset = "GB2312"
       JMail.ContentType = "text/html"
       jmail.From = smtpemail
       jmail.FromName = sendname
       jmail.ReplyTo = email
       jmail.Subject = topic
       jmail.AddRecipient myemail
       jmail.Body = mailbody 
       jmail.MailServerUserName = smtpuser
       jmail.MailServerPassWord = smtppwd
	   if Emailannex<>"" then
	      Emailannex=BargainAnnex&Emailannex
	      JMail.AddAttachment server.mappath(Emailannex),True
	   end if
       isgo = jmail.Send(smtpserver)
	 	if isgo then
		     SendMail="“"&topic&"”已经发送成功。"
			 response.write "<script>alert('"&SendMail&"');window.close();</script>"
             response.end
		 else
		    SendMail = "邮件发送失败！请与管理员联系！\n\n 错误信息：\n"&Err.Description
			HX_GoBack SendMail,""
		 end if
	     jmail.Close
         set jmail = nothing
      end if
   End function
End Class
%>