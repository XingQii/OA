
<!--#INCLUDE virtual="/HXINCLUDE/HXINCLUDEHEAD.ASP"-->
<%
'=====================================
'此代码功能强大，经改动后可以用于各种图片上传及产品图片上传
'技术支持：QQ 757187785
'=====================================
%>

<!--#include file="upload_files.inc"-->
<%
dim  filenamez,AnnexNo,key,flg
function getex(filename)  '取图片后缀名
'getex = right(filename,(len(filename)-InStr(filename,".")))
getex = split(filename,".")(ubound(split(filename,".")))
End Function
function getname(filename)  '取图片后缀名
getname = split(filename,".")(0)
End Function



dim formPath,fname,getfilename
set upload=new upload_5xsoft
key=upload.form("key")
AnnexNo=upload.form("AnnexNo")
flg="true"

formPath="../qualityFiles/"   '目前是当前路径 可以改成 "./123/"


dim imgsize,imgnum
imgnum=0
imgsize=0
for each formName in upload.objFile
set file=upload.file(formName)
imgsize=imgsize+file.FileSize
imgnum=imgnum+1
if file.FileSize<=0 then
response.Write("<script language='javascript'>alert('无效文件');window.close();</script>")
response.End()
end if



set file=nothing

next
response.Write "<script>alert('您上传"&imgnum&"张附件，总大小"&imgsize/1024&"k，预计上传时间"&imgsize/1024/60&"秒');</script>"
for each formName in upload.objFile

set file=upload.file(formName)






if file.FileSize>0 then
fname = now()
fname = replace(fname,"-","")
fname = replace(fname,"/","")
fname = replace(fname," ","")
fname = replace(fname,":","")
fname = replace(fname,"PM","")
fname = replace(fname,"AM","")
fname = replace(fname,"上午","")
fname = replace(fname,"下午","")
fname = fname&Int((right(fname,4) - 0 + 1) * Rnd + 0)
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename)) '保存
filenamez=filenamez&formPath&fname&"."&getex(file.filename)
set rs1=WS_S.HX_SetRSD("","fileQuality","")
rs1.addnew
rs1("AnnexNo")=AnnexNo
rs1("AnnexName")=getname(file.filename)
rs1("AnnexUrl")=filenamez
rs1.update
end if
set file=nothing
i=i+1

next
if flg="true" then
    response.Write("<script language='javascript'>alert('上传成功');window.opener.location.reload();window.close();</script>") 
    response.End()
else
   response.Write("<script language='javascript'>window.close();</script>")
end if

%>
