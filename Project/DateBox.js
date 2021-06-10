// JScript 文件
//0111
//==================================================== 参数设定部分 =======================================================
var bMoveable = false;
//设置日历是否可以拖动
//var _VersionInfo = "Version:2.1" //版本信息


//==================================================== WEB 页面显示部分 =====================================================
var strFrame;

var datePanelHeight = "250px"; /*250 日期模式  273 日期加时间模式*/
var datePanelMode = 0; /*0 日期模式  1 日期加时间模式*/
var timeTRVisible = "none";
var minuteStep = 1;/*分钟的步长，10 表示10分钟一个单位 0 10 20 30 40 50*/


//存放日历层的HTML代码
document.writeln('<iframe id="webjxDateLayer" name="webjxDateLayer"  frameborder="0" border="0" scrolling="no" allowTransparency="true" style="position: absolute; z-index: 20120603100; display: none;width:190px;height:' + datePanelHeight + '"></iframe>');


strFrame = '<html><head><style type="text/css">';
strFrame += 'body{background-color:transparent;}';
strFrame += 'TD{FONT-SIZE: 9pt;font-family:宋体;}';
strFrame += '.calheadertable{border:none;BACKGROUND-COLOR: #618BC5;}';
strFrame += '.calheadercell{font-size:12px;color:#FFFFFF}';
strFrame += '.calbodytable{border:none;BACKGROUND-COLOR: #FFFFFF;}';
strFrame += '.calbodycell{font-size:12px;width:25px;height:25px;cursor: pointer;}';
strFrame += '.calfootertable{border:none;BACKGROUND-COLOR: #FFFFFF;}';
strFrame += '.calfooterbutton{font-size: 12px; height: 23px;width:25px;cursor:pointer;BORDER-RIGHT: #B3C9E1 1px solid;BORDER-TOP: #B3C9E1 1px solid;BORDER-LEFT: #B3C9E1 1px solid;BORDER-BOTTOM: #ff9900 1px solid;BACKGROUND-COLOR: #EDF2F8;font-family:宋体;}';
strFrame += '</style>';


