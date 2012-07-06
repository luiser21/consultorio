/**
 * Hersoft Gestion Documental
 * Consultorio Juridico
 * @author Ing. Luis Cardenas M.
 * @version 4.1 2012/05/01
*/

var message = "Función deshabilitada"; 

function clickIE(){
	if (document.all){
    	//alert (message);
		return false;
   	}
}

function clickNS(e){
	if (document.layers || (document.getElementById && !document.all)){
		if (e.which == 2 || e.which == 3){
			//alert(message);
			return false;
		}
	}
}

if (document.layers){
	document.captureEvents(Event.MOUSEDOWN);
    document.onmousedown = clickNS;
} else {
    document.onmouseup = clickNS;
    document.oncontextmenu = clickIE;
}

var NS = (navigator.appName == "Netscape" && parseInt(navigator.appVersion, 10) >= 5)? true : false;
var IE = (navigator.appVersion.search(/MSIE/) != -1)? true : false;

/*function whichKey(km){
	if (NS){
		if ( (km.which==16) || (km.which==17) || (km.which==18) || (km.which==8) || (km.which>=111 && km.which<=123)){	
			alert(message);
			return (false);  
		}  
	}
	else{
		if ( (event.altLeft) || (event.altKey) || (event.ctrlKey) || (event.shiftKey) || (event.keyCode == 8) || (event.keyCode >= 111 && event.keyCode <= 123)){  	
			event.keyCode = 0;	
			alert(message);
			return (false);  
		}
	}
}

document.onkeydown = whichKey;*/
