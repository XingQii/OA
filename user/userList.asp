<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    td{
    text-align: center;
  
    width: 100%;
    word-break: keep-all;
    white-space:nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    }
    tbody tr:nth-child(even){
    background: #F9ECD9;
    }
    .tablelist th{
    vertical-align: middle;
    text-align: center;
  
    }
    table{
    table-layout:fixed;
    }

     section{
     margin: 5px 0 5px 2%;
     }
     section input[type="submit"]{
     background-color: orange;
     padding: 0 8px 0 8px;
     margin-left: 1%;
     }
     section select{
     border: orange 1px solid;
     height:30px ;
     width: 10%;
     }

  </style>
<link rel="stylesheet" href="/css/focus.css">

</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<!--#include file="../index/pagination.asp" -->
<%Dim rs
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "select * from login",conn,1,3
If request("deleteId")<>"" Then
	rs.close 
	rs.open "select * from login where id="&request("deleteId"),conn,1,3
	rs("exist")=0
	rs.Update
	response.Write "<script>alert('ɾ���ɹ���');location.href='userList.asp'</script>"
End If
If request("reuseId")<>"" Then
	rs.close
	rs.open "select * from login where id="&request("reuseId"),conn,1,3
	rs("exist")=1
	rs.Update
	response.Write "<script>alert('�ָ��ɹ���');location.href='userList.asp'</script>"
End If
If request("action")="search" Then
  rs.close
  Dim strSearch
  strSearch="select * from login where 1=1"
  If request.Form("searchAccount")<>"" Then
    strSearch=strSearch&" And loginname Like '%"&request.Form("searchAccount")&"%'"
  End If
  If request.Form("searchName")<>"" Then
    strSearch=strSearch&" And username Like '%"&request.Form("searchName")&"%'"
  End If
  If request.Form("searchExist")<>"" Then
    strSearch=strSearch&" And exist="&request.Form("searchExist")
  End If
  rs.open strSearch,conn,1,1
End If
%>

<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�û��б�</a></li>
  </ul>
</div>

<section>
  <form action="?action=search" method="post">
  <label for="searchAccount">�û��˺ţ�</label>
  <input type="text" name="searchAccount" id="searchAccount"  value="<%=request.Form("searchAccount")%>">
  <label for="searchName">�û����ƣ�</label>
  <input type="text" name="searchName" id="searchName"  value="<%=request.Form("searchName")%>">
  <label for="searchExist">�û�״̬��</label>
  <select name="searchExist" id="searchExist">
  <option value="">ȫ��״̬</option>
  <option value="1" <%If request.Form("searchExist")<>"" Then
  If Cint(request.Form("searchExist"))=1 Then response.Write "selected='selected'"
  End If%>>����</option>
  <option value="0" <%If request.Form("searchExist")<>"" Then
  If Cint(request.Form("searchExist"))=0 Then response.Write "selected='selected'"
  End If%>>������</option>
</select>
  <input type="submit" value="����">
  </form>
</section>
 <%
		if rs.recordcount=0 then
	  response.write "<div>������Ϣ</div>"
	else
	%>

<table class="tablelist">
  <thead>
  <tr>
    <th>�û��˺�</th>
    <th>�û�����</th>
    <th>�û�״̬</th>
    <th>����</th>
  </tr>
  </thead>
  <tbody>
     <%
		i=0
		rs.PageSize =12 'ÿҳ��¼����
		iCount=rs.RecordCount '��¼����
		iPageSize=rs.PageSize
		maxpage=rs.PageCount 
		page=request("page")  
		if Not IsNumeric(page) or page="" then
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
		

	k=0
	do while not rs.EOF %>
     <tr>
     <td><%=rs("loginname")%></td>
     <td><%=rs("username")%></td>
     <td><%Select Case rs("exist")
     Case 0 response.Write "������"
     Case true response.Write "����"
     End Select%></td>
				 <td>
				 <a href="updateUser.asp?userId=<%=rs("id")%>">�޸��˻�������������</a>
				 <%Select Case rs("exist")
            Case true%><a href="userList.asp?deleteId=<%=rs("id")%>">ʹ������</a>
            <%Case false%><a href="userList.asp?reuseId=<%=rs("id")%>">ʹ����</a>
            <%End Select%>
				 </td>
     </tr>
    <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		loop
		%>
     
  </tbody>
</table>
<div style="text-align:center">
  	<%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "")
			Response.Write ps
		%>
</div>
<%end if%>
</body>
</html>