strFrame += '<script type="text/javascript" language="javascript">';
strFrame += 'var datelayerx,datelayery; /*存放日历控件的鼠标位置*/';
strFrame += 'var bDrag; /*标记是否开始拖动*/';
strFrame += 'function document.onmousemove() /*在鼠标移动事件中，如果开始拖动日历，则移动日历*/';
strFrame += '{if(bDrag && window.event.button==1)';
strFrame += ' {var DateLayer=parent.document.all.webjxDateLayer.style;';
strFrame += '   DateLayer.posLeft += window.event.clientX-datelayerx;/*由于每次移动以后鼠标位置都恢复为初始的位置，因此写法与div中不同*/';
strFrame += '   DateLayer.posTop += window.event.clientY-datelayery;}}';
strFrame += 'function DragStart()   /*开始日历拖动*/';
strFrame += '{var DateLayer=parent.document.all.webjxDateLayer.style;';
strFrame += ' datelayerx=window.event.clientX;';
strFrame += ' datelayery=window.event.clientY;';
strFrame += ' bDrag=true;}';
strFrame += 'function DragEnd(){   /*结束日历拖动*/';
strFrame += ' bDrag=false;}';
strFrame += '</script></head><body>';
strFrame += '<div style="z-index:9999;position: absolute; left:0; top:0; width:182px;" onselectstart="return false">';
strFrame += '<span id=tmpSelectYearLayer style="z-index: 9999;position: absolute;top: 30px; left: 25px;display: none"></span>';//top:3px
//年下拉框的容器
strFrame += '<span id=tmpSelectMonthLayer style="z-index: 9999;position: absolute;top: 30px; left: 100px;display: none"></span>';
//月下拉框的容器
strFrame += '<table cellSpacing="0" cellPadding="0" width="100%" style="border:solid 1px #618BC5;"><tr><td>';
// 控件边框颜色
strFrame += '<table border=0 cellspacing=0 cellpadding=0 width="100%" bgColor="#FFFFFF" >';
strFrame += '<tr id="timeTR" style="display:' + timeTRVisible + ';"><td><table><tr><td style="width:17px;"></td><td   height="23px"><select style="width:42px;" id="tmpSelectHour">' + makeHourSelect() + '</select></td><td>时</td><td id="tmpSelectMinTd">' + makeMinuteSelect() + '</td><td>分</td></tr></table></td></tr>';
strFrame += '   <tr ><td  height="23px" bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width="100%" height="23px">';
strFrame += '       <tr align=center><td width=17 align=center bgcolor=#B6CAE4 style="font-size:12px;cursor: pointer;color: #ffffff" ';
strFrame += '         onclick="parent.webjxPrevM()" title="向前翻 1 月" ><b ><</b>';
strFrame += '         </td><td width=60 align=center style="font-size:12px;cursor:default"  ';
strFrame += 'onmouseover="style.backgroundColor=\'#D7E1F0\'" onmouseout="style.backgroundColor=\'white\'" ';
strFrame += 'onclick="parent.tmpSelectYearInnerHTML(parent.getInnerText(this).substring(0,4))" title="点击这里选择年份"><span  id=webjxYearHead></span></td>';
strFrame += '<td width=48 align=center style="font-size:12px;cursor:default"  onmouseover="style.backgroundColor=\'#D7E1F0\'" ';
strFrame += ' onmouseout="style.backgroundColor=\'white\'" onclick="parent.tmpSelectMonthInnerHTML(parent.getInnerText(this).length==3?parent.getInnerText(this).substring(0,1):parent.getInnerText(this).substring(0,2))"';
strFrame += '         title="点击这里选择月份"><span id=webjxMonthHead ></span></td>';
strFrame += '         <td width=17 bgcolor=#B6CAE4 align=center style="font-size:12px;cursor: pointer;color: #ffffff" ';
strFrame += '          onclick="parent.webjxNextM()" title="向后翻 1 月" ><b >></b></td></tr>';
strFrame += '     </table></td></tr>';
strFrame += '   <tr ><td width=180 height=18>';
strFrame += '<table class="calheadertable"  cellspacing="0" cellpadding="0" ' + (bMoveable ? 'onmousedown="DragStart();" onmouseup="DragEnd();"' : '');
strFrame += '  width="100%" height="25px" style="cursor:' + (bMoveable ? 'move' : 'default') + '">';
strFrame += '<tr valign="middle" align="center"><td style="font-size:12px;color:#FFFFFF"><b>日</b></td>';
strFrame += '<td class="calheadercell"><b>一</b></td><td class="calheadercell"><b>二</b></td>';
strFrame += '<td class="calheadercell"><b>三</b></td><td class="calheadercell"><b>四</b></td>';
strFrame += '<td class="calheadercell"><b>五</b></td><td class="calheadercell"><b>六</b></td></tr>';
strFrame += '</table></td></tr>';
strFrame += '   <tr><td width="100%" >';
strFrame += '     <table class="calbodytable"  cellspacing="2px" cellpadding="0"  width="100%" height="120px">';
var n = 0;
for(j = 0; j < 5; j ++ )
{
	strFrame += ' <tr align=center>';
	for(i = 0; i < 7; i ++ )
	{
		strFrame += '<td class="calbodycell" id="webjxDay' + n + '" onclick="parent.webjxDayClick(parent.getInnerText(this),0)"></td>';
		n ++ ;
	}
	strFrame += '</tr>';
}
strFrame += '       <tr align=center>';
for(i = 35; i < 39; i ++ )strFrame += '<td class="calbodycell" id="webjxDay' + i + '" onclick="parent.webjxDayClick(parent.getInnerText(this),0)"></td>';
strFrame += '         <td colspan="3" align="right"><span onclick="parent.closeLayer()" style="font-size:12px;cursor: pointer;"';
strFrame += '           ><u>关闭</u></span> </td></tr>';
strFrame += '     </table></td></tr><tr ><td>';
strFrame += '         <table class="calfootertable"  cellspacing="0" cellpadding="0" width="100%">';
strFrame += '           <tr ><td  align=left>';
strFrame += '<input type="button" class="calfooterbutton" value="<<" title="向前翻 1 年" onclick="parent.webjxPrevY();" onfocus="this.blur()" />';
strFrame += '<input type="button" class="calfooterbutton" title="向前翻 1 月"value="<" onclick="parent.webjxPrevM();" onfocus="this.blur();"  />';
strFrame += '              </td><td  align=center>';
strFrame += '<input type="button" class="calfooterbutton" value="今天" onclick="parent.webjxToday()"  onfocus="this.blur()" title="当前日期" style="width:40px;" />';
strFrame += '              </td><td  align=right>';
strFrame += '<input type="button" class="calfooterbutton" value=">"  onclick="parent.webjxNextM();" onfocus="this.blur()" title="向后翻 1 月"   />';
strFrame += '<input type="button" class="calfooterbutton" value=">>" title="向后翻 1 年" onclick="parent.webjxNextY();"  onfocus="this.blur()" />';
strFrame += '</td></tr></table></td></tr></table></td></tr></table></div></body></html>';


