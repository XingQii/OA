
<!--#INCLUDE virtual="/HXINCLUDE/HXINCLUDEHEAD.ASP"-->

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style>
	tbody tr:first-child{
		background-color: #FFCC00;
	}
	tbody{
		background-color: #F9ECD9;
	}
</style>
<script type="text/javascript" >
 
function addNewRow()
{
  var obj=document.getElementById('filearea');
  if(obj.getElementsByTagName("u").length<%=5-int(request("i"))%>)
  {
	

	var row=obj.insertRow(-1);

 
	var c0=row.insertCell(0);
	c0.innerHTML=+obj.getElementsByTagName("u").length+1+'、<u><input type=file size=50 maxlength=50 name="pictures'+obj.getElementsByTagName("u").length+1+'" style="margin-left:1px;"/></u><a href="javascript:void(0)" onclick="removeRow(this)">[删除]</a>';
	c0.align='center';


	changeFlag = true;
	try
	{
		comm_set_page_height();	
	}
	catch (e)
	{
	}
  }
  else
  {

     alert('一次只能添加<%=5-int(request("i"))%>个附件!');
	 return false;
  }
}
function removeRow(fontobj)
{
	if(confirm("确定取消该项吗?"))
	{
		var obj=document.getElementById('filearea');
		var n=fontobj.parentNode.parentNode.rowIndex;
		obj.deleteRow(n);
	}
}


</script>
 
<body>

<form action="poto_up.asp" method="post" enctype="multipart/form-data"  > 
<table cellpadding='2' cellspacing='1' border='0' id="filearea"  width="100%" height="160px;"  align='center' style=" border:1px solid #999; background:#edf9fe;">
<tr width="100%" bgcolor="#abe5fc" style="color:#000000;  font-weight:bold;">
  <td height="31"   align="left" style="font-size:16px;">&nbsp;附件上传</td>
</tr>
	    <tr>
		<td align='center' >1、<u><input type="file"  style="MARGIN-LEFT: 1px" maxLength="50" size="50" name="pictures1" id="pictures1"  /></u><a href="#" onClick="addNewRow();" title="点击后在上面添加的输入框">[添加]</a></td>
	    </tr>
		

</table>

<div align="center">
		 <input type="hidden" name="act" value="uploadfile">
		 <input type="hidden" name="key"  value="<%=WS_S.HX_Replace(request("key"))%>"/>
		 <input type="hidden" name="AnnexNo"  value="<%=WS_S.HX_Replace(request("AnnexNo"))%>" />
		<input type="submit" name="upload" value="上传"  />
</div>
 </form>
</body> 

<script type="text/javascript"> 

         function check() { 

             var file = document.getElementById('pictures1').value; 

             if (file == null || file == "") { 

                alert("你还没有选择任何文件，不能上传!"); 

                return false; 

             } 

            //定义允许上传的文件类型 

            //var allow_ext = ".jpg|.jpeg|.png|.gif|.bmp|.pdf|"; 

            //提取上传文件的类型 

            //var ext_name = file.substring(file.lastIndexOf(".")); 

            //alert(ext_name); 

            //alert(ext_name + "|"); 

             //判断上传文件类型是否允许上传 

           // if (allow_ext.indexOf(ext_name + "|") == -1) { 

                //var errMsg = "该文件不允许上传，请上传" + allow_ext + "类型的文件,当前文件类型为：" + ext_name; 

                //alert(errMsg); 

               //return false; 

           //} 

        } 

     </script> 