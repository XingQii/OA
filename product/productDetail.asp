<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  <link rel="stylesheet" href="/css/focus.css">
  <style type="text/css">
    html{
      background-color: #F9ECD9;
    }
    fieldset{
      border: solid 1px orange;
      width: 90%;
      margin:1% auto;
      background-color: #FFFFF0;
  
    }
    legend{
      margin: 0;
      margin-left: 3%;
    }
    fieldset ul{
      padding-top: 2%;
    }
    fieldset ul li{
      padding:1% 0 1% 5%;
      
    }
    label{
      display: block;
      float: left;
      vertical-align: middle;
      width: 7%;
    
    }
    select,textarea{
      margin-left: 3%;
    }
    textarea{
      background-color:  #F9ECD9;
      border: solid 1px orange;
      width: 80%;
      height: 8%;
    }
    input[type="submit"],input[type='button']{
      background-color:orange ;
    
      width: 15%;
      height: 30px;
      display: inline-block;
      text-align: center;
      margin-bottom: 1%;
      margin-left: 5%;
    }
    fieldset ul li span{
    display: inline-block;
    width: 30%;
    }
    fieldset ul li label{
    width: 10%;
    }
    fieldset ul li select,fieldset ul li input,fieldset ul li textarea{
    margin-left: 0;
    padding-left: 0;
    }
    fieldset ul li select{
    border: 1px solid orange;
    height: 30px;
    }
    fieldset ul li textarea{
    background-color: white;
    }
    input.updateButton{
    background: none;
    border: 1px solid orange;
    }
  </style>
  


</head>

<body>
<!--#include virtual = "/index/connDB.asp"-->
<%
productId=request("productId")
If request("productId")="" Then
	response.Write "<script>alert('���ִ����Ҳ���Ҫ�鿴�Ĳ�Ʒ��');history.back()</script>;"
	response.end
Else
  set rs=Server.CreateObject("Adodb.RecordSet")
  rs.open "select * from product where id="&request("productId"),conn,1,1

End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="/index/index.asp">��ҳ</a></li>
  <li><a href="#" onClick="location.href='productList.asp'">��Ʒ�б�</a></li>
  <li><a href="#">�鿴��Ʒ</a></li>
  <li><a href="#">�����Դ��Ϣ</a></li>

  </ul>
  </div>
  <fieldset>
    <legend>
    
    </legend>
    <ul>
      <%If Not rs.EOf Then%>
      <li>
        <span>��Ʒ���ƣ�<%=rs("name")%></span>
        <span>��Ʒ��ţ�<%=rs("number")%></span>
        <span>��Ʒ���ͣ�<%=rs("category")%></span>

      </li>
        <li>
        <span>��Ʒ���Σ�<%If rs("batchId")<>"" Then
        Dim rsBatch
        set rsBatch=Server.CreateObject("ADODB.Recordset")
        rsBatch.open "select * from batch where id="&rs("batchId"),conn,1,1
        If Not rsBatch.Eof Then
          response.Write rsBatch("batch")
        End If
        End If
          %></span></li>
      <li>
        <span>���飺<%=rs("detail")%></span>
      </li>
      <%End IF%>
      <li>
        
        <input name="submit" id="submit" type="button" value="������һҳ" onClick="history.back()"/>
        <input type="button" onclick="location.href='productDocument.asp?productId=<%=rs("id")%>'" value="�鿴��Դ��Ϣ">
        <input type="button" onclick="location.href='updateProduct.asp?productId=<%=rs("id")%>'" value="�޸�">
      </li>
    </ul>
  </fieldset>
<!--#include virtual = "/index/functions.asp"-->



</body>

</html>
