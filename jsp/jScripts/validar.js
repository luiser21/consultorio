

var ajax;
function funcionCallback()
{
if( ajax.readyState == 4 )
{
if( ajax.status == 200 )
{
document.all.salida.innerHTML = "<b>"+ajax.responseText+"</b>";
}
}
}

function registraMuerte()
{
// Creamos el control XMLHttpRequest segun el navegador en el que estemos
if( window.XMLHttpRequest )
ajax = new XMLHttpRequest(); // No Internet Explorer
else
ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
// Almacenamos en el control al funcion que se invocara cuando la peticion
// cambie de estado
ajax.onreadystatechange = funcionCallback;
// Enviamos la peticion
ajax.open( "GET", "Animal_Muerte.jsp?animal_codigo="+document.all.animal_codigo.value+"&muerte_fecha="+document.all.muerte_fecha.value, true );

ajax.send( "" );
}

function registraPeso()
{
// Creamos el control XMLHttpRequest segun el navegador en el que estemos
if( window.XMLHttpRequest )
ajax = new XMLHttpRequest(); // No Internet Explorer
else
ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
// Almacenamos en el control al funcion que se invocara cuando la peticion
// cambie de estado
ajax.onreadystatechange = funcionCallback;
// Enviamos la peticion
ajax.open( "GET", "Animal_Peso.jsp?animal_codigo="+document.all.animal_codigo.value+"&peso_fecha="+document.all.peso_fecha.value+"&peso_actual="+document.all.peso_actual.value, true );
ajax.send( "" );
}


function Listar()
{
// Creamos el control XMLHttpRequest segun el navegador en el que estemos
if( window.XMLHttpRequest )
ajax = new XMLHttpRequest(); // No Internet Explorer
else
ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
// Almacenamos en el control al funcion que se invocara cuando la peticion
// cambie de estado
ajax.onreadystatechange = funcionCallback;
// Enviamos la peticion
//alert(document.all.grupo.value);
ajax.open( "GET", "cliente_list2.jsp?buscar="+document.all.buscar.value, true );
ajax.send( "" );
}



function buscar()
{
// Creamos el control XMLHttpRequest segun el navegador en el que estemos
if( window.XMLHttpRequest )
ajax = new XMLHttpRequest(); // No Internet Explorer
else
ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
// Almacenamos en el control al funcion que se invocara cuando la peticion
// cambie de estado
ajax.onreadystatechange = funcionCallback;
// Enviamos la peticion
ajax.open( "GET", "listar.jsp?sexo="+document.all.sexo.value+"&estado="+document.all.estado.value, true );

ajax.send( "" );
}

function llamar()
{
// Creamos el control XMLHttpRequest segun el navegador en el que estemos
if( window.XMLHttpRequest )
ajax = new XMLHttpRequest(); // No Internet Explorer
else
ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
// Almacenamos en el control al funcion que se invocara cuando la peticion
// cambie de estado
ajax.onreadystatechange = funcionCallback;
// Enviamos la peticion
//alert(document.all.grupo.value);
ajax.open( "GET", "cliente_list2.jsp?buscar="+document.all.buscar.value, true );
ajax.send( "" );
}




//------------------------------VALIDAR ANIMAL-----------------------------------

function asignar(frm, codigo, nombre, nacim,sexo,raza, padre,madre,imag){
	//alert ("sirve"+imag);

if(codigo=="null") frm.animal_codigo.value="";
else          	frm.animal_codigo.value=codigo;
	
if(nombre=="null") frm.animal_nombre.value="";
else          	frm.animal_nombre.value=nombre;

if(nacim=="null") frm.nacimento.value="";
else          	frm.nacimiento.value=nacim;	
/*
if(imag=="null") frm.imagen.value="xxxx";
else          	 frm.imagen.value=imag;	
*/

if(sexo=="null") {}
else          	frm.animal_sexo.value=sexo;	


if(raza=="null") {}
else          	frm.raza.value=raza;	


if(padre=="null") {}
else          	frm.padre.value=padre;	

if(madre=="null") {}
else          	frm.madre.value=madre;	



}
	
