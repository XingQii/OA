	<script language="javascript">
	<!--
    function changeFaceAdpter(str){
			var msgw,msgh,bordercolor;
			msgw=500;//提示窗口的宽度
			msgh=100;//提示窗口的高度
			titleheight=25 //提示窗口标题高度
			bordercolor="#ccc";//提示窗口的边框颜色
			titlecolor="#445588";//提示窗口的标题颜色			
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
		   title.innerHTML="关闭";
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
		 skinnetitle[0]="蓝色";
		 
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
		function send_root_request(url) {//初始化、指定处理函数、发送请求的函数
			 http_request = false;
			 if(window.XMLHttpRequest) {
			  http_request = new XMLHttpRequest();	  
			  if (http_request.overrideMimeType) {//设置MiME类别
				http_request.overrideMimeType('text/xml');
			  }
			}
			else if (window.ActiveXObject) { // IE浏览器
			  try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			  }catch (e){
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
			  }catch (e) {
		
				}
			  }
			}
		
			if (!http_request) { // 异常，创建对象实例失?
			  window.alert("不能创建XMLHttpRequest对象实例.");
			  return false;
			}
			http_request.onreadystatechange = processRootRequest;
			// 确定发送请求的方式和URL以及是否同步执行下段代码	
			http_request.open("POST", url, true);
			http_request.send(null);
			//
		}
		function processRootRequest() {		
		if (http_request.readyState == 4) { // 判断对象状态
			if (http_request.status != 200) { // 信息已经成功返回，开始处理信息	 			   	
				 alert("您所请求的页面有异常。");
			   }
			}
        }

-->
	</script>