window.frames.webjxDateLayer.document.write(strFrame);
window.frames.webjxDateLayer.document.close();

//解决ie进度条不结束的问题


function getInnerText(obj)
{
	var dd = obj.innerText != undefined ? obj.innerText : obj.textContent;
	return dd;
}

function makeHourSelect() {
    var hs = "";
    var i;
    for (i = 0; i <= 23; i++) {
        hs = hs + "<option>"+i+"</option>";
    }
    return hs;
}
function makeMinuteSelect() {
    var hs = "";
    var i;
    /*for (i = 0; i <= 59; i++) {
        hs = hs + "<option>" + i + "</option>";
    }*/
    minuteStep = (minuteStep == 0) ? 1 : minuteStep;
    i = 0;
    while (i < 60) {
        hs = hs + "<option>" + i + "</option>";
        i += minuteStep;
    }
    hs = '<select  id="tmpSelectMin" style="width:42px;">'+hs+'</select>';
    return hs;
}
function setHourOrMinute(sel,val) {
    var i;
    for (i = 0; i < sel.options.length; i++) {
        if (sel.options[i].text == val) {
            sel.options[i].selected = true;
            break;
        }
    }
}

//==================================================== WEB 页面显示部分 ======================================================

function setdayFirst(tt,mode,minstep) {
    datePanelMode = mode;
    datePanelHeight = (datePanelMode == 1) ? "273px" : "250px";
    timeTRVisible = (datePanelMode == 1) ? "" : "none";
    minuteStep = minstep;

    pform = document.getElementById("webjxDateLayer");
    pform.style.height = datePanelHeight;
    window.frames.webjxDateLayer.document.getElementById("timeTR").style.display = timeTRVisible;
    //此处 pform.document.getElementById("timeTR")==null  window.frames.webjxDateLayer

    window.frames.webjxDateLayer.document.getElementById("tmpSelectMinTd").innerHTML = makeMinuteSelect(); //tmpSelectMin

    setday(tt);
}

