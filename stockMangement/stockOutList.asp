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
    div.ltitle{
    line-height: 40px;
    font-weight: bold;
    margin-left: 12px;
    color: #dc4e00;
    background-color: orange;
    }


  </style>


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<!--#include virtual="/index/pagination.asp" -->
<%Dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from stockOut where exist=1 ",conn,1,1
%>

<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">�����¼</a></li>
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
    <th>Ͷ��Ʒ����</th>
    <th>Ͷ��Ʒ����</th>
    <th>Ͷ������</th>
    <th>��Ӧ��Ʒ���</th>
    <th>��Դ</th>
    <th>����</th>
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
    <td><%call inputType(rs("type"))%></td>
    <td><%=rs("name")%></td>
    <td><%=rs("stockOutDate")%></td>
    <td><%=rs("productNumber")%></td>
    <td><%=rs("source")%></td>
    <td><%=rs("quantity")&rs("unit")%></td>
    <td><a href="stockOutDetail.asp?stockOutId=<%=rs("id")%>">�鿴</a>
    <a href="reviseStockOut.asp?stockOutId=<%=rs("id")%>">�޸�</a></td>
    </tr>
    <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		loop
		%>
<!--#include virtual = "/index/functions.asp"-->
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
