<!--#INCLUDE FILE="../HXINCLUDE/HX_CONNDATABASE.ASP"-->
<!--#INCLUDE FILE="../HXINCLUDE/HX_Md5.ASP"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<title>�ޱ����ĵ�</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery.js"></script>
  
  <style type="text/css">
    select{
      width: 10%;
    }
    input,select{
      top: 3px;
      cursor: pointer;
      height: 28px;
      border: orange 1px solid;
    }
    form li {
      margin: 25px 0 25px 40px;
    }
    input,textarea{
      
      vertical-align: middle;
      border: orange 1px solid;
    }
    input{
      width: 20%;
    }
    form li:last-child{
      width: 70%;
      text-align: center;
    }
    input::-webkit-inner-spin-button {
      display: none;
    }
    .forminfo li label{
      width: 15%;
    }
     input[type="submit"]{
    background-color: #f74f1d	;
    border: none;
    }
  </style>
  <link rel="stylesheet" href="/css/focus.css">
  <script type="text/javascript">
    
    $(function () {
      var dateNow=new Date();
      dateNow=dateNow.toJSON().slice(0,16);
      $("#meetingTime").attr("value",dateNow);

    });
  </script>
  <link rel="stylesheet" href="../css/focus.css">

</head>

<body>
<%

If request("action")="add" Then
	If md5(request.Form("confirmPassword"))<>md5(request.Form("loginPassword")) Then
		response.Write "<script>alert('�������벻��ȣ����������룡');history.back();</script>"
	Else
  Dim rsAdd
  set rsAdd =Server.CreateObject("Adodb.RecordSet")
  rsAdd.open "select * from login",conn,1,3
  rsAdd.AddNew
  rsAdd("loginname")=request.Form("loginname")
  rsAdd("password")=md5(request.Form("loginPassword"))
  rsAdd("username")=request.Form("username")
  rsAdd.Update
  response.Write "<script>alert('�ύ�ɹ�');location.href='userList.asp';</script>"
  End If
End If
%>

	<div class="place">
  <span>λ�ã�</span>
  <ul class="placeul">
  <li><a href="#">��ҳ</a></li>
  <li><a href="#">����û�</a></li>
  </ul>
  </div>

  
    <form action="?action=add" method="post">
      <ul class="forminfo">
  
        <li><label for="loginname">�û��˺�</label><input type="text" name="loginname" id="loginname" required></li>
        <li>
          <label for="loginPassword">�û�����</label><input type="password" id="loginPassword" name="loginPassword" required>
        </li>
        <li>
          <label for="confirmPassword">ȷ������</label><input type="password" id="confirmPassword" name="confirmPassword" required>
        </li>
        <li><label for="username">�û�����</label><input type="text" name="username" id="username" required></li>
        <li><input name="submit" id="submit" type="submit" class="btn" value="�ύ"/></li>
      </ul>

    </form>



</body>

</html>