//=======================================
var outObject;
//日期输出的文本输入框
var outButton;
//点击的按钮
var outDate = "";
//存放对象的日期
var odatelayer = window.frames.webjxDateLayer.document.all;
//存放日历对象
var dateboxWrite = "0";
function setday(tt, obj)
//主调函数
{
/*
    if (dateboxWrite == "0") {
        window.frames.webjxDateLayer.document.write(strFrame);
        window.frames.webjxDateLayer.document.close();
        dateboxWrite = "1";
    }*/

	if(arguments.length > 2)
	{
		alert("对不起！传入本控件的参数太多！");
		return;
	}
	if(arguments.length == 0)
	{
		alert("对不起！您没有传回本控件任何参数！");
		return;
	}
	var dads = document.all.webjxDateLayer.style;
	//document.all.webjxDateLayer.style; //divCalendarpad
	var th = tt;
	var ttop = tt.offsetTop;
	//ddateoffsetTop(tt);  //tt.offsetTop;      //TT控件的定位点高
	var thei = tt.clientHeight;
	//TT控件本身的高
	var tleft = tt.offsetLeft;
	// ddateoffsetLeft(tt);  //tt.offsetLeft;     //TT控件的定位点宽
	var ttyp = tt.type;
	//TT控件的类型
	while(tt = tt.offsetParent)
	{
		ttop += tt.offsetTop;
		tleft += tt.offsetLeft;
	}
	dads.top = (ttyp == "image") ? ttop + thei + "px" : ttop + thei + 6 + "px";
	dads.left = tleft + "px";
	outObject = (arguments.length == 1) ? th : obj;
	outButton = (arguments.length == 1) ? null : th;
	//设定外部点击的按钮
	//根据当前输入框的日期显示日历的年月
	var reg = /^(\d+)[-\/](\d{1,2})[-\/](\d{1,2})(\s{1,5})(\d{1,2}):(\d{1,2}):(\d{1,2})$/;   // /^(\d+)-(\d{1,2})-(\d{1,2})(\s{1,5})(\d{1,2}):(\d{1,2}):(\d{1,2})$/    /^(\d+)-(\d{1,2})-(\d{1,2})$/;
	var r = outObject.value.match(reg);
	//alert(outObject.value);
	if (r == null) 
	{
	    reg = /^(\d+)[-\/](\d{1,2})[-\/](\d{1,2})$/;   // /^(\d+)-(\d{1,2})-(\d{1,2})$/;
	    r = outObject.value.match(reg);
	    //if(r!=null)	    alert(r[1]);
	}else{
	    var hr = window.frames.webjxDateLayer.document.getElementById("tmpSelectHour"); //parent.webjxDateLayer.document.getElementById("tmpSelectHour"); //tmpSelectHour
	    var min = window.frames.webjxDateLayer.document.getElementById("tmpSelectMin"); //parent.webjxDateLayer.document.getElementById("tmpSelectMin");
	    setHourOrMinute(hr,r[5]); //hr.value=r[5];
	    setHourOrMinute(min, r[6]); //min.value = r[6];
		//alert(r[5]);
}

/*	var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/; // /^(\d+)-(\d{1,2})-(\d{1,2})(\s{1,5})(\d{1,2}):(\d{1,2})$/;   // /^(\d+)-(\d{1,2})-(\d{1,2})$/;
var r = outObject.value.match(reg);*/

	if(r != null)
	{
		r[2] = r[2] - 1;
		var d = new Date(r[1], r[2], r[3]);
		if(d.getFullYear() == r[1] && d.getMonth() == r[2] && d.getDate() == r[3])
		{
			outDate = d;
			//保存外部传入的日期
		}
		else outDate = "";
		webjxSetDay(r[1], r[2] + 1);
		
		
	}
	else {
	    //alert(" r is null");
		outDate = "";
		webjxSetDay(new Date().getFullYear(), new Date().getMonth() + 1);
	}
	dads.display = '';
	
	
	var theEvent = window.event || arguments.callee.caller.arguments[0];
	theEvent.returnValue = false;
}


//function ddateoffsetTop(elements) {
//    var top = elements.offsetTop;
//    var parent = elements.offsetParent;
//    while (parent != null) {
//        top += parent.offsetTop;
//        parent = parent.offsetParent;
//    };
//    return top;
//};


