/*
	@autor: Grupo de Gorramacion
	Universidad de Pamplona.
	Pamplona (Norte de Santander). Colombia.
	Septiembre 17 del 2003
	validaciones.js
	Version para Academusoft 3.2
*/

function esVacio(valor){
	if(valor==null){return true;}
	for(var i=0;i<valor.length;i++) {
		if ((valor.charAt(i)!=' ')&&(valor.charAt(i)!="\t")&&(valor.charAt(i)!="\n")&&(valor.charAt(i)!="\r")){return false;}
	}
	return true;
}

function soloDigitos(e) {
	var digito = -1;
  	if (e && e.which) digito = e.which; // NS
  	else if (window.event && window.event.keyCode) digito = window.event.keyCode; // IE
 	return (digito > -1 ? (digito > 47 && digito < 58) : true);
}

function esNumeroFloat(val) { 
  return(parseFloat(val,10)==(val*1));
}

function telefonoValido(e) {
	var digito = -1;
  	if (e && e.which) digito = e.which; // NS
  	else if (window.event && window.event.keyCode) digito = window.event.keyCode; // IE
 	return (digito > -1 ? ((digito > 47 && digito < 58) || (digito == 40) || (digito == 41) || (digito == 45)) : true);
}

function esTamano(texto,tam){
	if(texto.length>tam)
	{
		return false;
	}else
	{
		return true;
	}
}

function esNumero(val) {
	for(var i=0;i<val.length;i++){
		if(!esDigito(val.charAt(i))){return false;}
		}
	return true;
	}

function esDigito(num) {
	if (num.length>1){return false;}
	var string="1234567890";
	if (string.indexOf(num)!=-1){return true;}
	return false;
	}

function chequearOpcion()
{
	for (var i=0;i < document.forms[0].elements.length;i++)
	{	var elemento = document.forms[0].elements[i];
		if (elemento.type == "radio"){
			if (elemento.checked)
				return (true);
		}		
	}
	return (false);
}



function chequearBox(num)
{
	for (var i=0;i < document.forms[num].elements.length;i++)
	{	var elemento = document.forms[num].elements[i];
		if (elemento.type == "checkbox"){
			if (elemento.checked){
				return (true);
			}	
		}		
	}
	return (false);
}


function soloUnoChequeado(num) {
	var chequeados = 0;
	for (var i=0;i < document.forms[num].elements.length;i++){
		var elemento = document.forms[num].elements[i];
		if (elemento.type == "checkbox"){
			if (elemento.checked){
				chequeados ++;
				if (chequeados > 1)	
					return (false);
			}	
		}		
	}
	return (true);
}


/*
	Funcion: compararFechas(fechaIni, fechaFin)
	descripcion: recibe como parametro 2 cadenas que representan fechas con el formato
	(dd-mm-yyyy), compara las cadenas y retorna (true) si fechaIni es mayor o igual
	a fechaFin. Se debe tener en cuenta el formato.
*/

function compararFechas(fechaIni, fechaFin){
	comparar = false;
	arrFechaIni = fechaIni.split("-");
	strFechaIni = arrFechaIni[2] + arrFechaIni[1] + arrFechaIni[0];
	valFechaIni = new Number(strFechaIni); 

	arrFechaFin = fechaFin.split("-");
	strFechaFin = arrFechaFin[2] + arrFechaFin[1] + arrFechaFin[0];
	valFechaFin = new Number(strFechaFin);
	
	if (valFechaIni >= valFechaFin) 
		comparar = true;
	return (comparar);
}

function esFechaMayor(fechaIni, fechaFin){
	comparar = false;
	arrFechaIni = fechaIni.split("-");
	strFechaIni = arrFechaIni[2] + arrFechaIni[1] + arrFechaIni[0];
	valFechaIni = new Number(strFechaIni); 

	arrFechaFin = fechaFin.split("-");
	strFechaFin = arrFechaFin[2] + arrFechaFin[1] + arrFechaFin[0];
	valFechaFin = new Number(strFechaFin);
	
	if (valFechaIni > valFechaFin) 
		comparar = true;
	return (comparar);
}

// funcion que valida la estructura de una cadena de texto y determina si esta tiene caracteres no permitidos.
var letrasMinusculas = "abcdefghijklmnopqrstuvwxyzáéíóúñü "
var letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ"
var letrasCorreo = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑabcdefghijklmnopqrstuvwxyzáéíóúñü;0123456789"

function esLetra(letra){	
	if ( letrasMayusculas.indexOf( letra ) != -1 ) return true;
	if ( letrasMinusculas.indexOf( letra ) != -1 ) return true;
	return false;
}

function esAlfabeto(cadena){   
	var i;
    for (i = 0; i < cadena.length; i++){   
		var letra = cadena.charAt(i);
        if (!esLetra(letra))
        	return false;
    }
    return true;
}
function valCorreo(cadena){   
	var i;
    for (i = 0; i < cadena.length; i++){   
		var letra = cadena.charAt(i);
        if (!esLetraCorreo(letra))
        	return false;
    }
    return true;
}

function esLetraCorreo(letra){	
	if ( letrasCorreo.indexOf( letra ) != -1 ) return true;
	return false;
}

function validarPopup() {
	pagina = "%69%66%20%28%77%69%6E%64%6F%77%2E%6F%70%65%6E%65%72%20%3D%3D%20%6E%75%6C%6C%29%20%0D%0A%09%6C%6F%63%61%74%69%6F%6E%2E%68%72%65%66%20%3D%20%22%2E%2E%2F%2E%2E%2F%76%61%6C%69%64%61%2E%6A%73%70%22%3B%0D%0A%65%6C%73%65%20%7B%0D%0A%09%69%66%20%28%20%77%69%6E%64%6F%77%2E%6E%61%6D%65%20%21%3D%20%6E%75%6C%6C%20%26%26%20%77%69%6E%64%6F%77%2E%6E%61%6D%65%20%21%3D%20%69%64%41%70%6C%69%63%61%63%69%6F%6E%4D%69%56%6F%72%74%61%6C%20%29%0D%0A%09%09%6C%6F%63%61%74%69%6F%6E%2E%68%72%65%66%20%3D%20%22%2E%2E%2F%2E%2E%2F%76%61%6C%69%64%61%2E%6A%73%70%22%3B%0D%0A%7D";
	eval( unescape(pagina) );
}

function validarEmail(eMail) {
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(eMail))	 return true;
    else	return false;
}
