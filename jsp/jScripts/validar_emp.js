
function click(frm){
  if (validar(frm) && ejecuta()){
	changeCase(frm.nom);
	changeCase(frm.apellido_empleado);
	changeCase(frm.ocupac_empleado);
    recuperaResidencia();
  }
}

function clicks(frm){
	
  if (validar(frm) && ejecuta() ){
	 if (true == confirm('Esta seguro de Actualizar')){	
	changeCase(frm.nom);
	changeCase(frm.apellido_empleado);
	changeCase(frm.ocupac_empleado);
	actualizar();
	 
	 }
  }
}
function clicks2(frm){
	if(frm.terreno.value=="null"){
		confirm ("Tiene que seleccionar un terreno");
		frm.terreno.focus();
	}
	else{
		ubicarActua();
	}
}

function clicks23(frm){
	if(frm.terreno.value=="null"){
		confirm ("Tiene que seleccionar un terreno");
		frm.terreno.focus();
	}
	else{
		ubicarActua2();
	}
}

function clicks3(frm){  
if(frm.terreno.value=="null"){
		alert ("Tiene que selecionar un terreno");
		frm.terreno.focus();
	}else{

	 if (true == confirm('Esta seguro de Ubicar')){	
		ubicar();
  }}
}
function clicks4(frm){  
if(frm.terreno.value=="null"){
		alert ("Tiene que selecionar un terreno");
		frm.terreno.focus();
	}else{

	 if (true == confirm('Esta seguro de Ubicar')){	
		ubicarani();
  }}
}


function cerrarse(){ 
if (true == confirm('Esta seguro de Salir')){	
window.close()
}
} 



function operacion(frm){
   frm.action ="opera.jsp";
	frm.submit();
}



