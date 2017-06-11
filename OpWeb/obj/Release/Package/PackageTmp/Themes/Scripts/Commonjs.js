var sxtconMenu="";
var sxtconPath="";;
function ShowHideObject(objID)
{
	var obj=eval("document.all."+objID);
	if(obj.style.display=="none")
	{
		obj.style.display="block";
	}
	else
	{
		obj.style.display="none";
	}
}


//Move item up

function moveUp(oSelect)
{
	var i, count=0;
	var display_1, display_2, value_1, value_2;
	
	if (oSelect.selectedIndex != -1)
	{
	  for (i=0;i<oSelect.length;i++)
				if (oSelect.options[i].selected)
					 count ++;
		
		if (count > 1)
		{
		  alert("Sorry. Only one option can be moved up at a time");
		}
		else
		{
		  i = oSelect.selectedIndex;
			if (i > 0)
			{
			display_1 = oSelect.options[i].text;
			display_2 = oSelect.options[i-1].text;
				
			value_1 = oSelect.options[i].value;
			value_2 = oSelect.options[i-1].value;
				
			oSelect.options[i].text = display_2;
			oSelect.options[i].value = value_2;
			oSelect.options[i].selected = false
					
			oSelect.options[i-1].text = display_1;
			oSelect.options[i-1].value = value_1;
			oSelect.options[i-1].selected = true;
					
			oSelect.selectedIndex = i-1;
			}
	  }
	}
	
	return true;
}

//Move item down

function moveDown(oSelect)
{
	var i, count=0;
	var display_1, display_2, value_1, value_2;
	
	if (oSelect.selectedIndex != -1)
	{
	  for (i=0;i<oSelect.length;i++)
				if (oSelect.options[i].selected)
					 count ++;
					 
		if (count > 1)
		{
		  alert("Only one reviewer can be moved down at a time")
		}
		else
		{
		  i = oSelect.selectedIndex;
			if (i < oSelect.length - 1)
			{
			display_1 = oSelect.options[i].text;
			display_2 = oSelect.options[i+1].text;
				
			value_1 = oSelect.options[i].value;
			value_2 = oSelect.options[i+1].value;
				
			oSelect.options[i].text = display_2;
			oSelect.options[i].value = value_2;
			oSelect.options[i].selected = false;
				
			oSelect.options[i+1].text = display_1;
			oSelect.options[i+1].value = value_1;
			oSelect.options[i+1].selected = true;
					
			oSelect.selectedIndex = i+1;
			}
	  }
	}
	
	return true;
}

//Resize the modal dialog

function ResizeDialog(width,height)
{
	var vOpener=window.opener;
	if(vOpener=="undefined" || vOpener==null)//modal dialog
	{
		window.dialogWidth=width+"px";	
		window.dialogHeight=height+"px";
		window.dialogTop=(screen.height-height)/2 + "px";
		window.dialogLeft=(screen.width-width)/2 + "px";
	}
	else //normal window
	{
		window.moveTo((screen.width-width)/2,(screen.height-height-76)/2)		
		window.resizeTo(width,height+76)
	}
}

//Open the modal window

function OpenModalWindow(url)
{
	var vTmd=Math.random();
	var vReturn='';
	if(url.indexOf('?')>-1)
	{
		vReturn=window.showModalDialog(url+'&tmd='+vTmd,null,'status:0;scroll:0;help:0;');
	}
	else
	{
		vReturn=window.showModalDialog(url+'?tmd='+vTmd,null,'status:0;scroll:0;help:0;');
	}
	if(typeof(vReturn)!="undefined" && vReturn!="")
	{
		__doPostBack('','__RefreshDataGrid')
	}
}

function OpenModalWindowEx(url)
{
	var vTmd=Math.random();
	var vReturn='';
	if(url.indexOf('?')>-1)
	{
		vReturn=window.showModalDialog(url+'&tmd='+vTmd,null,'status:0;scroll:0;help:0;');
	}
	else
	{
		vReturn=window.showModalDialog(url+'?tmd='+vTmd,null,'status:0;scroll:0;help:0;');
	}
}

//Get PickerBase Control's Value
function GetPickerBaseValue(ctl)
{
	return eval("document.all."+ctl+"_Value.value");
}

//Get RadioButtonList Checked Value

function GetRadioButtonListCheckedValue(ctl)
{
	var oRadio=document.getElementById(ctl);
	var oRadioButtons=oRadio.getElementsByTagName("input");
	for(var i=0;i<oRadioButtons.length;i++)
	{
		if(oRadioButtons[i].type=="radio" && oRadioButtons[i].checked)
		{
			return oRadioButtons[i].value;
		}
	}	
	return "";
}

//Get the response from specifyed url

function OpenUrlAndGetResponse(url)
{
	var req = new ActiveXObject("Msxml2.XMLHTTP");
	var vTmd=Math.random();	
	if(url.indexOf('?')>-1)
	{
		req.open("GET",url+"&TMD="+vTmd, false);	
	}
	else
	{
		req.open("GET",url+"?TMD="+vTmd, false);	
	}
	req.send();
	//alert(req.responseText);
	return req.responseText;
}

//set the value of the page will open,use in picker page

