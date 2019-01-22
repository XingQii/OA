<%
	Class Component
		Private sArrXMLHTTP,sArrXMLDOC
		Private objServer
		
		Private Sub Class_Initialize
			sArrXMLHTTP=Array("MSXML3.XMLHTTP","MSXML2.XMLHTTP","Microsoft.XMLHTTP","MSXML.XMLHTTP","MSXML2.ServerXMLHTTP")
			sArrXMLDOC=Array("MSXML3.DOMDocument","MSXML2.DOMDocument","Microsoft.DOMDocument","MSXML.DOMDocument","Microsoft.XMLDOM")
		End Sub
		
		Public Property Let Server(p_oServer)
			Set objServer=p_oServer
		End Property
		
		Public Function GetComponent(ByRef p_ObjVar,p_ObjSID)
			On Error Resume Next
			Err.Clear
			Set p_ObjVar=objServer.CreateObject(p_ObjSID)
			If Err<>0 Then
				Err.Clear
				GetComponent=False
			Else
				GetComponent=True
			End If
		End Function
		
		Public Function GetXMLHTTP(ByRef oXMLHTTP)
			Dim i
			oXMLHTTP=Empty
			For i=0 To Ubound(sArrXMLHTTP)
				If GetComponent(oXMLHTTP,sArrXMLHTTP(i)) Then
					GetXMLHTTP=True
					Exit Function
				End If
			Next
			GetXMLHTTP=False
		End Function
		
		Public Function GetXMLDOC(ByRef oXMLDOC)
			Dim i
			oXMLDOC=Empty
			For i=0 To Ubound(sArrXMLDOC)
				If GetComponent(oXMLDOC,sArrXMLDOC(i)) Then
					GetXMLDOC=True
					Exit Function
				End If
			Next
			GetXMLDOC=False
		End Function
	End Class
%>