function operaciones(frm,pag){
	if (true == confirm('Esta seguro de Eliminar')){	
   		frm.action =pag;
   		frm.submit();
	}
}
function actualizarce(frm){
	if (validar(frm) && ejecuta() ){
	  if (true == confirm('Esta seguro de Actualizar')){		 
		actualizar();
	  }
	}
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
var letrasMinusculas = "abcdefghijklmnopqrstuvwxyz "
var letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var letrasCorreo = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz;0123456789"


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


   // Creación de un objeto para manejar los errores
   var error= new crear_error();
   
   // Crea un objeto que guarda un mensaje de error y un 
   // indice a la posición donde se ha producido dentro de una cadena
   function crear_error()
   {
   this.mensaje="";
   this.posicion=0;
   this.rellenar=rellenar;
   }
  
   // Método del objeto "crearerror" que rellena el error con un mensaje
   // explicativo y la posición donde se produjo dentro de la cadena validada
   function rellenar(mensaje,posicion)
   {
   this.mensaje=mensaje;
   this.posicion=posicion;
   return false;
   }

   // Determina si un carácter es un número
   function es_numero(car)
   {
   var NUMEROS="0123456789";
   return (NUMEROS.indexOf(car) >= 0)
   }
   
   // Determina si un año es bisiesto
   function es_bisiesto(anio) 
   {
   if (((anio % 4 == 0) && anio % 100 != 0) ||
       anio % 400 == 0) 
      return true;
   return false;
   }

   // Comprueba si una fecha es correcta
   function comprobar_fecha(contenido,error)
   {
   var separador_fecha="-";
   var numero_separadores=0;

   if ((contenido.length == 0))
      return error.rellenar("Campo vacío no contiene ningún valor ",1);

   // Comprobación de la sintáxis de una fecha 
   for (var i=0; i < contenido.length; i++)
      {
      var caracter=contenido.charAt(i);
     if (!es_numero(caracter) && caracter != separador_fecha)
         return error.rellenar("Carácter ilegal en una fecha",i+1); 
      if (caracter == separador_fecha)
        numero_separadores++ 
      }
   if (numero_separadores != 2)
      return error.rellenar("Faltan separadores en una fecha",i+1); 
    
   // Comprobación de la semántica de una fecha
   /*var posicion_separador_1=contenido.indexOf(separador_fecha);
   var dia=contenido.substring(0,posicion_separador_1);
   var posicion_separador_2=contenido.indexOf(separador_fecha,
                                                        posicion_separador_1+1);
   var mes=contenido.substring(posicion_separador_1+1,posicion_separador_2); 
   var anio=contenido.substring(posicion_separador_2+1,10);
   */
   datos = contenido.split("-");
   var dia = datos[2];
   var mes = datos[1];
   var anio = datos[0];
   //alert (dia+" "+mes+" "+anio);
   if (anio.length != 4)
      return error.rellenar("Año incorrecto en una fecha",0); 
   if (mes < 1 || mes > 12)
      return error.rellenar("Mes incorrecto en una fecha",6);
   
   
   if ((dia < 1 || dia > 31) || (mes == 4 && dia > 30) ||
       (mes == 6 && dia > 30) || (mes == 9 && dia > 30) ||
       (mes == 11 && dia > 30) || (mes == 2 && es_bisiesto(anio) && dia > 29) ||
       (mes == 2 && !es_bisiesto(anio) && dia > 28))
      return error.rellenar("Día incorrecto en una fecha",9);
   return true 
   } 
  
   // Ejecuta la validación pedida
   function ejecuta()
   {
   if (!comprobar_fecha(window.document.form1.nacimiento.value,error))
      {
      alert("El campo NO es válido. ERROR:"+error.mensaje+
            " en la posicion "+error.posicion);
      window.document.form1.nacimiento.focus();
      return false;
			}
        
	 return true;
   }

function validar (frm){
	 if(esVacio(frm.ide.value)){
      alert ("La Identificacion no puede ser vacio");
      frm.ide.focus();
      return false;
    }
    if(!esNumero(frm.ide.value)){
       alert ("La Identificacion debe ser un numero");
	   frm.ide.focus();
       return false;
     }
	if(esVacio(frm.cedula_empleado.value)){
      alert ("La Cedula no puede ser vacio");
      frm.cedula_empleado.focus();
      return false;
    }
    if(!esNumero(frm.cedula_empleado.value)){
       alert ("La Cedula deben ser Numeros");
	   frm.cedula_empleado.focus();
       return false;
     }
    if(esVacio(frm.nom.value)){
       alert ("El Nombre no puede ser vacio");
       frm.nom.focus();
       return false;
     }
     if(!esAlfabeto(frm.nom.value)){
       alert ("El Nombre debe ser alfabeto");
	   frm.nom.focus();
       return false;
     }
	 
	 if(esVacio(frm.apellido_empleado.value)){
       alert ("El Apellido no puede ser vacio");
       frm.apellido_empleado.focus();
       return false;
     }
     if(!esAlfabeto(frm.apellido_empleado.value)){
       alert ("El Apellido debe ser alfabeto");
	   frm.apellido_empleado.focus();
       return false;
     }
	 if(esVacio(frm.ocupac_empleado.value)){
       alert ("La Ocupacion no puede ser vacio");
       frm.ocupac_empleado.focus();
       return false;
     }
     if(!esAlfabeto(frm.ocupac_empleado.value)){
       alert ("La Ocupacion debe ser alfabeto");
       frm.ocupac_empleado.focus();
	   return false;
     }
   
 
return true;
}

function validares(frm){
	 if(esVacio(frm.ide.value)){
      alert ("La Identificacion no puede ser vacio");
      frm.ide.focus();
      return false;
    }
    if(!esNumero(frm.ide.value)){
       alert ("La Identificacion debe ser un numero");
	   frm.ide.focus();
       return false;
     }
	if(esVacio(frm.cedula_empleado.value)){
      alert ("La Cedula no puede ser vacio");
      frm.cedula_empleado.focus();
      return false;
    }
    if(!esNumero(frm.cedula_empleado.value)){
       alert ("La Cedula deben ser Numeros");
	   frm.cedula_empleado.focus();
       return false;
     }
    if(esVacio(frm.nom.value)){
       alert ("El Nombre no puede ser vacio");
       frm.nom.focus();
       return false;
     }
	 
     if(!esAlfabeto(frm.nom.value)){
       alert ("El Nombre debe ser alfabeto");
	   frm.nom.focus();
       return false;
     }
	 
	 if(esVacio(frm.ocupac_empleado.value)){
       alert ("La Ocupacion no puede ser vacio");
       frm.ocupac_empleado.focus();
       return false;
     }
     if(!esAlfabeto(frm.ocupac_empleado.value)){
       alert ("La Ocupacion debe ser alfabeto");
       frm.ocupac_empleado.focus();
	   return false;
     }
   
 
return true;
}
function validar3(frm){
	 if(esVacio(frm.ide.value)){
      alert ("La Identificacion no puede ser vacio");
      frm.ide.focus();
      return false;
    }
   return true;
}
var ajax;
function funcionCallback()
{
// Comprobamos si la peticion se ha completado (estado 4)
   if( ajax.readyState == 4 ){
        // Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
        if( ajax.status == 200 ){
             // Escribimos el resultado en la pagina HTML mediante DHTML
             document.all.salida.innerHTML = "<b>"+ajax.responseText+"</b>";
        }
    }
}
function recuperaResidencia()
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
    ajax.open( "GET", "emp_insert11.jsp?ide="+document.all.ide.value+"&cedula_empleado="+document.all.cedula_empleado.value+"&nom="+document.all.nom.value+"&apellido_empleado="+document.all.apellido_empleado.value+"&ocupac_empleado="+document.all.ocupac_empleado.value+"&nacimiento="+document.all.nacimiento.value, true );
    ajax.send( "" );
}

function actualizar()
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
  ajax.open( "GET", "emp_update11.jsp?ide="+document.all.ide.value+"&cedula_empleado="+document.all.cedula_empleado.value+"&nom="+document.all.nom.value+"&apellido_empleado="+document.all.apellido_empleado.value+"&ocupac_empleado="+document.all.ocupac_empleado.value+"&nacimiento="+document.all.nacimiento.value, true );
    ajax.send( "" );
}

