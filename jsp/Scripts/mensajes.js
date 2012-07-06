/*
	@autor: Grupo de Progamacion
	Universidad de Pamplona.
	Pamplona (Norte de Santander). Colombia.
	Septiembre 17 del 2003
	mensajes.js
	Version para Academusoft 3.2
*/

function mensaje(mensaje)
{
	var url ="ventanas/hms_alert.jsp?mensaje="+mensaje;
	window.open(url,'pop_alert','width=416 height=242 top=200 left=300 scrollbars=no status=no ');
}

function confirmacion(mensaje,vinculo)
{
	var url ="ventanas/hms_confirm.htm?mensaje="+mensaje+"&vinculo="+vinculo;
	window.open(url,'pop_alert','width=416 height=242 top=200 left=300 scrollbars=no status=no ');
}

function confirmacionFrm(mensaje,vinculo,frm)
{
	var url ="ventanas/hms_confirm_frm.jsp?mensaje="+mensaje+"&vinculo="+vinculo+"&frm="+frm;
	window.open(url,'pop_alert','width=416 height=242 top=200 left=300 scrollbars=no status=no ');
}

function confirmacionNivel1(mensaje,vinculo)
{
	var url ="ventans/hms_confirm.htm?mensaje="+mensaje+"&vinculo="+vinculo;
	window.open(url,'pop_alert','width=408, height=255, top=200, left=300, scrollbars=no, status=no  ');
}

function mensajeMiVortal(mensaje)
{
	var url ="ventanas/hms_alert.jsp?mensaje="+mensaje;
	window.open(url,'pop_alert','width=416 height=242 top=200 left=300 scrollbars=no status=no ');
}