function iniciar(frm){
	//alert ("iniciar");
	frm.buscar.focus();
}



function asignarCliente(frm, codigo, nombre, apellido,tele){
	//alert ("sirve"+raza);

if(codigo=="null") frm.cliente_cedula.value="";
else          	frm.cliente_cedula.value=codigo;
	
if(nombre=="null") frm.cliente_nombre.value="";
else          	frm.cliente_nombre.value=nombre;

if(apellido=="null") frm.cliente_apellido.value="";
else          	    frm.cliente_apellido.value=apellido;	

	
if(tele=="null") frm.cliente_telefono.value="";
else          	    frm.cliente_telefono.value=tele;	

}


function asignarFactura(frm, codigo, fecha,pago,cliente){
	
	//alert (pago);
if(codigo=="null") frm.factura_codigo.value="";
else          	   frm.factura_codigo.value=codigo;
	
if(fecha=="null") frm.factura_fecha.value="";
else          	frm.factura_fecha.value=fecha;

if(pago=="null")    frm.factura_pago.value="contado";
else          	    frm.factura_pago.value=pago;	

	
if(cliente=="null") frm.cliente_cedula.value="";
else          	   frm.cliente_cedula.value=cliente;	
}



function cargarLista(frm, sexo, estado){
	
	alert (estado);
if(codigo=="null") frm.sexo.value="";
else          	   frm.sexo.value=sexo;
	
if(estado=="null") frm.estado.value="";
else          	  frm.estado.value=estado;


}



function validarAnimal (frm){
	
if(esVacio(frm.animal_codigo.value)) {
alert ("el campo de codigo esta vacio");
frm.animal_codigo.focus();
return false;
							}

if(!esNumero(frm.animal_codigo.value)) {
alert ("El codigo debe ser numerico");
frm.animal_codigo.focus();
return false;
							}


if(frm.raza.value=="null") {
alert ("Seleccione la raza del animal");
return false;

}
if(frm.animal_sexo.value=="null") {
alert ("Seleccione el sexo del animal");
return false;
							}
if(esVacio(frm.nacimiento.value)) {
alert ("el campo nacimiento esta vacio");
frm.nacimiento.focus();
return false;
							}
							
var resp=confirm("esta seguro que desea agregar este animal");
if (resp==false){return false;}
else return true;
}


function operacionAnimal(frm,pag){
   frm.action =pag;
  if (validarAnimal(frm)==false){}
  
  else {
	  frm.submit();
	  }
   
 }

//-------------------------------------------------------------------------------




//------------------------------VALIDAR factura-----------------------------------

function validarFactura (frm){


	
	if(esVacio(frm.factura_codigo.value)) {
			alert ("el campo de codigo esta vacio");
			frm.factura_codigo.focus();
	return false;
							}

	if(!esNumero(frm.factura_codigo.value)) {
			alert ("el codigo debe ser  numerico");
			frm.factura_codigo.focus();
	return false;
							}

							
	if(esVacio(frm.factura_fecha.value)) {
			alert ("el campo fecha esta vacio");
			frm.factura_fecha.focus();
	return false;
							}
							
	if(esVacio(frm.cliente_cedula.value)) {
			alert ("el campo cedula esta vacio");
			frm.cliente_cedula.focus();
	return false;
							}

	if(!esNumero(frm.cliente_cedula.value)) {
		alert ("el campo de cedula debe ser numero");
		frm.cliente_cedula.focus();
	return false;
							}


var resp=confirm("esta seguro que desea agregar esta factura");
if (resp==false){return false;}
else return true;

}


function operacionFactura(frm,pag){
   frm.action =pag;
  if (validarFactura(frm)==false){}
  
  else {
	  frm.submit();
	  }
   
 }

//-------------------------------------------------------------------------------