//function ddateoffsetLeft(elements) {
//    var left = elements.offsetLeft;
//    var parent = elements.offsetParent;
//    while (parent != null) {
//        left += parent.offsetLeft;
//        parent = parent.offsetParent;
//    };
//    return left;
//};


var MonHead = new Array(12);
//定义阳历中每个月的最大天数
MonHead[0] = 31;
MonHead[1] = 28;
MonHead[2] = 31;
MonHead[3] = 30;
MonHead[4] = 31;
MonHead[5] = 30;
MonHead[6] = 31;
MonHead[7] = 31;
MonHead[8] = 30;
MonHead[9] = 31;
MonHead[10] = 30;
MonHead[11] = 31;


var webjxTheYear = new Date().getFullYear();
//定义年的变量的初始值
var webjxTheMonth = new Date().getMonth() + 1;
//定义月的变量的初始值
var webjxWDay = new Array(39);
//定义写日期的数组


function ddateAddEvent(oElement, sEventType, fnHandler)
{
    return oElement.addEventListener ? oElement.addEventListener(sEventType, fnHandler, false) : oElement.attachEvent("on" + sEventType, fnHandler);
}


function ddatedocumentonclick(e)
//任意点击时关闭该控件 //ie6的情况可以由下面的切换焦点处理代替
{
	var theEvent = window.event || e;
	var obj = theEvent.srcElement ? theEvent.srcElement : theEvent.target;
	
	
	if(obj != outObject && obj != outButton)
	//obj.getAttribute("Author") == null && 
	closeLayer();
	
	
	//alert("dcl");
}


function ddatedocumentonkeyup(e)
//按Esc键关闭，切换焦点关闭
{
	var theEvent = window.event || e;
	if(theEvent.keyCode == 27)
	{
		if(outObject)outObject.blur();
		closeLayer();
	}
	else if(document.activeElement)
	//document.activeElement.getAttribute("Author") == null && 
	if(document.activeElement != outObject && document.activeElement != outButton)
	{
		closeLayer();
	}
}
/**/
ddateAddEvent(document, "click", ddatedocumentonclick);
ddateAddEvent(document, "keyup", ddatedocumentonkeyup);


function webjxWriteHead(yy, mm)
//往 head 中写入当前的年与月
{
	//odatelayer.webjxYearHead.innerText = yy + " 年";
	//odatelayer.webjxMonthHead.innerText = mm + " 月";
	if(odatelayer.webjxYearHead.innerText != undefined)
	{
		odatelayer.webjxYearHead.innerText = yy + " 年";
		odatelayer.webjxMonthHead.innerText = mm + " 月";
	}
	else
	{
		odatelayer.webjxYearHead.textContent = yy + " 年";
		odatelayer.webjxMonthHead.textContent = mm + " 月";
	}
}


function tmpSelectYearInnerHTML(strYear)
//年份的下拉框
{
	var st;
	var ed;
	if(strYear.match(/\D/) != null)
	{
		alert("年份输入参数不是数字！");
		return;
	}
	var m = (strYear) ? strYear : new Date().getFullYear();
	if(m < 1000 || m > 9999)
	{
		alert("年份值不在 1000 到 9999 之间！");
		return;
	}
	var n = m - 10;
	if(n < 1000)n = 1000;
	if(n + 26 > 9999)n = 9974;
	var s = "    <select  name=tmpSelectYear style='font-size: 12px;border:none;margin:-1px;padding:1px;' ";
	s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' ";
	s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";";
	s += "parent.webjxTheYear = this.value; parent.webjxSetDay(parent.webjxTheYear,parent.webjxTheMonth)'>\r\n";
	var selectInnerHTML = s;
	st = 1949;
	//n
	ed = new Date().getFullYear();
	//n+26
	for(var i = ed + 50; i >= st; i -- )
	//n + 26
	{
		if(i == m)
		{
			selectInnerHTML += "<option value='" + i + "' selected>" + i + "年" + "</option>\r\n";
		}
		else
		{
			selectInnerHTML += "<option value='" + i + "'>" + i + "年" + "</option>\r\n";
		}
	}
	selectInnerHTML += "</select>";
	odatelayer.tmpSelectYearLayer.style.display = "";
	odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML;
	odatelayer.tmpSelectYear.focus();
}


