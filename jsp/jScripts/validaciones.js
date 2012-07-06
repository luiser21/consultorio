/**
 * Hersoft Gestion Documental
 * Consultorio Juridico
 * @author Ing. Luis Cardenas M.
 * @version 4.1 2012/05/01
*/
function esCla(valor){
	if(valor=="Elija una Clasificación"){return true;}
	for(var i=0;i<valor.length;i++) {
		if ((valor.charAt(i)!=' ')&&(valor.charAt(i)!="\t")&&(valor.charAt(i)!="\n")&&(valor.charAt(i)!="\r")){return false;}
	}
	return true;
}

function esVacio(valor){
	if(valor==null){return true;}
	for(var i=0;i<valor.length;i++) {
		if ((valor.charAt(i)!=' ')&&(valor.charAt(i)!="\t")&&(valor.charAt(i)!="\n")&&(valor.charAt(i)!="\r")){return false;}
	}
	return true;
}
function ValidaHora( valor ){   
        var er_fh = /^(1|01|2|02|3|03|4|04|5|05|6|06|7|07|8|08|9|09|10|11|12)\:([0-5]0|[0-5][1-9])\:([0-5]0|[0-5][1-9])\ (AM|PM|am|pm)$/   
        if( valor == "" ){   
                alert("Introduzca la hora.");
				//valor.focus();
                return false;   
        }   
        if ( !(er_fh.test( valor )) ){    
                alert("El dato en el campo hora no es válido. \n    Debe ser de la siguiente forma \n              HH:MM:SS am/pm");   
               //valor.focus();
				return false;   
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

function ValorChequeado(frm)
{
	for (var i=0;i < frm.elements.length;i++)
	{	var elemento = frm.elements[i];
		if (elemento.type == "radio"){
			if (elemento.checked)
				return (elemento.value);
		}		
	}
}

function ValorTitleChequeado(frm)
{
	for (var i=0;i < frm.elements.length;i++)
	{	var elemento = frm.elements[i];
		if (elemento.type == "radio"){
			if (elemento.checked)
				return (elemento.title);
		}		
	}
}

function chequeado(num)
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
function validate(frm){
for(var i = 0; i < frm.choice.length; i++){
if(frm.choice[i].checked)return true;
}
alert('Debes seleccionar al menos una opcion');
return false;
} 

function contarChequeado()
{
	var total=0;
	for (var i=0;i < document.forms[1].elements.length;i++)
	{	var elemento = document.forms[1].elements[i];
		if (elemento.type == "checkbox"){
			if (elemento.checked)
				total = total + 1;		
		}		
	}
	return (total);
}

function soloDigitosScort(e) {
	var digito = -1;
  	if (e && e.which) digito = e.which; // NS
  	else if (window.event && window.event.keyCode) digito = window.event.keyCode; // IE
 	return (digito > -1 ? (digito > 47 && digito < 58 || digito == 45) : true);
}

function soloDigitosDecimal(e) {
	var digito = -1;
  	if (e && e.which) digito = e.which; // NS
  	else if (window.event && window.event.keyCode) digito = window.event.keyCode; // IE
	return (digito > -1 ? (digito > 47 && digito < 58 || digito == 46) : true);
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

function esFechaMayorEdad(fechaIni, fechaFin){
	comparar = false;
	arrFechaIni = fechaIni.split("-");
	strFechaIni = arrFechaIni[2];
	valFechaIni = new Number(strFechaIni); 
	arrFechaFin = fechaFin.split("-");
	strFechaFin = arrFechaFin[2];
	valFechaFin = new Number(strFechaFin);
	diferencia = new Number(valFechaFin - valFechaIni);
	if (diferencia<18) 
		comparar = true;
	return (comparar);
}

function esFechaHoraMayor(fechaIni, fechaFin){
	comparar = false;
	arrFechaHoraIni = fechaIni.split(" ");
	strHora = arrFechaHoraIni[1].split(":");
	arrHora = strHora[0] + strHora[1] + strHora[2];
	strFechaIni = arrHora + "-" + arrFechaHoraIni[0];
	arrFecha1 = strFechaIni.split("-");
	strFechaIni1 =   arrFecha1[3] + arrFecha1[2] + arrFecha1[1] + arrFecha1[0];
	valFechaIni = new Number(strFechaIni1); 

	arrFechaHoraFin = fechaFin.split(" ");
	strHoraF = arrFechaHoraFin[1].split(":");
	arrHoraF = strHoraF[0] + strHoraF[1] + strHoraF[2];
	strFechaFin =  arrHoraF + "-" + arrFechaHoraFin[0];
	arrFecha2 = strFechaFin.split("-");
	strFechaFin2 =  arrFecha2[3] + arrFecha2[2] + arrFecha2[1] + arrFecha2[0];
	valFechaFin = new Number(strFechaFin2);
	if (valFechaIni >= valFechaFin) 
		comparar = true;
	return (comparar);
}

// funcion que valida la estructura de una cadena de texto y determina si esta tiene caracteres no permitidos.
var letrasMinusculas = "abcdefghijklmnopqrstuvwxyzáéíóúñü "
var letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ"
var letrasCorreo = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑabcdefghijklmnopqrstuvwxyzáéíóúñü;0123456789"
var letrasContrasena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

function esLetra(letra){	
	if ( letrasMayusculas.indexOf( letra ) != -1 ) return true;
	if ( letrasMinusculas.indexOf( letra ) != -1 ) return true;
	return false;
}

function esLetraContrasena(letra){	
	if ( letrasContrasena.indexOf( letra ) != -1 ) return true;
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

function esContrasenaValida(cadena){   
	var i;
	for (i = 0; i < cadena.length; i++){   
		var letra = cadena.charAt(i);
		if (!esLetraContrasena(letra))
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
	if ( letrasCorreo.indexOf( letra ) != -1) return true;
	return false;
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

function validarEmail(valor) {
  if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true)
  } else {
    return (false);
  }
}

function chequearOpcionNombre(frm,nombre)
{
	for (var i=0;i < frm.elements.length;i++)
	{	var elemento = frm.elements[i];
		if (elemento.type == "radio" && elemento.name == nombre){
			if (elemento.checked)
				return (true);
		}		
	}
	return (false);
}

function chequeadoNombre(frm,nombre)
{
	for (var i=0;i < frm.elements.length;i++)
	{	var elemento = frm.elements[i];
		if (elemento.type == "checkbox" && elemento.name == nombre){
			if (elemento.checked)
				return (true);
		}		
	}
	return (false);
}


function maxTamano(campo,tamano)
{
  var resul = true;
  var diff = tamano - campo.value.length;
  if (campo.value.length >= tamano)
    resul = false;
  
  if (window.event)
    window.event.returnValue = resul;
  if (diff < 0)
    campo.value = campo.value.substring(0,tamano);	
  
  return resul;
}

function maxTamanoNombreArchivo(archivo,tamano){
	var resul = true;
	if(!esVacio(archivo)){
		var cad=archivo;
		var len=archivo.length-1;
		var aux="";
		var cadAux="";
		
		aux=cad.substring(len,len+1);
		while(aux!='\\'){
			cadAux+=aux;
			len--;
			aux=cad.substring(len,len+1);
		}
		if(cadAux.length>tamano) 
			resul=false;
	}
	return resul;
}

function ampliarArea(area,tamano) {
	area.rows = Number(area.rows) + Number(tamano);
}

function reducirArea(area,tamano) {
	var tamActual = 0;
	tamActual = Number(area.rows) - Number(tamano);
	if (tamActual>0) 
		area.rows = tamActual;
}
