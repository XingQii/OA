	<script language="javascript">
	<!--
    function changeFaceAdpter(str){
			var msgw,msgh,bordercolor;
			msgw=500;//��ʾ���ڵĿ��
			msgh=100;//��ʾ���ڵĸ߶�
			titleheight=25 //��ʾ���ڱ���߶�
			bordercolor="#ccc";//��ʾ���ڵı߿���ɫ
			titlecolor="#445588";//��ʾ���ڵı�����ɫ			
			var sWidth,sHeight;
			sWidth=screen.width;			
			sHeight=document.body.scrollHeight;

			var bgObj=document.createElement("div");
			bgObj.setAttribute('id','bgDiv');
			bgObj.style.position="absolute";
			bgObj.style.top="0";
			bgObj.style.background="#777";
			bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
			bgObj.style.opacity="0.6";
			bgObj.style.left="0";
			bgObj.style.width=sWidth + "px";
			bgObj.style.height=sHeight + "px";
			bgObj.style.zIndex = "10000";
			document.body.appendChild(bgObj);
			
			var msgObj=document.createElement("div")
			msgObj.setAttribute("id","msgDiv");
			msgObj.setAttribute("align","center");
			msgObj.style.background="white";
			msgObj.style.border="2px solid " + bordercolor;
	    		msgObj.style.position = "absolute";
            		msgObj.style.left = "50%";
           		msgObj.style.top = "20%";
            		msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
            		msgObj.style.marginLeft = "-225px" ;
           		msgObj.style.marginTop = /*-75+*/document.documentElement.scrollTop+"px";
			msgObj.style.width = msgw + "px";
			msgObj.style.height =msgh + "px";
			msgObj.style.textAlign = "center";
			msgObj.style.lineHeight ="25px";
			msgObj.style.zIndex = "10001";
   			msgObj.style.padding = "0 0 20px 0";
			
		   var title=document.createElement("h4");
		   title.setAttribute("id","msgTitle");
		   title.setAttribute("align","right");
		   title.style.margin="0";
		   title.style.padding="3px";
		   title.style.background="#ccc";
		   title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
		   title.style.opacity="0.75";
		   title.style.border="1px solid " + bordercolor;
		   title.style.height="18px";
		   title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
		   title.style.color="white";
		   title.style.cursor="pointer";
		   title.innerHTML="�ر�";
		   title.onclick=function alertclose(){
		        document.body.removeChild(bgObj);
	                document.getElementById("msgDiv").removeChild(title);
        	        document.body.removeChild(msgObj);
                	}
		   
		   document.body.appendChild(msgObj);
		   msgObj.appendChild(title);

	
		 var skinnercontainer = document.createElement("div");
		 msgObj.appendChild(skinnercontainer);
		 skinnercontainer.style.marginTop="10px";
		 
		 var skinners = new Array();
		 var skinnetitle = new Array();
		
		 skinners[0]="blue";
		 skinnetitle[0]="��ɫ";
		 
		 for(i=0;i<skinners.length;i++){
			var skinner = document.createElement("a");
			skinner.href="javascript:changeFace('"+skinners[i]+"');";
		 	skinner.innerHTML="<img src='HXSkin/"+skinners[i]+"/SkinICO.jpg' alt='"+skinnetitle[i]+"' width='150' border=0 />";
		 	skinner.style.padding="3px 3px 3px 3px";
			if(skinners[i]=="<%=WSOASSkin%>"){
				skinner.style.background="ff7300";	
			}			
		 	skinnercontainer.appendChild(skinner);			 
			 } 
            }
        function changeFace(ver){		
		  send_root_request('SelectWSOASAjax.Asp?Action=ChangeSkin&skin='+ver);	
		  setTimeout("window.location.reload()",1000);	  
		}
		function send_root_request(url) {//��ʼ����ָ������������������ĺ���
			 http_request = false;
			 if(window.XMLHttpRequest) {
			  http_request = new XMLHttpRequest();	  
			  if (http_request.overrideMimeType) {//����MiME���
				http_request.overrideMimeType('text/xml');
			  }
			}
			else if (window.ActiveXObject) { // IE�����
			  try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			  }catch (e){
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
			  }catch (e) {
		
				}
			  }
			}
		
			if (!http_request) { // �쳣����������ʵ��ʧ?
			  window.alert("���ܴ���XMLHttpRequest����ʵ��.");
			  return false;
			}
			http_request.onreadystatechange = processRootRequest;
			// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���	
			http_request.open("POST", url, true);
			http_request.send(null);
			//
		}
		function processRootRequest() {		
		if (http_request.readyState == 4) { // �ж϶���״̬
			if (http_request.status != 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ	 			   	
				 alert("���������ҳ�����쳣��");
			   }
			}
        }

-->
	</script>
