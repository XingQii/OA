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
    
  input[type="button"],form input[type=submit]{
  background-color: orange;
  width: 10%;
  height: 30px;
  vert-align: middle;
  margin: 5px;
  }
  section{
  margin-left: 2%;
  }
  section form select{
  width: 10%;
  }
  input,select{
    cursor: pointer;
    height: 28px;
    border: orange 1px solid;
  }
  .forminfo input[type="submit"]{
  background-color: #f74f1d	;
  border: none;
  }

  select{
  border: 1px solid orange;
  height: 30px;
  }
  </style>

<link rel="stylesheet" href="/css/focus.css">
</head>

<body>
<!--#include file = "../index/connDB.asp"-->
<!--#include file="../index/pagination.asp" -->
<%Dim rs,rsLevel
 set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "select * from dealer order by id desc",conn,1,1


%>

<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#">�̼��б�</a></li>
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
    <th>�̼�����</th>
    <th>�̼�����</th>
    <th>���۲�Ʒ���</th>
    <th>�Ƿ����</th>
    <th>����</th>
    <th>�鿴����</th>
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
	Do while not rs.EOF %>
     <tr>
    <td><%=rs("dealerName")%></td>
    <td><%dealerType rs("dealerType")%></td>
    <td><%=rs("productType")%></td>

    <td><%Select Case rs("whetherCooperation")
    Case true response.Write "��"
    Case false response.Write "��"
    End Select%></td>

    <td><%getLevel rs("level")%></td>
     <td>
       <a href="dealerDetail.asp?dealerId=<%=rs("id")%>">�鿴����</a>
      <a href="updateDealer.asp?dealerId=<%=rs("id")%>">�޸�</a>

     </td>
    </tr>
  <%
		k=k+1
		if k>=rs.PageSize then Exit Do
		rs.movenext
		Loop
		%>
     
  </tbody>
</table>
<div style="text-align:center">
  	<%  ps = getPaginationString(page, iCount, rs.PageSize, 2, "")
			Response.Write ps
		%>
</div>
<%end if%>
<!--#include virtual = "/index/functions.asp"-->

</body>
</html>