function tmpSelectMonthInnerHTML(strMonth)
//月份的下拉框
{
	if(strMonth.match(/\D/) != null)
	{
		alert("月份输入参数不是数字！");
		return;
	}
	var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
	var s = "      <select  name=tmpSelectMonth style='font-size: 12px; border:none;margin:-1px;padding:1px;' ";
	s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' ";
	s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";";
	s += "parent.webjxTheMonth = this.value; parent.webjxSetDay(parent.webjxTheYear,parent.webjxTheMonth)'>\r\n";
	var selectInnerHTML = s;
	for(var i = 1; i < 13; i ++ )
	{
		if(i == m)
		{
			selectInnerHTML += "<option value='" + i + "' selected>" + i + "月" + "</option>\r\n";
		}
		else
		{
			selectInnerHTML += "<option value='" + i + "'>" + i + "月" + "</option>\r\n";
		}
	}
	selectInnerHTML += "</select>";
	odatelayer.tmpSelectMonthLayer.style.display = "";
	odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
	odatelayer.tmpSelectMonth.focus();
}


function closeLayer()
//这个层的关闭
{
	document.all.webjxDateLayer.style.display = "none";
}


function IsPinYear(year)
//判断是否闰平年
{
	if(0 == year % 4 && ((year % 100 != 0) || (year % 400 == 0)))return true;
	else return false;
}


function GetMonthCount(year, month)
//闰年二月为29天
{
	var c = MonHead[month - 1];
	if((month == 2) && IsPinYear(year))c ++ ;
	return c;
}
function GetDOW(day, month, year)
//求某天的星期几
{
	var dt = new Date(year, month - 1, day).getDay() / 7;
	return dt;
}


function webjxPrevY()
//往前翻 Year
{
	if(webjxTheYear > 999 && webjxTheYear < 10000)
	{
		webjxTheYear -- ;
	}
	else
	{
		alert("年份超出范围（1000-9999）！");
	}
	webjxSetDay(webjxTheYear, webjxTheMonth);
}
function webjxNextY()
//往后翻 Year
{
	if(webjxTheYear > 999 && webjxTheYear < 10000)
	{
		webjxTheYear ++ ;
	}
	else
	{
		alert("年份超出范围（1000-9999）！");
	}
	webjxSetDay(webjxTheYear, webjxTheMonth);
}
function webjxToday()
//Today Button
{
	var today;
	webjxTheYear = new Date().getFullYear();
	webjxTheMonth = new Date().getMonth() + 1;
	today = new Date().getDate();
	//webjxSetDay(webjxTheYear,webjxTheMonth);
	if(outObject)
	{
		outObject.value = webjxTheYear + "-" + webjxTheMonth + "-" + today;
	}
	closeLayer();
}
function webjxPrevM()
//往前翻月份
{
	if(webjxTheMonth > 1)
	{
		webjxTheMonth -- 
	}
	else
	{
		webjxTheYear -- ;
		webjxTheMonth = 12;
	}
	webjxSetDay(webjxTheYear, webjxTheMonth);
}
function webjxNextM()
//往后翻月份
{
	if(webjxTheMonth == 12)
	{
		webjxTheYear ++ ;
		webjxTheMonth = 1
	}
	else
	{
		webjxTheMonth ++ 
	}
	webjxSetDay(webjxTheYear, webjxTheMonth);
}


