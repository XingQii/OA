<%
Class HX_SearchFile 
   dim objFso '定义全局变量 
   dim Counter '定义全局变量，搜索结果的数目 
  Private Sub Class_Initialize 
           Set objFso=Server.CreateObject("Scripting.FileSystemObject") 
           Counter=0 '初始化计数器 
   End Sub 

   Private Sub Class_Terminate 
          Set objFso=Nothing 
   End Sub 

    Function Search(Folders)
          if keywords="" then 
             Response.Write("<font color='red'>关键字不能为空</font><br/>") 
             exit Function 
           end if
 
              Call GetAllFile(Folders) '调用循环递归函数 
              Response.Write("共搜索到<font color='red'>"&Counter&"</font>个结果") 
   End Function 

   Private Function GetAllFile(Folder) 
         dim objFd,objFs,objFf 
         Set objFd=objFso.GetFolder(Folder) 
         Set objFs=objFd.SubFolders 
         Set objFf=objFd.Files 

         dim strFdName '声明子文件夹名 
        ' on error resume next 
            For Each OneDir In objFs 
            strFdName=OneDir.Name 
               If strFdName<>"Config.Msi" EQV strFdName<>"RECYCLED" EQV strFdName<>"RECYCLER" EQV strFdName<>"System Volume Information" Then 
                  SFN=Folder&""&strFdName '绝对路径 
                  Call GetAllFile(SFN) '调用递归 
              End If 
            Next 
            dim strFlName 
           For Each OneFile In objFf 
               strFlName=OneFile.Name 
               If strFlName<>"desktop.ini" EQV strFlName<>"folder.htt" Then 
                   FN=Folder&""&strFlName 
                   Counter=Counter+ColorOn(FN) 
               End If 
           Next 

           Set objFd=Nothing 
           Set objFs=Nothing 
           Set objFf=Nothing 
  End Function 

  Private Function CreatePattern(keywords) 
           CreatePattern=keywords
           CreatePattern=Replace(CreatePattern,".",".") 
           CreatePattern=Replace(CreatePattern,"+","+") 
           CreatePattern=Replace(CreatePattern,"(","(") 
           CreatePattern=Replace(CreatePattern,")",")") 
           CreatePattern=Replace(CreatePattern,"[","[") 
           CreatePattern=Replace(CreatePattern,"]","]") 
           CreatePattern=Replace(CreatePattern,"{","{") 
           CreatePattern=Replace(CreatePattern,"}","}") 
           CreatePattern=Replace(CreatePattern,"*","[^\/]*") '*号匹配 
           CreatePattern=Replace(CreatePattern,"?","[^\/]{1}") '?号匹配 
           CreatePattern="("&CreatePattern&")+" '整体匹配 
  End Function 

  Private Function ColorOn(FileName) 
           dim objReg 
           Set objReg=new RegExp 
           objReg.Pattern=CreatePattern(keywords) 
           objReg.IgnoreCase=True 
           objReg.Global=True 
           retVal=objReg.Test(FileName) '进行搜索测试,如果通过则上色并输出 
           if retVal then 
              OutPut=objReg.Replace(FileName,"<font color='#FF0000'>$1</font>") '设置关键字的显示颜色 
              OutPut="<a href='#'>"&OutPut&"</a><br/>" 
               Response.Write(OutPut) 
              ColorOn=1 '加入计数器的数目 
           else 
               ColorOn=0 
           end if 
           Set objReg=Nothing 
  End Function 
End Class 


%>