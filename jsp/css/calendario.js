/*
 *      Titulo: Calendario.js
 *     @author: Elvis Navarro Vega
 *     Version: 2.1
 * Descripcion: Se desarrollo para la implementacion de Calendario.jsp, verificando
 *              la validez del formato de la fecha de entradad.
 */

var NUM_CENTYEAR = 30;
var CAL_COMPONENTEHORA = false;
var calendarios = [];
var RE_NUM = /^\-?\d+$/;

function calendario(objeto){
	this.asignarfecha     = calendario_asignar_fecha;
	this.asignarhora      = calendario_asignar_hora;
	this.asignarfechahora = calendario_asignar_fechahora;
	this.obtenerfecha     = calendario_obtener_fecha;
	this.obtenerhora      = calendario_obtener_hora;
	this.obtenerfechahora = calendario_obtener_fechahora;
	this.popup            = calendario_popup;
	this.popup2           = calendario_popup2;
	this.popupCEG           = calendario_popupCEG;

	if (!objeto)
		return Error("Error CAL101.\nNo hay un control especificado para el calendario.");
	if (objeto.value == null)
		return Error("Error CAL102.\nEl parametro especificado en el control no es valido.");
	this.objeto = objeto;
	this.componentehora = CAL_COMPONENTEHORA;

	this.identificador = calendarios.length;
	calendarios[this.identificador] = this;

}

function calendario_popup (infechahora) {
	this.fechahora = this.obtenerfechahora(infechahora ? infechahora : this.objeto.value);
	if (!this.fechahora) return;

	this.fechahora = this.asignarfechahora(this.fechahora);

	var objetoWindow = window.open(
		'calendario.jsp?fechahora=' + this.fechahora + '&identificador=' + this.identificador,
		'Calendario', 'width=200,height=' + (this.componentehora ? 215 : 190) +
		',status=no,resizable=no,top=250,left=350,dependent=yes,alwaysRaised=yes'
	);
	objetoWindow.opener = window;
	objetoWindow.focus();
}

function calendario_popup2 (infechahora) {
	this.fechahora = this.obtenerfechahora(infechahora ? infechahora : this.objeto.value);
	if (!this.fechahora) return;

	this.fechahora = this.asignarfechahora(this.fechahora);

	var objetoWindow = window.open(
		'calendario2.jsp?fechahora=' + this.fechahora + '&identificador=' + this.identificador,
		'Calendario', 'width=200,height=' + (this.componentehora ? 215 : 190) +
		',status=no,resizable=no,top=250,left=350,dependent=yes,alwaysRaised=yes'
	);
	objetoWindow.opener = window;
	objetoWindow.focus();
}

function calendario_popupCEG (infechahora) {
	this.fechahora = this.obtenerfechahora(infechahora ? infechahora : this.objeto.value);
	if (!this.fechahora) return;

	this.fechahora = this.asignarfechahora(this.fechahora);

	var objetoWindow = window.open(
		'calendario_ceg.jsp?fechahora=' + this.fechahora + '&identificador=' + this.identificador,
		'Calendario', 'width=200,height=' + (this.componentehora ? 215 : 190) +
		',status=no,resizable=no,top=250,left=350,dependent=yes,alwaysRaised=yes'
	);
	objetoWindow.opener = window;
	objetoWindow.focus();
}

function calendario_asignar_fechahora (infechahora) {
	return(this.asignarfecha(infechahora) + ' ' + this.asignarhora(infechahora));
}

function calendario_asignar_fecha (infechahora) {
	return (
		(infechahora.getDate() < 10 ? '0' : '') + infechahora.getDate() + "-"
		+ (infechahora.getMonth() < 9 ? '0' : '') + (infechahora.getMonth() + 1) + "-"
		+ infechahora.getFullYear()
	);
}

function calendario_asignar_hora (infechahora) {
	return (
		(infechahora.getHours() < 10 ? '0' : '') + infechahora.getHours() + ":"
		+ (infechahora.getMinutes() < 10 ? '0' : '') + (infechahora.getMinutes()) + ":"
		+ (infechahora.getSeconds() < 10 ? '0' : '') + (infechahora.getSeconds())
	);
}

function calendario_obtener_fechahora (infechahora) {
	if (!infechahora)
		return (new Date());

	if (RE_NUM.exec(infechahora))
		return new Date(infechahora);
		
	var arrfechahora = infechahora.split(' ');
	return this.obtenerhora(arrfechahora[1], this.obtenerfecha(arrfechahora[0]));
}