function ubicar()
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
  ajax.open( "GET", "ubicaempleado.jsp?codigo_empleado="+document.all.codigo_empleado.value+"&terreno="+document.all.terreno.value, true );
    ajax.send( "" );
}

function ubicarActua()
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
  ajax.open( "GET", "verubicacion3_update11.jsp?codigo_empleado="+document.all.codigo_empleado.value+"&terreno="+document.all.terreno.value, true );
    ajax.send( "" );
}
function ubicarActua2()
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
  ajax.open( "GET", "verubicacion35_update11.jsp?animal_codigo="+document.all.animal_codigo.value+"&terreno="+document.all.terreno.value, true );
    ajax.send( "" );
}
function ubicarani()
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
  ajax.open( "GET", "ubicaanimal.jsp?animal_codigo="+document.all.animal_codigo.value+"&terreno="+document.all.terreno.value, true );
    ajax.send( "" );
}


function changeCase(frmObj) {
var index;
var tmpStr;
var tmpChar;
var preString;
var postString;
var strlen;
tmpStr = frmObj.value.toLowerCase();
strLen = tmpStr.length;
if (strLen > 0)  {
for (index = 0; index < strLen; index++)  {
if (index == 0)  {
tmpChar = tmpStr.substring(0,1).toUpperCase();
postString = tmpStr.substring(1,strLen);
tmpStr = tmpChar + postString;
}
else {
tmpChar = tmpStr.substring(index, index+1);
if (tmpChar == " " && index < (strLen-1))  {
tmpChar = tmpStr.substring(index+1, index+2).toUpperCase();
preString = tmpStr.substring(0, index+1);
postString = tmpStr.substring(index+2,strLen);
tmpStr = preString + tmpChar + postString;
         }
      }
   }
}
frmObj.value = tmpStr;
}

//Muestra segundos
function muestraSeg()
  {
  hoyseg=new Date();
  document.formi.seg.value=hoyseg.getSeconds();
  setTimeout("muestraSeg()",1000);
  }

//Muestra minutos
function muestraMin()
  {
  hoymin=new Date();
  document.formi.min.value=hoymin.getMinutes();
  setTimeout("muestraMin()",1000);
  }

//Muestra horas
function muestraHour()
  {
  hoyhour=new Date();
  document.formi.hour.value=hoyhour.getHours();
  setTimeout("muestraHour()",1000);
  }

//Muestra día
function muestraDay()
  {
  hoyday=new Date();
  document.formi.day.value=hoyday.getDate();
  setTimeout("muestraDay()",1000);
  }

//Muestra mes
function muestraMon()
  {
  hoymonth=new Date();
  document.formi.month.value=hoymonth.getMonth();
  
  if(document.formi.month.value==0){
   document.formi.month.value="Enero"
  }else if(document.formi.month.value==1){
   document.formi.month.value="Febrero"
  }else if(document.formi.month.value==2){
   document.formi.month.value="Marzo"
  }else if(document.formi.month.value==3){
   document.formi.month.value="Abril"
  }else if(document.formi.month.value==4){
   document.formi.month.value="Mayo"
  }else if(document.formi.month.value==5){
   document.formi.month.value="Junio"
  }else if(document.formi.month.value==6){
   document.formi.month.value="Julio"
  }else if(document.formi.month.value==7){
   document.formi.month.value="Agosto"
  }else if(document.formi.month.value==8){
   document.formi.month.value="Septiembre"
  }else if(document.formi.month.value==9){
   document.formi.month.value="Octubre"
  }else if(document.formi.month.value==10){
   document.formi.month.value="Noviembre"
  }else{
   document.formi.month.value="Diciembre"
  }
  
  setTimeout("muestraMon()",1000);
  }

//Muestra semana
function muestraSem()
  {
  hoysem=new Date();
  document.formi.sem.value=hoysem.getDay();
  
  if(document.formi.sem.value==0){
   document.formi.sem.value="Domingo"
  }else if(document.formi.sem.value==1){
   document.formi.sem.value="Lunes"
  }else if(document.formi.sem.value==2){
   document.formi.sem.value="Martes"
  }else if(document.formi.sem.value==3){
   document.formi.sem.value="Miércoles"
  }else if(document.formi.sem.value==4){
   document.formi.sem.value="Jueves"
  }else if(document.formi.sem.value==5){
   document.formi.sem.value="Viernes"
  }else{
   document.formi.sem.value="Sábado"
  }
  setTimeout("muestraSem()",1000);
  }

//Muestra año
function muestraYear()
  {
  hoyyear=new Date();
  document.formi.year.value=hoyyear.getFullYear();
  
  if ((document.formi.hour.value==0)&&(document.formi.min.value==0)&&(document.formi.seg.value==0)&&(document.formi.day.value==1)&&(document.formi.month.value=="Enero"))
  	{
  	alert("Feliz año " + document.formi.year.value);
  	return true;
  	}
  setTimeout("muestraYear()",1000);
  }


