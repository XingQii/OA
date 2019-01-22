<%
'FileObject 类是一个对文件进行操作的类
'=========================================================================
	Class FileObject
		Private Fso,FileObj

'=========================================================================
'功能：初始化类
'参数：
'返回值：
'=========================================================================
		Private Sub Class_Initialize
			on error Resume Next
			Set Fso=Server.CreateObject("Scripting.FileSystemObject")
			Call ErrDispose("系统不支持FSO请与空间服务商联系！")
		End Sub

'
		Private Sub ErrDispose(Msg)
			If Err<>0 Then
			   Response.Write  "<script language=""Javascript"">"
			   Response.Write  " alert("""&"错误原因:\n  "&trim(Err.Source)&"\n\n错误类型:\n  "&trim(Err.Description)&""&"\n\n"&Msg&""");history.back();"
			   Response.Write  "</script>"
			   Err.Clear
			   Response.End()
			End If
		End Sub
'=========================================================================
'功能：将文本写入文件
'参数：须要写入到文件的文本内容
'返回值：
'=========================================================================
		Public Sub WriteText(Data)  
			FileObj.WriteLine(Data)
		End Sub

		Public Sub Write(Data)
			FileObj.Write(Data)
		End Sub
'=========================================================================
'功能：打开文件
'参数：IsNewFile 变量类型：Boolean，True 表示如果文件不存在，就创建文件，否则出错
'      ReadType 变量类型 Int，1 表示只读,2 表示写入,8 表示向文件追加内容
'返回值：
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
'功能：将二进制内容写入文件
'参数：须要写入到文件的二进制内容
'返回值：
'=========================================================================
		Public Sub WriteBinary(FilePath,BinaryData)  
			 on error Resume Next
			dim S_FilePath,Stream
			 S_filePath=FilePath
      		 Set Stream=Server.CreateObject("Adodb.Stream")
			 Call ErrDispose("服务器不支持adodb.stream,请与服务器空间商联系. ")
      		 Stream.Type=1
      		 Stream.Mode=3
      		 Stream.Open
			 Stream.Write BinaryData
			 Stream.SaveToFile S_FilePath
			 S_FilePath=Replace(S_FilePath,"\","\\")
			 Call ErrDispose("文件路径错误:\n  "&S_FilePath&"\n\n物理路径为:\n  "&NewPath&"\n\n 物理路径错误!")
			 Stream.Close
			 Set Stream=Nothing
		End Sub
		
'=========================================================================
'功能：复制文件
'参数：原文件路径,新路径
'返回值：
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
'功能：拷贝文件夹
'参数：文件夹的新路径
'返回值：
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
'功能：读文件
'参数：
'返回值：被读文件中所有的数据
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
'功能：以二进制来读文件
'参数：
'返回值：被读文件中所有的数据
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
'功能：返回一个文件夹对象
'参数：
'返回值：文件夹对象
'使用示例：
'1.获取
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
'功能：创建一个文件夹
'参数：
'返回值：
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
'功能：删除文件
'参数：
'返回值：
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
'功能：移动文件
'参数：
'返回值：
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
'功能：移动一个文件夹下面的所有文件
'参数：
'返回值：
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
'功能：移动文件夹
'参数：
'返回值：
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
'功能：改文件名
'参数：
'返回值：
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
'功能：改文件夹名
'参数：
'返回值：
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
'功能：删除某个文件夹下面的所有文件
'参数：
'返回值：
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
'功能：删除文件夹
'参数：
'返回值：
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
'判断某文件是否存在
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
'判断某文件夹是否存在
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
'列表目录和目录下的文件,
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