function calendario_obtener_fecha (strfecha) {

	var arrfecha = strfecha.split('-');

	if (arrfecha.length != 3) 		return Error ("Error fec101.\nInvalido formato de fecha: '" + strfecha + "'.\nEl formato valido es dd-mm-yyyy.");
	if (!arrfecha[0]) 		  		return Error ("Error fec101.01\nInvalido formato de fecha: '" + strfecha + "'.\nNo hay dia especificado para el mes.");
	if (!RE_NUM.exec(arrfecha[0])) 	return Error ("Error fec101.02\nInvalido valor para el día del mes: '" + arrfecha[0] + "'.\nValores permitidos solo enteros sin signo.");
	if (!arrfecha[1]) 		  		return Error ("Error fec101.03\nInvalido formato de fecha: '" + strfecha + "'.\nNo hay valor indicado para el mes.");
	if (!RE_NUM.exec(arrfecha[1])) 	return Error ("Error fec101.04\nInvalido valor para el mes: '" + arrfecha[1] + "'.\nValores permitidos solo enteros sin signo.");
	if (!arrfecha[2]) 				return Error ("Error fec101.05\nInvalido formato de fecha: '" + strfecha + "'.\nNo hay valor indicado para el año.");
	if (!RE_NUM.exec(arrfecha[2])) 	return Error ("Error fec101.06\nInvalido valor para el año: '" + arrfecha[2] + "'.\nValores permitidos solo enteros sin signo.");

	var fecha = new Date();

	fecha.setDate(1);
	if (arrfecha[1] < 1 || arrfecha[1] > 12) return Error ("Error fec101.07\nInvalido valor para el mes: '" + arrfecha[1] + "'.\nEl rango permitido es 01-12.");
	fecha.setMonth(arrfecha[1]-1);

	if (arrfecha[2] < 100) arrfecha[2] = Number(arrfecha[2]) + (arrfecha[2] < NUM_CENTYEAR ? 2000 : 1900);
	fecha.setFullYear(arrfecha[2]);

	var dias = new Date(arrfecha[2], arrfecha[1], 0);
	fecha.setDate(arrfecha[0]);
	if (fecha.getMonth() != (arrfecha[1]-1)) return Error ("Error fec101.08\nInvalido valor del dia para el mes: '" + arrfecha[0] + "'.\nEl rango permitido es 01-"+ dias.getDate() + ".");
	return (fecha);
}


function calendario_obtener_hora(strhora, fecha){
	if (!fecha) return null;

	var arrhora = String(strhora ? strhora : '').split(':');

	if (!arrhora[0])	fecha.setHours(0);
	else if (RE_NUM.exec(arrhora[0]))
		if (arrhora[0] < 24) 	fecha.setHours(arrhora[0]);
		else	return Error ("Error hor201.01\nInvalido valor para la hora: '" + arrhora[0] + "'\nEl rango permitido es entre 00-23.");
	else	return Error ("Error hor201.02\nInvalido valor para la hora: '" + arrhora[0] + "'.\nLos valores permitidos son numeros positivos")		

	if (!arrhora[1])	fecha.setMinutes(0);
	else if (RE_NUM.exec(arrhora[1]))
		if (arrhora[1] < 60)	fecha.setMinutes(arrhora[1]);
		else	return Error ("Error hor201.03\nInvalido valor para los minutos: '" + arrhora[1] + "'.\nRango permitido entre 00-59.");
	else 	return Error ("Error hor201.04\nInvalido valor para los minutos: '" + arrhora[1] + "'.\nValores permitidos son numeros positivos."); 
	
	if (!arrhora[2])	fecha.setSeconds(0);
	else if (RE_NUM.exec(arrhora[2]))
		if (arrhora[2] < 60)	fecha.setSeconds(arrhora[2]);
		else	return Error("Error hor201.05\nInvalido valor para los segundos: '" + arrhora[2] + "'.\nRango permitido entre 00-59.");
	else	return Error("Error hor201.06\nInvalido valor para los segundos: '" + arrhora[2] + "'.\nValores permitidos son numeros positivos.");

	fecha.setMilliseconds(0);
	return fecha;

}


function Error(mensaje){
	alert(mensaje);
	return null;

}