var temp=1;
function change(d)
{
if(d!=temp)
{
  switch(temp)
  {
case 1: a1.style.display="none"; break;
case 2: a2.style.display="none"; break;
case 3: a3.style.display="none"; break;
case 4: a4.style.display="none"; break;
  }
}
 switch (d)
 {
case 1: if(a1.style.display="none")   a1.style.display="block";  else a1.style.display="none"; temp=1; break;
case 2: if(a2.style.display="none")   a2.style.display="block";  else a2.style.display="none"; temp=2; break;
case 3: if(a3.style.display="none")   a3.style.display="block";  else a3.style.display="none"; temp=3; break;
case 4: if(a4.style.display="none")   a4.style.display="block";  else a4.style.display="none"; temp=4; break;
}
}


function show(id){
window.open("send.asp?id="+id,"","width=395,height=210,resizable=0,top=200,left=300,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
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
