<%
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

%>