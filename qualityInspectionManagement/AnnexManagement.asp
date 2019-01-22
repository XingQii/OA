
<!--#INCLUDE virtual="/HXINCLUDE/HXINCLUDEHEAD.ASP"-->

<%
dim CompleteProjectImg,CompleteProjectImg1
ColumnName="":Tablename="fileQuality" :Orderby=" where AnnexNo='"&request("AnnexNo")&"'"

set rs=WS_S.HX_SetRSD(ColumnName,Tablename,Orderby)
if request("action")="del" then
 set rs=WS_S.HX_SetRSD(ColumnName,Tablename," where id="&request("id")&"") 
 rs.delete
 rs.update
 response.Write "<script>alert('删除成功');location.href='AnnexManagement.asp?AnnexNo="&request("AnnexNo")&"'</script>"
 response.End()
end if 
i=0
%>
<style type="text/css">
<!--
.STYLE2 {color: orange}
-->
  tbody{
    background-color: #F9ECD9;
  
  
  }
  tr:nth-child(2){
  background-color: white;
  
  }
  input[type="button"]{
    background-color: #FF9900;
    padding:0;
    width: 100px;
    margin: 2% 0 2% 0;
  }
  table{
    border: 1px solid orange;
    width: 200px;
  }
  tbody tr:last-child td,tbody tr:first-child td{
    padding: 0 ;
    background-color: #FFCC00;
  }
  tbody tr:first-child td{
    color:white;
  }
  
  
  
</style>
<head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<title>附件查看</title></head>
<body>
<br />
<table cellpadding='2' cellspacing='1' border='0'   align='center' style=" border:1px solid #F9ECD9; ">
<tr width="100%" bgcolor="#abe5fc" style="color:#000000;  font-weight:bold;">
  <td height="31" colspan="2"  width="100%" align="left" style="font-size:16px;">&nbsp;附件查看</td>
</tr>
    <%
if rs.recordcount<=0 then
%>
    <tr>
      <td colspan=12 class="titletdbg" height=25 align=center> 无附件信息！</td>
    </tr>
    <%
else
     i=0
	    do while not rs.eof 
	   %>
	  <tr style="border:1px solid #999; background:#fff;" align="center">
      <td width='456px' height="60px" align=center>

	 <a href="<%=rs("AnnexUrl")%>" target="_blank" ><%=rs("AnnexName")%></a>
	 <br>
	  <input type="button" value="修改附件" name="attach" id="attach" style="background:url(../HXIMAGES/UploadImg.png); border:0; color:#FFFFFF; width:105px; height:24px;" onClick="window.open('AnnexModify.asp?id=<%=rs("id")%>&AnnexNo=<%=request("AnnexNo")%>','','status=no,scrollbars=no,top=400,left=410,width=660,height=200')" class="button">
	&nbsp;&nbsp;&nbsp;&nbsp;
      <%response.Write "<input type='button' class='button' style=""background:url(../HXIMAGES/UploadImgDel.png); border:0; color:#FFFFFF; width:105px; height:24px;"" value='删除附件'  onclick=""del("&rs("id")&","&request("AnnexNo")&")"">"
  %></td>
     <td width="10px;">&nbsp;</td>
	</tr>
  <%
     i=i+1
     rs.movenext
	 loop
	end if
	%>
	<tr class=titletdbg align=center> 
      <td  align="center" colspan="2"><input type="button" value="添加附件" style="border:0; color:#FFFFFF;  height:24px;" name="attach" id="attach" onClick="window.open('AnnexAdd.asp?AnnexNo=<%=request("AnnexNo")%>&i=<%=i%>','','status=no,scrollbars=no,top=100,left=210,width=640,height=250')" class="button"></td>
    </tr>
</table>
<script language="javascript" type="text/javascript">
function del(id,AnnexNo)
{
   if(!confirm('确认要删除此附件信息吗？')) 
   {
     return false;
   }
   else
   {
      location.href='AnnexManagement.asp?action=del&id='+id+'&AnnexNo='+AnnexNo+''
	  return true;
   }
}
</script>