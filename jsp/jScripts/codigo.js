// Documento JavaScript
function llamadasin(url, contenedor){
var pagina_requerida = false
if (window.XMLHttpRequest) {
// comprueba si el navegador es opera, safari, mozilla, etc.
	pagina_requerida = new XMLHttpRequest()
}
else if (window.ActiveXObject){ 
// comprueba si el navegador es internet explorer
	try {
		pagina_requerida = new ActiveXObject("Msxml2.XMLHTTP")
	} 
	catch (e){ 
// caso de versi�n antigua de internet explorer
		try{
			pagina_requerida = new ActiveXObject("Microsoft.XMLHTTP")
		}
		catch (e){
		}
	}
}
else {
	return false
}

pagina_requerida.onreadystatechange=function(){ 
// llamada a la funci�n que carga la p�gina
		pintapagina(pagina_requerida, contenedor)
}
// m�todos open y send
	pagina_requerida.open('GET', url, true) 
	pagina_requerida.send(null)
}

// funci�n que presenta la informaci�n 
function pintapagina(pagina_requerida,contenedor){
	if (pagina_requerida.readyState == 4 && (pagina_requerida.status==200 || window.location.href.indexOf("http")==-1))
		document.getElementById(contenedor).innerHTML=pagina_requerida.responseText
	}