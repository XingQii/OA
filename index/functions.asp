
<%

Function requestExist(key)
  If key="" Then
    response.Write "<script>alert('出现错误！找不到相关信息！');history.back()</script>;"
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
    response.Write "<script>alert('出现错误！找不到相关信息！');history.back()</script>;"
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
    Case 1 response.Write "肥料"
    Case 2 response.Write "农药"
    Case 3 response.Write "饲料"
  End Select
End Function

Function dealerType(typeNumber)
  Select Case typeNumber
    Case 1 response.Write "代理商"
    Case 2 response.Write "经销商"
    Case 3 response.Write "加盟商"
  End Select
End Function

Function sexType(intSex)
  Select Case intSex
    Case 1 response.Write "男"
    Case 2 response.Write "女"
  End Select
End Function

Function getLevel(intLevel)
  Select Case intLevel
    Case 1 response.Write "优秀"
    Case 2 response.Write "良好"
    Case 3 response.Write "中等"
    Case 4 response.Write "差"
    Case 5 response.Write "较差"
  End Select
End Function

Function ifSelected(selection,value)
  If value=selection Then
    response.Write "selected='selected'"
  End If
End Function

Function yesOrNo(bit)
  Select Case bit
    Case true response.Write "是"
    Case false response.Write "否"
  End Select
End Function

Function shipSingleOrBox(intS)
  Select Case intS
    Case 1 response.Write "单个发货"
    Case 2 response.Write "整箱发货"
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