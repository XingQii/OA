
<!--#INCLUDE virtual="/HXINCLUDE/HXINCLUDEHEAD.ASP"-->
<%
'=====================================
'�˴��빦��ǿ�󣬾��Ķ���������ڸ���ͼƬ�ϴ�����ƷͼƬ�ϴ�
'����֧�֣�QQ 757187785
'=====================================
%>

<!--#include file="upload_files.inc"-->
<%
dim  filenamez,AnnexNo,key,flg
function getex(filename)  'ȡͼƬ��׺��
'getex = right(filename,(len(filename)-InStr(filename,".")))
getex = split(filename,".")(ubound(split(filename,".")))
End Function
function getname(filename)  'ȡͼƬ��׺��
getname = split(filename,".")(0)
End Function



dim formPath,fname,getfilename
set upload=new upload_5xsoft
key=upload.form("key")
AnnexNo=upload.form("AnnexNo")
flg="true"

formPath="../qualityFiles/"   'Ŀǰ�ǵ�ǰ·�� ���Ըĳ� "./123/"


dim imgsize,imgnum
imgnum=0
imgsize=0
for each formName in upload.objFile
set file=upload.file(formName)
imgsize=imgsize+file.FileSize
imgnum=imgnum+1
if file.FileSize<=0 then
response.Write("<script language='javascript'>alert('��Ч�ļ�');window.close();</script>")
response.End()
end if



set file=nothing

next
response.Write "<script>alert('���ϴ�"&imgnum&"�Ÿ������ܴ�С"&imgsize/1024&"k��Ԥ���ϴ�ʱ��"&imgsize/1024/60&"��');</script>"
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
fname = replace(fname,"����","")
fname = replace(fname,"����","")
fname = fname&Int((right(fname,4) - 0 + 1) * Rnd + 0)
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename)) '����
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
    response.Write("<script language='javascript'>alert('�ϴ��ɹ�');window.opener.location.reload();window.close();</script>") 
    response.End()
else
   response.Write("<script language='javascript'>window.close();</script>")
end if

%>