function SetPickerValue(key,value)
{
	var doc=new ActiveXObject("Msxml2.DOMDocument");
	var root=doc.createElement("root");			
	var k=doc.createElement("k");
	k.text=key;
	var v=doc.createElement("v");
	v.text=value;
	root.appendChild(k);
	root.appendChild(v)	
	doc.documentElement=root;		
	var req = new ActiveXObject("Msxml2.XMLHTTP");	
	req.open("POST","/SetPickerValue.aspx", false);		
	req.send(doc);
	return req.responseText;
}

//refresh the parent window

function SXTOnWindowClose()
{
	var op=window.opener;
	if (typeof(op)!="undefined" && typeof(op.SXTRefreshWindow)!="undefined")
	{		
		op.setTimeout(op.SXTRefreshWindow,500);
	}	
}

function RetrieveValue(pid)
{
	
}

function OpenHrefWindow(url,bstyle)
{
	if (bstyle)
	{
		window.open(url,"_blank","status:0;scroll:0;help:0;");	
	}
	else
	{		
		window.open(url,"_blank");
	}
}

function RTXLogin(uid,pwd,ip,port)
{		
	try
	{
		var api=new ActiveXObject("RTXClient.RTXAPI");						
		var p=api.GetObject("Property");		
		p.value("RTXUsername")=uid;
		p.value("Password")=pwd;
		p.value("ServerAddress")=ip;
		p.value("ServerPort")=port;
		var result=api.Call(2,p);		
	}catch(exception)
	{
		//alert(exception);
	}		
}

function OnSwapMenu(obj,src1,src2)
{
	var menu=document.all("tdLeftMenu");	
	if (menu!=undefined && obj!=undefined)
	{
		var path=document.all("tdLeftPath");
		if (path!=undefined)
		{
			var tmp2=sxtconPath;			
			sxtconPath=path.innerHTML;
			path.innerHTML=tmp2;
			if (tmp2=="")
			{
				path.style.width="0px";
			}else
			{
				path.style.width="175px";
			}
		}
		var tmp=sxtconMenu;
		sxtconMenu=menu.innerHTML;
		menu.innerHTML=tmp;
		if (tmp=="")
		{
			obj.src=src2;			
		}else
		{			
			obj.src=src1;
		}
		
		if (typeof(GetLeftMenuStatus)=="function")
		{
			if (tmp=="")
			{
				SetLeftMenuStatus("1");				
			}else
			{
				SetLeftMenuStatus("0");
			}			
		}
	}
}

//Top Menu
function ShowTopMenu(menu,setPos)
{	
	if (menu!=undefined && menu.tagName=="DIV")
	{		
		menu.style.display="block";	
		menu.style.visibility="visible";
		if (setPos)
		{	
			//alert(menu.innerHTML);				
			menu.style.left=window.event.x-window.event.offsetX+document.body.scrollLeft;		
			menu.style.top=window.event.y-window.event.offsetY+19+document.body.scrollTop;
		}	
	}
}

function HideTopMenu(menu)
{	
	if (menu!=undefined && menu.tagName=="DIV")
	{		
		menu.style.display="none";	
		menu.style.visibility="hidden";	
	}
}

function CheckStyle()
{	var i;
	var k=screen.width;	
	for (i=0;i<document.styleSheets.length;i++)
	{
		var o=document.styleSheets[i];	
		o.href=o.href.replace("_sxt_",k);		
	}	
}

function OnWindowLoad()
{
	CheckStyle();
}
attachEvent("onload",OnWindowLoad);
 function OpenModalDialog(strHref,  Width,Height) {

     
                try
               {
                   //初始化变量，用于接收页面反回值。
                  var recdata=false;
                  var vTmd=Math.random();	
                 //模式窗口打开指定的窗口链接
                 
                 if(strHref.indexOf('?')>-1)
	            {
                  recdata=showModalDialog(strHref+"&Tmd="+vTmd,"DescWindow",
                     "dialogWidth:"+Width+"px;dialogHeight:"+Height+"px;center:1;scroll:1;help:0;status:0");
                }
                else
                {
  recdata=showModalDialog(strHref+"?Tmd="+vTmd,"DescWindow",
                     "dialogWidth:"+Width+"px;dialogHeight:"+Height+"px;center:1;scroll:1;help:0;status:0");
                 }
                  //判断对应的返回值
                  if(recdata==true)
                   {
                     return true;
                   }
                   else
                   return false;
               }
               catch(err)
              {}
           }

 function OpenNewPage(strHref,Width,Height)
{
 var t = (window.screen.Height-Height)/2;       //获得窗口的垂直位置;
  var l = (window.screen.Width-Width)/2;           //获得窗口的水平位置;
  var vTmd = "a" + Math.random().toString().substring(3,10);
//  alert(vTmd);
//  return;
  window.open(strHref, vTmd, 'height=' + Height + ',width=' + Width + ',top=' + t + ',left=' + l + ',toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no') 

}

 function OpenNewPageEx(strHref,Width,Height)
{
 var t = (window.screen.Height-Height)/2;       //获得窗口的垂直位置;
  var l = (window.screen.Width-Width)/2;           //获得窗口的水平位置;
  var vTmd = "b" + Math.random().toString().substring(3, 10);
  window.open(strHref, vTmd, 'height=' + Height + ',width=' + Width + ',top=' + t + ',left=' + l + ',toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no') 

}


