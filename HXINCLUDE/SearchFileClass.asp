<%
Class HX_SearchFile 
   dim objFso '����ȫ�ֱ��� 
   dim Counter '����ȫ�ֱ����������������Ŀ 
  Private Sub Class_Initialize 
           Set objFso=Server.CreateObject("Scripting.FileSystemObject") 
           Counter=0 '��ʼ�������� 
   End Sub 

   Private Sub Class_Terminate 
          Set objFso=Nothing 
   End Sub 

    Function Search(Folders)
          if keywords="" then 
             Response.Write("<font color='red'>�ؼ��ֲ���Ϊ��</font><br/>") 
             exit Function 
           end if
 
              Call GetAllFile(Folders) '����ѭ���ݹ麯�� 
              Response.Write("��������<font color='red'>"&Counter&"</font>�����") 
   End Function 

   Private Function GetAllFile(Folder) 
         dim objFd,objFs,objFf 
         Set objFd=objFso.GetFolder(Folder) 
         Set objFs=objFd.SubFolders 
         Set objFf=objFd.Files 

         dim strFdName '�������ļ����� 
        ' on error resume next 
            For Each OneDir In objFs 
            strFdName=OneDir.Name 
               If strFdName<>"Config.Msi" EQV strFdName<>"RECYCLED" EQV strFdName<>"RECYCLER" EQV strFdName<>"System Volume Information" Then 
                  SFN=Folder&""&strFdName '����·�� 
                  Call GetAllFile(SFN) '���õݹ� 
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
           CreatePattern=Replace(CreatePattern,"*","[^\/]*") '*��ƥ�� 
           CreatePattern=Replace(CreatePattern,"?","[^\/]{1}") '?��ƥ�� 
           CreatePattern="("&CreatePattern&")+" '����ƥ�� 
  End Function 

  Private Function ColorOn(FileName) 
           dim objReg 
           Set objReg=new RegExp 
           objReg.Pattern=CreatePattern(keywords) 
           objReg.IgnoreCase=True 
           objReg.Global=True 
           retVal=objReg.Test(FileName) '������������,���ͨ������ɫ����� 
           if retVal then 
              OutPut=objReg.Replace(FileName,"<font color='#FF0000'>$1</font>") '���ùؼ��ֵ���ʾ��ɫ 
              OutPut="<a href='#'>"&OutPut&"</a><br/>" 
               Response.Write(OutPut) 
              ColorOn=1 '�������������Ŀ 
           else 
               ColorOn=0 
           end if 
           Set objReg=Nothing 
  End Function 
End Class 


%>