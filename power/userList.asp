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
  </style>

<link rel="stylesheet" href="/css/focus.css">
</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<!--#include file="../index/pagination.asp" -->
<%Dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
 rs.open "select * from login where exist=1",conn,1,1

If request("action")="search" Then
  rs.close
  Dim strSearch
  strSearch="select * from login where exist=1"
  If request.Form("searchAccount")<>"" Then
    strSearch=strSearch&" And loginname Like '%"&request.Form("searchAccount")&"%'"
  End If
  rs.open strSearch,conn,1,1
End If
%>

<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">�û��б�</a></li>
  </ul>
</div>

<section>
  <form action="?action=search" method="post">
  <label for="searchAccount">�û��˺ţ�</label>
  <input type="text" name="searchAccount" id="searchAccount"  value="<%=request.Form("searchAccount")%>">

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
    <th>Ȩ�޹���</th>
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
    <td><%=rs("loginName")%></td>
		<td><a href="setPower.asp?loginId=<%=rs("id")%>">����Ȩ��</a></td>
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