function webjxSetDay(yy, mm)
//主要的写程序**********
{
	webjxWriteHead(yy, mm);
	//设置当前年月的公共变量为传入值
	webjxTheYear = yy;
	webjxTheMonth = mm;
	
	
	for(var i = 0; i < 39; i ++ )
	{
		webjxWDay[i] = ""
	};
	//将显示框的内容全部清空
	var day1 = 1,
	day2 = 1,
	firstday = new Date(yy, mm - 1, 1).getDay();
	//某月第一天的星期几
	for(i = 0; i < firstday; i ++ )webjxWDay[i] = GetMonthCount(mm == 1 ? yy - 1 : yy, mm == 1 ? 12 : mm - 1) - firstday + i + 1
	//上个月的最后几天
	for(i = firstday; day1 < GetMonthCount(yy, mm) + 1; i ++ )
	{
		webjxWDay[i] = day1;
		day1 ++ ;
	}
	for(i = firstday + GetMonthCount(yy, mm); i < 39; i ++ )
	{
		webjxWDay[i] = day2;
		day2 ++ 
	}
	for(i = 0; i < 39; i ++ )
	{
		var da = eval("odatelayer.webjxDay" + i)
		//书写新的一个月的日期星期排列
		if(webjxWDay[i] != "")
		{
			//初始化边框
			da.borderColorLight = "#76A0CF";
			da.borderColorDark = "#76A0CF";
			if(i < firstday)
			//上个月的部分
			{
				da.innerHTML = "<font style=' color: #B5C5D2;'>" + webjxWDay[i] + "</font>";
				da.title = (mm == 1 ? 12 : mm - 1) + "月" + webjxWDay[i] + "日";
				da.onclick = Function("webjxDayClick(getInnerText(this),-1)");
				
				
				if( ! outDate)
				da.style.backgroundColor = ((mm == 1 ? yy - 1 : yy) == new Date().getFullYear() && (mm == 1 ? 12 : mm - 1) == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#E4E3F2" : "#FFFFFF";
				else
				{
					da.style.backgroundColor = ((mm == 1 ? yy - 1 : yy) == outDate.getFullYear() && (mm == 1 ? 12 : mm - 1) == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate()) ? "#E8F5E7" : 
					// 选中日期颜色
					 (((mm == 1 ? yy - 1 : yy) == new Date().getFullYear() && (mm == 1 ? 12 : mm - 1) == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#E4E3F2" : "#FFFFFF");
					// 当前系统时间颜色
					//将选中的日期显示为凹下去
					if((mm == 1 ? yy - 1 : yy) == outDate.getFullYear() && (mm == 1 ? 12 : mm - 1) == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate())
					{
						//da.borderColorLight="#E4E3F2";
						//      da.borderColorDark="#E4E3F2";   //   选择日期边框颜色
					}
				}
				
				
			}
			else if(i >= firstday + GetMonthCount(yy, mm))
			//下个月的部分
			{
				da.innerHTML = "<font style=' color: #B5C5D2;'>" + webjxWDay[i] + "</font>";
				da.title = (mm == 12 ? 1 : mm + 1) + "月" + webjxWDay[i] + "日";
				da.onclick = Function("webjxDayClick(getInnerText(this),1)");
				if( ! outDate)
				da.style.backgroundColor = ((mm == 12 ? yy + 1 : yy) == new Date().getFullYear() && (mm == 12 ? 1 : mm + 1) == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#E4E3F2" : "#FFFFFF";
				else
				{
					da.style.backgroundColor = ((mm == 12 ? yy + 1 : yy) == outDate.getFullYear() && (mm == 12 ? 1 : mm + 1) == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate()) ? "#E8F5E7" : 
					// 选中日期颜色
					 (((mm == 12 ? yy + 1 : yy) == new Date().getFullYear() && (mm == 12 ? 1 : mm + 1) == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#E4E3F2" : "#FFFFFF");
					// 当前系统时间
					//将选中的日期显示为凹下去
					if((mm == 12 ? yy + 1 : yy) == outDate.getFullYear() && (mm == 12 ? 1 : mm + 1) == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate())
					{
						da.borderColorLight = "#E4E3F2";
						da.borderColorDark = "#E4E3F2";
						//   选择日期边框颜色
					}
				}
			}
			else
			//本月的部分
			{
				da.innerHTML = "<font style=' color: #3E5468;'>" + webjxWDay[i] + "</FONT>";
				da.title = mm + "月" + webjxWDay[i] + "日";
				da.onclick = Function("webjxDayClick(getInnerText(this),0)");
				//给td赋予onclick事件的处理
				//如果是当前选择的日期，则显示亮蓝色的背景；如果是当前日期，则显示暗黄色背景
				if( ! outDate)
				da.style.backgroundColor = (yy == new Date().getFullYear() && mm == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#FFFFFF" : "#FFFFFF";
				else
				{
					da.style.backgroundColor = (yy == outDate.getFullYear() && mm == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate()) ? "#D5ECD2" : ((yy == new Date().getFullYear() && mm == new Date().getMonth() + 1 && webjxWDay[i] == new Date().getDate()) ? "#E4E3F2" : "#F8F8FC");
					// 前一个当前系统时间,后一个是本月时间低色
					//将选中的日期显示为凹下去
					if(yy == outDate.getFullYear() && mm == outDate.getMonth() + 1 && webjxWDay[i] == outDate.getDate())
					{
						//da.borderColorLight="#E4E3F2";
						//da.borderColorDark="#E4E3F2";   //   选择日期边框颜色
					}
				}
			}
			da.style.cursor = "pointer";
			da.onmouseover = Function("this.backgroundColor='#000000';this.borderColorDark='#000099';this.borderColorLight='#000099';");
			da.onmouseout = Function("this.bgColor='#000000';this.borderColorDark='#9CBADE';this.borderColorLight='#9CBADE';");
		}
		else
		{
			da.innerHTML = "";
			da.style.backgroundColor = "";
			da.style.cursor = "default";
			da.onmouseover = Function("this.backgroundColor='#000000';this.borderColorDark='#000099';this.borderColorLight='#000099';");
			da.onmouseout = Function("this.bgColor='#000000';this.borderColorDark='#9CBADE';this.borderColorLight='#9CBADE';");
		}
	}
}


function webjxDayClick(n, ex)
//点击显示框选取日期，主输入函数*************
{
	var yy = webjxTheYear;
	var mm = parseInt(webjxTheMonth) + ex;
	//ex表示偏移量，用于选择上个月份和下个月份的日期
	var hr = window.frames.webjxDateLayer.document.getElementById("tmpSelectHour"); //tmpSelectHour
	var min = window.frames.webjxDateLayer.document.getElementById("tmpSelectMin");
	//alert(hr);alert(min);
	//判断月份，并进行对应的处理
	if(mm < 1)
	{
		yy -- ;
		mm = 12 + mm;
	}
	else if(mm > 12)
	{
		yy ++ ;
		mm = mm - 12;
	}
	
	
	if(mm < 10)
	{
		mm = "0" + mm;
	}
	if(outObject)
	{
		if( ! n)
		{
			//outObject.value=""; 
			return;
		}
		if(n < 10)
		{
			n = "0" + n;
        }
        outObject.value = yy + "-" + mm + "-" + n; //+ " " + hr.options[hr.selectedIndex].text + ":" + min.options[min.selectedIndex].text + ":0";

        if (datePanelMode == 1) {
            outObject.value = outObject.value + " " + hr.options[hr.selectedIndex].text + ":" + min.options[min.selectedIndex].text + ":0";
        }
		
		//注：在这里你可以输出改成你想要的格式
		closeLayer();
	}
	else
	{
		closeLayer();
		alert("您所要输出的控件对象并不存在！");
	}
}