<%
'FileObject ����һ�����ļ����в�������
'=========================================================================
	Class FileObject
		Private Fso,FileObj

'=========================================================================
'���ܣ���ʼ����
'������
'����ֵ��
'=========================================================================
		Private Sub Class_Initialize
			on error Resume Next
			Set Fso=Server.CreateObject("Scripting.FileSystemObject")
			Call ErrDispose("ϵͳ��֧��FSO����ռ��������ϵ��")
		End Sub

'
		Private Sub ErrDispose(Msg)
			If Err<>0 Then
			   Response.Write  "<script language=""Javascript"">"
			   Response.Write  " alert("""&"����ԭ��:\n  "&trim(Err.Source)&"\n\n��������:\n  "&trim(Err.Description)&""&"\n\n"&Msg&""");history.back();"
			   Response.Write  "</script>"
			   Err.Clear
			   Response.End()
			End If
		End Sub
'=========================================================================
'���ܣ����ı�д���ļ�
'��������Ҫд�뵽�ļ����ı�����
'����ֵ��
'=========================================================================
		Public Sub WriteText(Data)  
			FileObj.WriteLine(Data)
		End Sub

		Public Sub Write(Data)
			FileObj.Write(Data)
		End Sub
'=========================================================================
'���ܣ����ļ�
'������IsNewFile �������ͣ�Boolean��True ��ʾ����ļ������ڣ��ʹ����ļ����������
'      ReadType �������� Int��1 ��ʾֻ��,2 ��ʾд��,8 ��ʾ���ļ�׷������
'����ֵ��
'=========================================================================		
		Public Sub OpenFile(FilePath,IsNewFile,ReadType)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath
			Set FileObj=Fso.OpenTextFile(S_FilePath,ReadType,IsNewFile)
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("File path open error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub

		Public Sub CloseFile()
			FileObj.Close
   			Set FileObj=nothing
		End Sub
'=========================================================================
'���ܣ�������������д���ļ�
'��������Ҫд�뵽�ļ��Ķ���������
'����ֵ��
'=========================================================================
		Public Sub WriteBinary(FilePath,BinaryData)  
			 on error Resume Next
			dim S_FilePath,Stream
			 S_filePath=FilePath
      		 Set Stream=Server.CreateObject("Adodb.Stream")
			 Call ErrDispose("��������֧��adodb.stream,����������ռ�����ϵ. ")
      		 Stream.Type=1
      		 Stream.Mode=3
      		 Stream.Open
			 Stream.Write BinaryData
			 Stream.SaveToFile S_FilePath
			 S_FilePath=Replace(S_FilePath,"\","\\")
			 Call ErrDispose("�ļ�·������:\n  "&S_FilePath&"\n\n����·��Ϊ:\n  "&NewPath&"\n\n ����·������!")
			 Stream.Close
			 Set Stream=Nothing
		End Sub
		
'=========================================================================
'���ܣ������ļ�
'������ԭ�ļ�·��,��·��
'����ֵ��
'=========================================================================
		Public Function CopyFile(FilePath,NewPath)
			Dim CopyFileObj
			Dim inFilePath,inNewPath
			inFilePath=FilePath
			inNewPath=NewPath
			on error Resume Next
			Set CopyFileObj=Fso.GetFile(inFilePath)
			CopyFileObj.Copy inNewPath
			Set CopyFileObj=Nothing
			If Fso.FileExists(inNewPath) Then
				CopyFile=True
			Else
				CopyFile=False
			End If
			inFilePath=Replace(inFilePath,"\","\\")
			inNewPath=Replace(inNewPath,"\","\\")
			Call ErrDispose("DataBase path copy error:\n  "&inFilePath&"\n\nCopy to file physics path:\n  "&inNewPath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function



'=========================================================================
'���ܣ������ļ���
'�������ļ��е���·��
'����ֵ��
'=========================================================================
		Public Sub CopyFolder(FilePath,inNewPath)

			on error Resume Next
			dim S_FilePath,NewPath
			NewPath=inNewPath
			S_filePath=FilePath

			Dim CopyFileObj
			Set CopyFileObj=Fso.GetFolder(S_FilePath)
			'Response.Write(NewPath)
			CopyFileObj.Copy NewPath&"\"
			Set CopyFileObj=Nothing
			S_FilePath=Replace(S_FilePath,"\","\\")
			NewPath=Replace(NewPath,"\","\\")
			Call ErrDispose("Folder path copy error:\n  "&S_FilePath&"\n\nCopy to folder physics path:\n  "&NewPath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ����ļ�
'������
'����ֵ�������ļ������е�����
'=========================================================================
		Public Function ReadText(FilePath)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath

			Dim ReadFile,Read,ReadStr
			Set ReadFile = Fso.GetFile(S_FilePath)
			Set Read=ReadFile.OpenAsTextStream()
			ReadStr=Read.ReadAll
			Read.Close
			Set Read=Nothing
			Set ReadFile=Nothing
			ReadText=ReadStr
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("File path read error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function


'=========================================================================
'���ܣ��Զ����������ļ�
'������
'����ֵ�������ļ������е�����
'=========================================================================
		Public Function ReadBinary(FilePath)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath

			Dim Stream
			Set Stream=Server.CreateObject("Adodb.Stream")
			Stream.Type=1
			Stream.Mode=1
			Stream.Open
			Stream.LoadFromFile S_FilePath
			ReadBinary=Stream.Read
			Stream.Cancel
			Stream.Close
			Set Stream=Nothing
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("File path ReadBinary error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function


'=========================================================================
'���ܣ�����һ���ļ��ж���
'������
'����ֵ���ļ��ж���
'ʹ��ʾ����
'1.��ȡ
'=========================================================================
		Public Function GetFolder(FilePath)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath

    		 Set GetFolder=Fso.getFolder(S_FilePath)
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("File path get error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function


'=========================================================================
'���ܣ�����һ���ļ���
'������
'����ֵ��
'=========================================================================
		Public Sub CreateFolder(FilePath)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath

			Fso.CreateFolder S_FilePath
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("Create folder error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ�ɾ���ļ�
'������
'����ֵ��
'=========================================================================
		Public Sub DeleteFile(FilePath)
			on error Resume Next
			dim S_FilePath
			S_filePath=FilePath
			 Fso.DeleteFile S_FilePath
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("Delete File error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ��ƶ��ļ�
'������
'����ֵ��
'=========================================================================
		Public Sub MoveFile(FilePath,inNewPath)
			on error Resume Next
			dim S_FilePath,NewPath
			NewPath=inNewPath
			S_filePath=FilePath

			Fso.MoveFile S_FilePath,NewPath
			S_FilePath=Replace(S_FilePath,"\","\\")
			NewPath=Replace(NewPath,"\","\\")
			Call ErrDispose("Old file physics path:\n  "&S_FilePath&"\n\nMove to file physics path:\n  "&NewPath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub

'=========================================================================
'���ܣ��ƶ�һ���ļ�������������ļ�
'������
'����ֵ��
'=========================================================================
		Public Sub MoveAllFile(FilePath,inNewPath)
			on error Resume Next
			dim S_FilePath,NewPath
			NewPath=inNewPath
			S_filePath=FilePath
			
			Fso.MoveFile S_FilePath&"\*.*",NewPath
			S_FilePath=Replace(S_FilePath,"\","\\")
			NewPath=Replace(NewPath,"\","\\")
			Call ErrDispose("Old file physics path:\n  "&S_FilePath&"\n\nMove to file physics path:\n  "&NewPath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub
		
		
'=========================================================================
'���ܣ��ƶ��ļ���
'������
'����ֵ��
'=========================================================================
		Public Sub MoveFolder(FilePath,inNewPath)
			on error Resume Next
			dim S_FilePath,NewPath
			NewPath=inNewPath
			S_filePath=FilePath
			Fso.MoveFolder S_FilePath,NewPath
			S_FilePath=Replace(S_FilePath,"\","\\")
			NewPath=Replace(NewPath,"\","\\")
			Call ErrDispose("Old file physics path:\n  "&S_FilePath&"\n\nMove to file physics path:\n  "&NewPath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ����ļ���
'������
'����ֵ��
'=========================================================================
		Public Sub RenameFile(FilePath,OldName,NewName)
			Dim S_FilePath,oldFile,NewFile,isCopyOK
			on error Resume Next
			S_filePath=FilePath
			isCopyOK=false
			if S_filePath&""="" then S_FilePath=replace(server.MapPath("tmpfldpp"),"\tmpfldpp","")
			oldFile=S_FilePath&"\"&oldName
			NewFile=S_filePath&"\"&NewName
			oldFile=replace(oldFile,"\\","\")
			NewFile=replace(NewFile,"\\","\")
			If FileExists(oldFile) Then
				isCopyOK=CopyFile(oldFile,NewFile)
			Else
				Exit Sub
			End If
			if isCopyOK then
				call DeleteFile(oldFile)
			else
				oldFile=replace(oldFile,"\","\\")
				Call ErrDispose("Rename File error:\n  "&oldFile&"\n\nCopy file error!")
			end if
			oldFile=replace(oldFile,"\","\\")
			Call ErrDispose("Rename File error:\n  "&oldFile&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub

'=========================================================================
'���ܣ����ļ�����
'������
'����ֵ��
'=========================================================================

		Public Sub RenameFolder(FilePath,OldName,NewName)
			on error Resume Next
			dim S_FilePath,inOldName,inNewName
			S_FilePath=FilePath
			inOldName=oldName
			inNewName=NewName
			Fso.MoveFolder S_FilePath&"\"&inOldName,S_FilePath&"\"&inNewName
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("Rename Folder error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ�ɾ��ĳ���ļ�������������ļ�
'������
'����ֵ��
'=========================================================================
		Public Sub DeleteAllFile(FilePath)
			on error Resume Next
			dim S_FilePath
			S_FilePath=FilePath
			 Fso.DeleteFile S_FilePath&"\*.*"
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("Delete Files error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub


'=========================================================================
'���ܣ�ɾ���ļ���
'������
'����ֵ��
'=========================================================================
		Public Sub DeleteFolder(FilePath)
			on error Resume Next
			dim S_FilePath
			S_FilePath=FilePath
			Fso.DeleteFolder S_FilePath
			S_FilePath=Replace(S_FilePath,"\","\\")
			Call ErrDispose("Delete folder error:\n  "&S_FilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Sub
	
		Public Function FileExists(FilePath)
			on error Resume Next
			dim inFilePath
			inFilePath=FilePath
			FileExists=Fso.FileExists(inFilePath)
			inFilePath=Replace(inFilePath,"\","\\")
			Call ErrDispose("File Exists error:\n  "&inFilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function
		
		Public Function FolderExists(FilePath)
			on error Resume Next
			dim inFilePath
			inFilePath=FilePath
			FolderExists=Fso.FolderExists(inFilePath)
			inFilePath=Replace(inFilePath,"\","\\")
			Call ErrDispose("Folder Exists error:\n  "&inFilePath&"\n\nThe error processing method:\n  Please get in touch with server manager, please check your popedom!or file physics path is error!")
		End Function
	
		Private Sub Class_Terminate
				Set Fso=Nothing
		End Sub
		
	
'========================
'�ж�ĳ�ļ��Ƿ����
'========================
		Public  Function  Testfile(filename)
   	        on error Resume Next
			dim path
			if instr(filename,":\")<>0 then
			  path=filename
			else
			  path=server.MapPath(FileName)
			end if
			path=Fso.Getfile(path)
			set fs=nothing
			if err.Number<>0 then
			  Testfile=False
			else
			  Testfile=True
			end if

		End  Function
'========================
'�ж�ĳ�ļ����Ƿ����
'========================
		Public  Function  TestFolder(FolderName)
   	        on error Resume Next
			dim path
			if instr(FolderName,":\")<>0 then
			  path=FolderName
			else
			  path=server.MapPath(FolderName)
			end if
			if Fso.FolderExists(Path) then
				TestFolder=True
			else
				TestFolder=False
			end If
		End  Function

'=========================
'�б�Ŀ¼��Ŀ¼�µ��ļ�,
'=========================		
		PubLic Function Dir(FolderPath)
			dim Folder,inPath,FolderCount,FileCount,List,ArrayMax,i,F1,F2
			inPath=FolderPath
			if inPath&""="" then inPath=replace(server.MapPath("tmpfldpp"),"\tmpfldpp","")
			if instr(inPath,":\")=0 then inPath=Server.MapPath(inPath)
			if TestFolder(inPath) then
				set Folder=Fso.GetFolder(inPath)
				FolderCount=Folder.SubFolders.Count
				FileCount=Folder.Files.Count
				if FolderCount>FileCount then
					ArrayMax=FolderCount
				else
					ArrayMax=FileCount
				end If
				Redim List(1,ArrayMax)
				i=1
				for each F1 In Folder.SubFolders
					List(0,i)=F1.Name
					i=i+1
				Next
				i=1
				for each F2 In Folder.Files
					List(1,i)=F2.Name
					i=i+1
				Next
				Dir=List
			Else
				Response.write "Error:Folder path """&inPath&""" not found!"
				Response.end()
			End If
		End Function
	End Class
%>