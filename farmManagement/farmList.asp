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
    table-layout: fixed;
    }


  </style>


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%Dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from farm where exist=1 ",conn,1,1
%>

<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">��ͥũ���б�</a></li>
  </ul>
</div>
 <%
		if rs.recordcount=0 then
	  response.write "<div>������Ϣ</div>"
	else
	%>

<table class="tablelist">
  <thead>
  <tr>
    <th>ũ�����</th>
    <th>ũ������λ��</th>
    <th>��ǰũ������Ʒ����</th>
    <th>ũ������</th>
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
	do while not rs.EOF
%>
     <tr>
    <td><%=rs("farmNumber")%></td>
    <td><%=rs("farmPlace")%></td>
    <td><%=rs("farmProductNumber")%></td>
    <td><%=rs("farmName")%></td>
    <td>
    <a href="farmDetail.asp?farmId=<%=rs("id")%>">�鿴</a>
    <a href="reviseFarm.asp?farmId=<%=rs("id")%>">�޸�</a>
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
  	<%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "leavelist.asp")
			Response.Write ps
		%>
  
</div>
  <%end if%>

</body>
</html>
