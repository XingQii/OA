
<%

Function requestExist(key)
  If key="" Then
    response.Write "<script>alert('���ִ����Ҳ��������Ϣ��');history.back()</script>;"
    response.end
  End If
End Function
Function requestExistAndAlert(key,alertText)
  If key="" Then
    response.Write "<script>alert('"&alertText&"');history.back()</script>;"
    response.end
  End If
End Function

Dim rsCheck
set rsCheck=Server.CreateObject("ADODB.Recordset")

Function recordSetExist(rsCheck)
  If rsCheck.Eof Then
    response.Write "<script>alert('���ִ����Ҳ��������Ϣ��');history.back()</script>;"
    response.end
  End If
End Function

Function rsExistAndAlert(rsCheck,alertText)
  If rsCheck.Eof Then
    response.Write "<script>alert('"&alertText&"');history.back()</script>;"
    response.end
  End If
End Function



Function inputType(typeNumber)
  Select Case typeNumber
    Case 1 response.Write "����"
    Case 2 response.Write "ũҩ"
    Case 3 response.Write "����"
  End Select
End Function

Function dealerType(typeNumber)
  Select Case typeNumber
    Case 1 response.Write "������"
    Case 2 response.Write "������"
    Case 3 response.Write "������"
  End Select
End Function

Function sexType(intSex)
  Select Case intSex
    Case 1 response.Write "��"
    Case 2 response.Write "Ů"
  End Select
End Function

Function getLevel(intLevel)
  Select Case intLevel
    Case 1 response.Write "����"
    Case 2 response.Write "����"
    Case 3 response.Write "�е�"
    Case 4 response.Write "��"
    Case 5 response.Write "�ϲ�"
  End Select
End Function

Function ifSelected(selection,value)
  If value=selection Then
    response.Write "selected='selected'"
  End If
End Function

Function yesOrNo(bit)
  Select Case bit
    Case true response.Write "��"
    Case false response.Write "��"
  End Select
End Function

Function shipSingleOrBox(intS)
  Select Case intS
    Case 1 response.Write "��������"
    Case 2 response.Write "���䷢��"
  End Select
End Function


Function alertAJump(strAlert,strUrl)
  If strAlert<>"" And strUrl<>"" Then
  response.Write "<script>alert('"&strAlert&"');location.href='"&strUrl&"';</script>"
  End if
End Function

Function writeJS(strScript)
  response.Write "<script>"&strScript&"</script>"
End Function

Function writeExist(strWrite)
If strWrite<>"" Then
  response.Write strWrite
End If
End Function

Function produceRND()
randomize
Dim strRandomNumber
strRandomNumber=replace(Now(),"/","")
strRandomNumber=replace(strRandomNumber,":","")
strRandomNumber=replace(strRandomNumber," ","")
strRandomNumber=strRandomNumber&Cint(Rnd*10000)
produceRND=strRandomNumber
End Function


%>