//------------------------------VALIDAR cliente-----------------------------------

function validarCliente (frm){
		
		
		if(esVacio(frm.cliente_cedula.value)) {
		alert ("el campo de cedula esta vacio");
		frm.cliente_cedula.focus();
		return false;
									}
		
		if(!esNumero(frm.cliente_cedula.value)) {
		alert ("el campo de cedula debe ser numero");
		frm.cliente_cedula.focus();
		return false;
									}
		
		
		if(esVacio(frm.cliente_apellido.value)) {
		alert ("el campo apellido esta vacio");
		frm.cliente_apellido.focus();
		return false;
									}
									
		if(esVacio(frm.cliente_nombre.value)) {
		alert ("el campo nombre esta vacio");
		frm.cliente_nombre.focus();
		return false;
							}
							

var resp=confirm("esta seguro que desea agregar este cliente");
if (resp==false){return false;}
else return true;

}


function operacionCliente(frm,pag){
  
  frm.action =pag;
  if (validarCliente(frm)==false){}
  
  else {
	  frm.submit();
	  }
   
 }

//-------------------------------------------------------------------------------


function validarVenta (frm){
		
		if(frm.animal_codigo.value=="null") {
		alert ("Seleccione un animal ");
		return false;
									}
								
		
		if(esVacio(frm.venta_valor.value)) {
		alert ("Agrege un valor para la venta");
		frm.venta_valor.focus();
		return false;
									}
		
		if(!esNumero(frm.venta_valor.value)) {
		alert ("El valor debe ser numerico");
		frm.venta_valor.focus();
		return false;
									}
		
		
			
		

var resp=confirm("esta seguro que desea agregar esta Venta");
if (resp==false){return false;}
else return true;

}


function operacionVenta(frm,pag){
  
  frm.action =pag;
  if (validarVenta(frm)==false){}
  
  else {
	  frm.submit();
	  }
   
 }


//------------------------------------------------------------------------------

function operacion(frm,pag){
   frm.action =pag;
   frm.submit();
	 
 }

function operacion2(frm,pag){
   frm.action =pag;
   frm.submit();
   //alert("lega");
   frm.estado.focus();	 
 }



function operacionEliminar(frm,pag){
   frm.action =pag;   
var resp=confirm("esta seguro que desea eliminar");
if (resp==false){}
else 
   frm.submit();
	 
 }

//--------------------------------------------------------------------------------------------------------------

function validarRadio (frm,msg){
var i;
var a=0;

var x;

for (i=0; i<frm.factura_codigo.length;i++){
	if(frm.factura_codigo[i].checked) {a=1; }
	}


if (a==0){ alert ("Seleccione una factura \n para "+msg); return false;}

else {
var resp=confirm("Esta seguro que desea "+msg);
if (resp==false){return false;}
else return true;
}

}




function operacionRadio(frm,pag,msg){
  
  frm.action =pag;
  if (validarRadio(frm,msg)==false){}
  
  else {
	  frm.submit();
	  }
   
 }

//--------------------------------------------------------------------------------------------

function validarRadio2 (frm,msg){
var i;
var a=0;

var x;

for (i=0; i<frm.animal_codigo.length;i++){
	if(frm.animal_codigo[i].checked) {a=1; }
	}


if (a==0){ alert ("Seleccione un animal \n para "+msg); return false;}

else {
var resp=confirm("Esta seguro que desea "+msg);
if (resp==false){return false;}
else return true;
}

}




function operacionRadio2(frm,pag,msg){
  
  frm.action =pag;
  if (validarRadio2(frm,msg)==false){}
  
  else {
	  frm.submit();
	  }
   
 }

//--------------------------------------------------------------------------------------------------------------




function restaurar(frm){
	frm.reset();
}


function eliminar(frm,pag){
  if (true == confirm('Esta seguro de eliminar')){
    frm.action =pag;
    frm.submit();
  }
}

function esVacio(valor){
	if(valor==null){ return true;}
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
