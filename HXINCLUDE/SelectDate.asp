<SCRIPT language=javascript>
function popUpcalendar(ctl,obj,format)
{
    if (arguments.length==0){
	  //������ı����onmousedown�������ɽű��󶨵�,��û�в���  modified by qiuchun
	  if (event.srcElement){
	    var pchild = event.srcElement;
	    if (pchild.type && pchild.type.toLowerCase() == "text")
	      arguments[0] = pchild.id;
	  }
	}
	var x=event.screenX;
	var y=event.screenY;
	var result=window.showModalDialog('../../HXINCLUDE/Calendar.htm','Calendar',"dialogLeft:"+x+"px;dialogTop:"+y+"px;dialogWidth:195px;dialogHeight:200px;help:no;status:no");
	//alert(arguments[0]);
	if(result!=null)
	arguments[1].value=result;
		//eval(arguments[0]+".value=result");		
	return false;
}		
</SCRIPT>