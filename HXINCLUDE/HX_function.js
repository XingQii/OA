
//***************************************WSOAS2.5及以前版本***********************************************
//打开窗口，w 宽度，h 高度，url地址
function openwin(w,h,url)
		{
		var l=(window.screen.width/2)-w/2;
		var t=(window.screen.height/2)-h/2;
		window.open(url,'','width='+w+',height='+h+',top='+t+',left='+l+',menubar=no,toobar=no,scrollbars=yes,resizable=yes,status=no,loation=no');
	
}
//form内容填写完整检查

function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}

function mscroll(n,id){
temp=n;
did=id;
if (temp==0) return;
switch(did){
case 1: div1.scrollTop=div1.scrollTop+temp;break;
case 2: div2.scrollTop=div2.scrollTop+temp;break;
case 3: div3.scrollTop=div3.scrollTop+temp;break;
}
setTimeout("mscroll(temp,did)",80);
}



menu_flag=0;
var STATUS_BAR_MENU;

function show_WEBSMS(){
   if(menu_flag==0)   
       STATUS_BAR_MENU=window.open("HX_WEBSMS/list.asp","STATUS_BAR_MENU","height=360,width=90,status=0,toolbar=no,menubar=no,location=no,scrollbars=no,top=200,left=150,resizable=no");
   STATUS_BAR_MENU.focus();
}
//退出系统
function CloseOpen(evt) {
   if(evt.clientX<=0 && evt.clientY<0) {
	location.href='HX_login.asp?action=loginout';
        if(!confirm('您已经安全的退出系统，按“确定”关闭浏览器，按“取消”重新登录？')){
         window.open('index.asp');
           return false;}
         else{
          window.close();
            return true;
          }
	}
}

   var MENU_ID_ARRAY = new Array();
    MENU_ID_ARRAY[0]="01";
    MENU_ID_ARRAY[1]="02";
    MENU_ID_ARRAY[2]="03";
    MENU_ID_ARRAY[3]="04";
    MENU_ID_ARRAY[4]="02";
    MENU_ID_ARRAY[5]="06";
    MENU_ID_ARRAY[6]="07";
	MENU_ID_ARRAY[7]="08";
	MENU_ID_ARRAY[8]="09";
	MENU_ID_ARRAY[9]="10";
	MENU_ID_ARRAY[6]="11";	
function check_all(menu_all,MENU_ID){
 for (i=0;i<document.all(MENU_ID).length;i++){
   if(menu_all.checked)
      document.all(MENU_ID).item(i).checked=true;
   else
      document.all(MENU_ID).item(i).checked=false;
 }
}
 

function openlogin(url){
HeightValue=screen.height;
WidthValue=screen.width;
window.location.href=url;
window.moveTo(0,0);
window.resizeTo(WidthValue+6,HeightValue-23);
}


function processRootRequest() {		
if (http_request.readyState == 4) { // 判断对象状态
	if (http_request.status != 200) { // 信息已经成功返回，开始处理信息	 			   	
		 alert("您所请求的页面有异常。");
	   }
	}
}


function center(){
if(event.ctrlKey && window.event.keyCode==13){checkform();}
if (window.say.saytext.value.length > 210) 
window.say.saytext.value = window.say.saytext.value.substring(0,210);
}
function show(id){
	var ChatMessageWin; 
	if (ChatMessageWin && ChatMessageWin.open && !ChatMessageWin.closed)
	{   
		return;
	}else{
	   ChatMessageWin = window.open("../HX_WEBSMS/send.asp?id="+id,"ChatMessageWin","width=395,height=210,resizable=0,top=200,left=300,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
	}   
}
function showhis(){
if(document.say.histext.value=='聊天记录(H)'){
resizeTo(404,358);
document.say.histext.value='关闭记录(H)';
document.say.saytext.focus();
}else{
resizeTo(404,238);
document.say.histext.value='聊天记录(H)';
document.say.saytext.focus();
}
}

function showtmsg(){
	if(document.say.showtmsgtext.value=='聊天模式(T)'){
		resizeTo(404,358);
		document.all["showmessage"].style.display='';
		document.say.showtmsgtext.value='消息模式(T)';
		document.say.saytext.focus();
	}else{
		document.all["showmessage"].style.display='none';
		resizeTo(404,238);
		document.say.showtmsgtext.value='聊天模式(T)';
		document.say.saytext.focus();
	}	
}



