
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
	c0.innerHTML=+obj.getElementsByTagName("u").length+1+'��<u><input type=file size=50 maxlength=50 name="pictures'+obj.getElementsByTagName("u").length+1+'" style="margin-left:1px;"/></u><a href="javascript:void(0)" onclick="removeRow(this)">[ɾ��]</a>';
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

     alert('һ��ֻ�����<%=5-int(request("i"))%>������!');
	 return false;
  }
}
function removeRow(fontobj)
{
	if(confirm("ȷ��ȡ��������?"))
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
  <td height="31"   align="left" style="font-size:16px;">&nbsp;�����ϴ�</td>
</tr>
	    <tr>
		<td align='center' >1��<u><input type="file"  style="MARGIN-LEFT: 1px" maxLength="50" size="50" name="pictures1" id="pictures1"  /></u><a href="#" onClick="addNewRow();" title="�������������ӵ������">[���]</a></td>
	    </tr>
		

</table>

<div align="center">
		 <input type="hidden" name="act" value="uploadfile">
		 <input type="hidden" name="key"  value="<%=WS_S.HX_Replace(request("key"))%>"/>
		 <input type="hidden" name="AnnexNo"  value="<%=WS_S.HX_Replace(request("AnnexNo"))%>" />
		<input type="submit" name="upload" value="�ϴ�"  />
</div>
 </form>
</body> 

<script type="text/javascript"> 

         function check() { 

             var file = document.getElementById('pictures1').value; 

             if (file == null || file == "") { 

                alert("�㻹û��ѡ���κ��ļ��������ϴ�!"); 

                return false; 

             } 

            //���������ϴ����ļ����� 

            //var allow_ext = ".jpg|.jpeg|.png|.gif|.bmp|.pdf|"; 

            //��ȡ�ϴ��ļ������� 

            //var ext_name = file.substring(file.lastIndexOf(".")); 

            //alert(ext_name); 

            //alert(ext_name + "|"); 

             //�ж��ϴ��ļ������Ƿ������ϴ� 

           // if (allow_ext.indexOf(ext_name + "|") == -1) { 

                //var errMsg = "���ļ��������ϴ������ϴ�" + allow_ext + "���͵��ļ�,��ǰ�ļ�����Ϊ��" + ext_name; 

                //alert(errMsg); 

               //return false; 

           //} 

        } 

     </script> 