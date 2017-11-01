//***********默认设置定义.*********************
tPopWait = 50;//停留tWait豪秒后显示提示。
tPopShow = 5000;//显示tShow豪秒后关闭提示
showPopStep = 10;
popOpacity = 100;

//***************内部变量定义*****************
sPop = null;
curShow = null;
tFadeOut = null;
tFadeIn = null;
tFadeWaiting = null;
o = null;
isAlt = false;
document.write("<style type='text/css'id='defaultPopStyle'>");
document.write(".cPopText {  background-color: #FFFFFF; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; filter: Alpha(Opacity=0)}");
document.write("</style>");
document.write("<div id='dypopLayer' style='position:absolute;z-index:1000;' class='cPopText'></div>");
function showPopupText() {
//alert(t);
    o = event.srcElement;
    MouseX = event.x;
    MouseY = event.y;
    if (o.alt != null && o.alt != "") {
        o.dypop = o.alt;
        o.alt = "";
	    isAlt = true;
    }
    if (o.title != null && o.title != "") {
        o.dypop = o.title;
        o.title = "";
	    isAlt = false;
    }
	//o.dypop=t;
    t = "";
    if (o.dypop != sPop) {
        sPop = o.dypop;
        clearTimeout(curShow);
        clearTimeout(tFadeOut);
        clearTimeout(tFadeIn);
        clearTimeout(tFadeWaiting);
        if (sPop == null || sPop == "") {
            dypopLayer.innerHTML = "";
            dypopLayer.style.filter = "Alpha()";
            dypopLayer.filters.Alpha.opacity = 0;
        } else {
            if (o.dyclass != null) {
                popStyle = o.dyclass;
            } else {
                popStyle = "cPopText";
            }
            curShow = setTimeout("showIt()", tPopWait);
        }
    }
}
function showIt() {
    dypopLayer.className = popStyle;
    dypopLayer.innerHTML = sPop;
    popWidth = dypopLayer.clientWidth;
    popHeight = dypopLayer.clientHeight;
    if (MouseX + 12 + popWidth > document.body.clientWidth) {
        popLeftAdjust = -popWidth - 24;
    } else {
        popLeftAdjust = 0;
    }
    if (MouseY + 12 + popHeight > document.body.clientHeight) {
        popTopAdjust = -popHeight - 24;
    } else {
        popTopAdjust = 0;
    }
    dypopLayer.style.left = MouseX + 12 + document.body.scrollLeft + popLeftAdjust;
    dypopLayer.style.top = MouseY + 12 + document.body.scrollTop + popTopAdjust;
    dypopLayer.style.filter = "Alpha(Opacity=0)";
    fadeOut();
}
function fadeOut() {
    if (dypopLayer.filters.Alpha.opacity < popOpacity) {
        dypopLayer.filters.Alpha.opacity += showPopStep;
        tFadeOut = setTimeout("fadeOut()", 1);
    } else {
        dypopLayer.filters.Alpha.opacity = popOpacity;
        //tFadeWaiting = setTimeout("fadeIn()", tPopShow);
    }
}
function fadeIn() {
    if (dypopLayer.filters.Alpha.opacity > 0) {
        dypopLayer.filters.Alpha.opacity -= 1;
        tFadeIn = setTimeout("fadeIn()", 1);
    }
}

function destroy(){
	if (isAlt){
		o.alt = sPop;
	}
	else{
		o.title = sPop;
	}
}
document.onmouseover = showPopupText;

