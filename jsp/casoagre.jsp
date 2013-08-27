<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>



<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");

if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
String rol=(String)session.getAttribute("roles");
Conex con = new Conex();

String periodo=String.valueOf(request.getParameter("periodo"));
%>
<script>
	$(document).ready(function(){
			$(".iframe3").colorbox({iframe:true, width:"350px", height:"200px"});	
					
		});	
</script>
<script language="javascript">
function mueveReloj(){
    momentoActual = new Date()
    hora = momentoActual.getHours()
    minuto = momentoActual.getMinutes()
    segundo = momentoActual.getSeconds()

    horaImprimible = hora + " : " + minuto + " : " + segundo

    document.form1.reloj.value = horaImprimible

    setTimeout("mueveReloj()",1000)
} 
function volver(frm){
		frm.action="casos.jsp";
		frm.submit();		
}
function agregarOpciones(form){
	var selec = form.sisben.options;
	var combo = form.numerosisben.options;
	combo.length = null;
    if (selec[0].selected == true){
		var seleccionar = new Option("Seleccion...","","","");
		combo[0] = seleccionar;
    }if (selec[1].selected == true){
		var popular1 = new Option("UNO","UNO","","");
		var popular2 = new Option("DOS","DOS","","");
		combo[0] = popular1;
		combo[1] = popular2;
    }if (selec[2].selected == true){
		var academica1 = new Option("NO","NO","","");
		combo[0] = academica1;
    }
}
function agregarOpciones2(form){
	var selec = form.sexo.options;
	var combo = form.embarazada.options;
	combo.length = null;
    if (selec[0].selected == true){
		var seleccionar = new Option("Seleccion...","","","");
		combo[0] = seleccionar;
    }if (selec[1].selected == true){
		var popular1 = new Option("NO","NO","","");
		var popular2 = new Option("SI","SI","","");
		combo[0] = popular1;
		combo[1] = popular2;
    }if (selec[2].selected == true){
		 var academica1 = new Option("NO","NO","","");
		 combo[0] = academica1;
    }
}
function activar(elemento){

	if(elemento.discapacidad.options[elemento.discapacidad.selectedIndex].text=="SI"){
    	document.getElementById("aparece").style.display = "inline";
  	}else{
    	document.getElementById("aparece").style.display = "none";}
  	}
function activar2(elemento){

if(elemento.grupoet.options[elemento.grupoet.selectedIndex].text=="SI")
  {
    document.getElementById("aparece2").style.display = "inline";
  }
else
  {
     document.getElementById("aparece2").style.display = "none";}
  }
   function activar3(elemento)
{

if(elemento.nivelesco.options[elemento.nivelesco.selectedIndex].text=="OTRO")
  {
    
    document.getElementById("aparece3").style.display = "inline";
  }
else
  {
     document.getElementById("aparece3").style.display = "none";}
  }
  function activar4(elemento)
{

if(elemento.desplazado.options[elemento.desplazado.selectedIndex].text=="SI")
  {
    
	
    document.getElementById("aparece4").style.display = "inline";
		 document.getElementById("cal-field-2_des").style.display = "inline";
	  document.getElementById("cal-button-2_des").style.display = "inline";
	 document.getElementById("aparece6").style.display = "inline";
	 document.getElementById("aparece7").style.display = "inline";
	 document.getElementById("aparece8").style.display = "inline";
	 document.getElementById("aparece9").style.display = "inline";
	 document.getElementById("aparece10").style.display = "inline";
  }
else
  {
     document.getElementById("aparece4").style.display = "none";
	 document.getElementById("cal-field-2_des").style.display = "none";
	  document.getElementById("cal-button-2_des").style.display = "none";
	  document.getElementById("aparece6").style.display = "none";
	   document.getElementById("aparece7").style.display = "none";
	    document.getElementById("aparece8").style.display = "none";
		 document.getElementById("aparece9").style.display = "none";
		  document.getElementById("aparece10").style.display = "none";
	 }
	 
  }
    function activar5(elemento)
{

if(elemento.juridica.options[elemento.juridica.selectedIndex].text=="SI")
  {
    document.getElementById("aparece11").style.display = "inline";
	 document.getElementById("aparece12").style.display = "inline";
	  document.getElementById("aparece13").style.display = "inline";
	   document.getElementById("aparece14").style.display = "inline";
  }
else
  {
     document.getElementById("aparece11").style.display = "none";
	 document.getElementById("aparece12").style.display = "none";
	 document.getElementById("aparece13").style.display = "none";
	 document.getElementById("aparece14").style.display = "none";
	 }
  } 

function activar6(elemento)
{

if(elemento.libreta.options[elemento.libreta.selectedIndex].text=="PRIMERA" ||
elemento.libreta.options[elemento.libreta.selectedIndex].text=="SEGUNDA" )
  {
    	
    document.getElementById("aparece15").style.display = "inline";
	 document.getElementById("aparece16").style.display = "inline";
	 

  }
else
  {
     document.getElementById("aparece15").style.display = "none";
	 document.getElementById("aparece16").style.display = "none";
	  
	 }
	 
  }
</script>
<SCRIPT LANGUAGE="JavaScript">

function registrar(frm){
var s = "no";



	if(esVacio(frm.fecha.value)){	
			alert("Debe ingresar la fecha.");
			frm.fecha.focus();	
	}else if(esVacio(frm.codigo.value)){	
		alert("Debe ingresar el radicado del caso.");
		frm.codigo.focus();			
	}else if(!esNumero(frm.codigo.value)){	
		alert("El radicado debe ser Numerico.");
		frm.codigo.focus();		
	}else if(esVacio(frm.nombre.value)){	
		alert("Debe ingresar el Nombre.");
		frm.nombre.focus();
	}else if(esVacio(frm.apellido.value)){	
		alert("Debe ingresar el Apellido.");
		frm.apellido.focus();	
	}else if(esVacio(frm.sexo.value)){	
		alert("Debe seleccionar el Sexo.");
		frm.sexo.focus();
	}else if(esVacio(frm.edad.value)){	
		alert("Debe ingresar la Edad.");
		frm.edad.focus();
	}else if(!esNumero(frm.edad.value)){	
		alert("La Edad debe ser Numerico.");
		frm.edad.focus();				
	}else if(esVacio(frm.rango.value)){	
		alert("Debe seleccionar el rango de edad.");
		frm.rango.focus();	
	}else if(esVacio(frm.tipodocumento.value)){	
		alert("Debe seleccionar el Tipo de Documento.");
		frm.tipodocumento.focus();		
	}else if(esVacio(frm.documento.value)){	
		alert("Debe ingresar el Documento de Identidad.");
		frm.documento.focus();		
	}else if(!esNumero(frm.documento.value)){	
		alert("El Documento de Identidad debe ser Numerico.");
		frm.documento.focus();		
	/*}else if(esVacio(frm.lugarexpedicion.value)){	
		alert("Debe ingresar el Lugar de Expedicion del Documento.");
		frm.lugarexpedicion.focus();	*/
	}else if(esVacio(frm.nacionalidad.value)){	
		alert("Debe ingresar la nacionalidad.");
		frm.nacionalidad.focus();		
	}else if(esVacio(frm.libreta.value)){	
		alert("Debe seleccionar si posee libreta militar.");
		frm.libreta.focus();
	}else if(((frm.libreta.value=="SEGUNDA") || (frm.libreta.value=="PRIMERA"))  &&  (esVacio(frm.numeroli.value))){	
		alert("Debe ingresar el numero de la libreta.");
		frm.numeroli.focus();			
	}else if((!esVacio(frm.numeroli.value)) &&  (!esNumero(frm.numeroli.value))){	
		alert("El Numero de la Libreta debe ser numerico.");
		frm.numeroli.focus();	
	}else if((!esVacio(frm.numeroli.value)) &&  (esVacio(frm.dismil.value))){	
		alert("Debe ingresar el Distrito Militar.");
		frm.dismil.focus();		
	}else if(esVacio(frm.direccion.value)){	
		alert("Debe ingresar la Direccion de Residencia.");
		frm.direccion.focus();	
	}else if(esVacio(frm.municipio.value)){	
		alert("Debe seleccionar un municipio.");
		frm.municipio.focus();
	}else if(esVacio(frm.embarazada.value)){	
		alert("Debe seleccionar si esta embarazada o no.");
		frm.embarazada.focus();	
	}else if((!esVacio(frm.telefono.value))  &&  (!esNumero(frm.telefono.value))){	
		alert("El telefono debe ser tipo numerico.");
		frm.telefono.focus();	
	}else if((!esVacio(frm.email.value)) && (frm.email.value!='No POSEE') && (!validarEmail(frm.email.value))){			
		alert("El email no es valido.");
		frm.email.focus();			
	}else if(esVacio(frm.sisben.value)){	
		alert("Debe seleccionar si posee sisben.");
		frm.sisben.focus();	
	}else if(esVacio(frm.numerosisben.value)){	
		alert("Debe seleccionar si posee nivel del sisben.");
		frm.numerosisben.focus();				
	}else if(esVacio(frm.discapacidad.value)){	
		alert("Debe seleccionar si posee discapacidad.");
		frm.discapacidad.focus();	
	}else if((frm.discapacidad.value=="SI") && (esVacio(frm.tipodis.value)) ){	
		alert("Debe ingresar el tipo de discapacidad ya que seleciono SI.");
		frm.tipodis.focus();	
	}else if(esVacio(frm.grupoet.value)){	
		alert("Debe seleccionar si pertenece algun grupo etnico.");
		frm.grupoet.focus();
	}else if((frm.grupoet.value=="SI") && (esVacio(frm.etnico.value)) ){	
		alert("Debe ingresar cual grupo etnico pertenece ya que seleciono SI.");
		frm.etnico.focus();
	}else if(esVacio(frm.nivelesco.value)){	
		alert("Debe seleccionar si posee escolaridad.");
		frm.nivelesco.focus();
	}else if((frm.nivelesco.value=="OTRO") && (esVacio(frm.otro.value)) ){	
		alert("Debe ingresar el tipo de estudio ya que eligio Otro.");
		frm.otro.focus();						
	}else if(esVacio(frm.tipofamil.value)){	
		alert("Debe seleccionar el Tipo de Familia.");
		frm.tipofamil.focus();		
	}else if(esVacio(frm.estado.value)){	
		alert("Debe seleccionar el estado civil.");
		frm.estado.focus();						
	}else if(esVacio(frm.allegado.value)){	
		alert("Debe ingresar un Allegado.");
		frm.allegado.focus();	
	}else if((!esVacio(frm.telefonofijo.value))  &&  (!esNumero(frm.telefonofijo.value))){	
		alert("El Telefono Fijo debe ser tipo numerico.");
		frm.telefonofijo.focus();				
	}else if(esVacio(frm.direccionalle.value)){	
		alert("Debe ingresar la Direccion del allegado.");
		frm.direccionalle.focus();			
	}else if((!esVacio(frm.telefonocel.value))  &&  (!esNumero(frm.telefonocel.value))){	
		alert("El Numero de Celular debe ser tipo numerico.");
		frm.telefonocel.focus();	
	}else if(esVacio(frm.autoridad.value)){	
		alert("Debe ingresar el manejo de autoridad.");
		frm.autoridad.focus();
	}else if(esVacio(frm.sanciona.value)){	
		alert("Debe ingresar la persona que sanciona.");
		frm.sanciona.focus();
	}else if(esVacio(frm.aporte.value)){	
		alert("Debe ingresar el aporte economico.");
		frm.aporte.focus();	
	}else if(!esNumero(frm.aporte.value)){	
		alert("El aporte solo debe ser numerico, no lleva simbolos ni palabras.");
		frm.aporte.focus();	
	}else if(esVacio(frm.conflictos.value)){	
		alert("Debe seleccionar el conflicto.");
		frm.conflictos.focus();		
	}else if(esVacio(frm.factor.value)){	
		alert("Debe seleccionar el factor que ocasiona el conflicto.");
		frm.factor.focus();	
	}else if(esVacio(frm.autor.value)){	
		alert("Debe seleccionar el autor del conflicto.");
		frm.autor.focus();	
	}else if(esVacio(frm.vivienda.value)){	
		alert("Debe seleccionar el tipo de vivienda.");
		frm.vivienda.focus();	
	}else if(esVacio(frm.tenencia.value)){	
		alert("Debe seleccionar la tenencia.");
		frm.tenencia.focus();		
	}else if(esVacio(frm.ocupacion.value)){	
		alert("Debe ingresar la ocupacion.");
		frm.ocupacion.focus();	
	}else if(esVacio(frm.labora.value)){	
		alert("Debe seleccionar la si labora.");
		frm.labora.focus();		
	}else if((!esVacio(frm.salario.value)) &&  (!esNumero(frm.salario.value))){	 
		alert("El valor de este campo debe ser tipo numerico.");
		frm.salario.focus();		
	}else if(esVacio(frm.tipotra.value)){	
		alert("Debe seleccionar el tipo de trabajo.");
		frm.tipotra.focus();
	}else if(esVacio(frm.desplazado.value)){	
		alert("Debe seleccionar si es desplazado.");
		frm.desplazado.focus();
	}else if(esVacio(frm.juridica.value)){	
		alert("Debe seleccionar si ha iniciado acciones juridicas.");
		frm.juridica.focus();
	}else if(esVacio(frm.exposicion.value)){	
		alert("Debe ingresar la exposicion de motivos.");
		frm.exposicion.focus();			
	}else if(!chequearOpcion()) {	
		alert("Debe seleccionar el area de consulta");
		frm.area.focus();
	}else if(esVacio(frm.recibido.value)){	
		alert("Debe seleccionar si fue recibido.");
		frm.recibido.focus();
	}else if(esVacio(frm.abogado.value)){	
		alert("Debe ingresar el nombre del abogado en formacion.");
		frm.abogado.focus();	
	}else if(esVacio(frm.apeabog.value)){	
		alert("Debe ingresar el apellido del abogado en formacion.");
		frm.apeabog.focus();	
	}else if(esVacio(frm.docu.value)){	
		alert("Debe ingresar el documento del abogado en formacion.");
		frm.docu.focus();	
	}else if(!esNumero(frm.docu.value)){	
		alert("El valor de este campo debe ser tipo numerico.");
		frm.docu.focus();	
	}else if(esVacio(frm.abogado3.value)){	
		alert("Debe ingresar el nombre del abogado en formacion.");
		frm.abogado2.focus();	
	}else if(esVacio(frm.apeabog3.value)){	
		alert("Debe ingresar el apellido del abogado en formacion.");
		frm.apeabog3.focus();	
	}else if(esVacio(frm.docu3.value)){	
		alert("Debe ingresar el documento del abogado en formacion.");
		frm.docu3.focus();	
	}else if(!esNumero(frm.docu3.value)){	
		alert("El valor de este campo debe ser tipo numerico.");
		frm.docu3.focus();		
	}else if(confirm ("¿Está seguro de crear el registro?")){
      frm.action = "casos_agre_Msg.jsp";
      frm.submit();
	}
}
</SCRIPT>
    
	<style type="text/css">
       
        #main { width:650px; }
        #header { text-align:center; border-bottom:solid 1px #b2b3b5; margin: 0 0 20px 0; }
        fieldset { border:none; width:320px;}
        
		legend { font-size:18px; margin:0px; padding:10px 0px; color: #003366; font-weight:bold;}
		
        label { display:block; margin:15px 0 5px;}
        
        .prev, .next { background-color: #005AAB; 
		border: 0 none; 
		color: #FFFFFF;
		cursor: pointer; 
		font-family: arial,helvetica,sans-serif; 
		font-size: 11px; 
		font-weight: bold; 
		height: 20px;  
		padding-bottom: 3px;
		 margin-right: 2px;
		
		}
        .prev:hover, .next:hover { background-color: #999; text-decoration:none; }
        .prev { float:left;}
        .next { float:right;}
        #steps { list-style:none; width:700px; overflow:hidden; margin:0px; padding:0px;}
        #steps li {font-size:24px; float:left; padding:10px; color:#003366;}
        #steps li span {font-size:11px; display:block;}
        #steps li.current { color:#000;}
        #makeWizard {  color:#fff; padding:5px 10px; text-decoration:none; font-size:18px;}
        #makeWizard:hover { background-color:#000;}
		.text_blanco2 {
    color: #FFFFFF;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 11px;
    font-style: normal;
    font-variant: normal;
    font-weight: bold;
}
    </style>
   
<style type="text/css"> @import url("css/calendar-win2k-cold-1.css"); </style>
    <script type="text/javascript" src="Scripts/formToWizard.js"></script>
    <script language="JavaScript" src="jScripts/calendario.js"></script>
<script type="text/javascript" src="jScripts/calendar.js"></script>
<script type="text/javascript" src="jScripts/calendar-setup.js"></script>
<script type="text/javascript" src="jScripts/calendar-es.js"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css"/>
<script src="jquery/jquery.validationEngine-es.js" type="text/javascript" charset="utf-8"></script>
<script src="jquery/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
   $(document).ready(function(){
          $("#SignupForm").formToWizard({ submitButton: 'SaveAccount' })
     });
</script>
<script>

		jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#SignupForm").validationEngine();
		});

		/**
		*
		* @param {jqObject} the field where the validation applies
		* @param {Array[String]} validation rules for this field
		* @param {int} rule index
		* @param {Map} form options
		* @return an error string if validation failed
		*/
		function checkHELLO(field, rules, i, options){
			if (field.val() != "HELLO") {
				// this allows to use i18 for the error msgs
				return options.allrules.validate2fields.alertText;
			}
		}
	</script>
     <script language="javascript" type="text/javascript">

	function BuscarClave(frm)
	{
		xpos=(screen.width/2)-200; 
		ypos=(screen.height/2)-215; 		
		window.open('carries_forms/estudiante.jsp?periodo=<%=periodo%>&area=PUBLICA','popup','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=350, left='+ xpos+', top='+ ypos);
	}

</script>

    <div id="main">
    
      <form id="SignupForm" name="form1" method="post" class="formular">
      <input name="periodo" value="<%=periodo%>"  type="hidden"  id="periodo"/><div align="right" style="width:650; float:right; margin-top:14px">
 <input name="" type="button" class="botones" value=" Volver a la Lista" onclick="javascript:volver(document.forms['form1']);"></div>
        <fieldset>
          <legend>Informaci&oacute;n Personal</legend> 
            <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">

                            <tr class="fondo_celda_1">
                              <td  rowspan="2" align="center" class="text_blanco"><span>FORMATO N&deg; 02 </span></span></td>
                              <td align="center" class="text_blanco"><span>FECHA: &nbsp;&nbsp;</span></td>
                              <td  rowspan="2" align="center" class="text_blanco"><span>HORA: 
							  <input type="text" name="reloj" size="10" class="text_file" id="reloj">  
							  </span></td>
                              <td  rowspan="2"  align="center" class="text_blanco"><span>RADICADO No. 
                                <%
						  ResultSet  rs_contar=null;						  
						  String consulta_contar = "select count(perradicado) as radicados from personacaso";
						  rs_contar = con.consultar(consulta_contar);
						  rs_contar.next();		
						  String numero_radi=rs_contar.getString("radicados");
						  int contar_radi=Integer.parseInt(numero_radi);
						  int contar=1;							
						
							 if(contar_radi!=0){				
							  
								  ResultSet  rs=null;
								  String consulta = "select max(perradicado) as radicado from personacaso";	
								  rs = con.consultar(consulta);
								  rs.next();							
								  String numero=rs.getString("radicado");
								  contar=Integer.parseInt(numero)+1;
		   				  %>
					             &nbsp;&nbsp;<input name="codigo" type="text"  class="validate[required,custom[integer]] text_file" onFocus="javascript:prender();" onBlur="javascript:apagar();" value="<%=contar%>"   size="5" id="codigo">
                             <%}else{%>
                                 &nbsp;&nbsp;<input name="codigo" type="text"  class="validate[required,custom[integer]] text_file" onFocus="javascript:prender();" onBlur="javascript:apagar();" value="<%=contar%>"   size="5" id="codigo">
                             <%}%>
                             
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td  align="center" class="text_blanco2"><span>
                              <input  name="fecha" type="text" id="cal-field-2"  size="10" maxlength="10" class="text_file" onfocus="this.blur()" />
                              <img src="img/calendario.gif" width="15" height="16" hspace="5" align="absmiddle" border="0" id="cal-button-2" /></span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td width="138"  height="20"  align="center" class="text_negro" > Nombre </td>
                              <td width="130" height="20"  align="center" class="text_negro" >Apellido</td>
                              <td width="175"   align="center" class="text_negro" >Sexo</td>
                              <td width="157" height="20"  align="center" class="text_negro" >Edad</td>
                            </tr>
                            
                            <tr class="fondo_celda_5">
                              <td height="20"  align="center"><input name="nombre" type="text"  onFocus="javascript:prender();" onBlur="javascript:apagar();"  id="nombre" class="validate[required] text_file" size="20"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></td>
                              <td height="20"  align="center"><input name="apellido" type="text" class="validate[required] text_file" onFocus="javascript:prender();" id="apellido" onBlur="javascript:apagar();"  size="20" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></td>
                              <td height="20"  align="center"><span class="text_negro">
                                <select name="sexo"  class="validate[required] combos" id="sexo" onChange="agregarOpciones2(this.form)" >
                                  <option value="">Seleccione...</option>
                                  <option value="FEMENINO">Femenino</option>
                                  <option value="MASCULINO">Masculino</option>
                                </select>
                              </span></td>
                              <td height="20"   align="center" class="text_negro"><input  name="edad" type="text"  class="validate[required,custom[integer]] text_file"  size="2"  id="edad"/>
a&ntilde;os 
                                &nbsp;&nbsp;&nbsp;
                                <select name="rango"  class="validate[required] combos"  id="rango">
                                  <option value="">Seleccione...</option>
                                  <option value="0 - 14 anos">0 - 14 a&ntilde;os</option>
                                  <option value="14 - 18 anos">14 - 18 a&ntilde;os</option>
                                  <option value="18 - 25 anos">18 - 25 a&ntilde;os</option>
                                  <option value="25 - 35 anos">25 - 35 a&ntilde;os</option>
                                  <option value="35 - 50 anos">35 - 50 a&ntilde;os</option>
                                  <option value="mayor 50 anos">mayor 50 a&ntilde;os</option>
                                </select></td>
                            </tr>  
                            <tr class="fondo_celda_2">
                              
                              <td height="20" align="center"class="text_negro">Documento de Identificacion </td>
                              <td height="20" align="center"class="text_negro">Numero de Documento </td>
                              <td  align="center"class="text_negro">Lugar de Expedicion </td>
                              <td height="20"  align="center"class="text_negro">Nacionalidad</td>
                            </tr>
                            
                            <tr class="fondo_celda_5">
                              
                              <td height="20" align="center" class="text_negro"><select name="tipodocumento"  class="validate[required] combos">
                                <option value="">Seleccione...</option>
                                <option value="CC">CC</option>
                                <option value="TI">TI</option>
                                <option value="CE">CE</option>
                                <option value="NIT">NIT</option>
                                <option value="RUT">RUT</option>
                                <option value="PASAPORTE">Pasaporte</option>
                              </select></td>
                              <td height="20" align="center" class="text_negro"><input type="text" name="documento"  size="20"  class="validate[required,custom[integer]] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"/></td>
                              <td height="20" align="center" class="text_negro"><input type="text"  name="lugarexpedicion"  size="20" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="20" align="center" class="text_negro"><select name="nacionalidad"  class="validate[required] combos" >
                               
                                <option value="COLOMBIANA">COLOMBIANA</option>
                                <option value="VENEZOLANA">VENEZOLANA</option>
                                <option value="OTRO">OTRO</option>
                              </select></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Libreta Militar </td>
                              <td height="20" align="center" class="text_negro">N&ordf; de la Libreta Militar </td>
                              <td height="20" colspan="2" align="center" class="text_negro">Distrito Militar </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro">
							  <select name="libreta"  class="validate[required] combos" onChange="activar6(this.form)" >
                                
                                <option value="PRIMERA" >PRIMERA</option>
                                <option value="SEGUNDA" >SEGUNDA</option>
                                <option selected="selected" value="NO POSEE" >NO POSEE</option>
                              </select></td>
                              <td height="20" align="center" class="text_negro"><input type="text" name="numeroli"  size="20"  class="validate[required,custom[integer]] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"   id="aparece15" style="display:none"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text"  name="dismil"  size="30" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece16" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  align="center" colspan="2" class="text_negro">Direccion</td>
                              <td height="20" align="center" class="text_negro">Municipio</td>
                              <td height="20"  align="center" class="text_negro">Embarazada</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center"  colspan="2" class="text_negro"><input type="text" name="direccion"  size="40" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="0" align="center" class="text_negro" ><select name="municipio"  class="validate[required] combos" >
                                  <option value="">Seleccione...</option>
                                  <option value="CUCUTA">CUCUTA</option>
                                    <option value="ABREGO">ABREGO</option>
                                    <option value="ARBOLEDAS">ARBOLEDAS</option>

									 <option value="BOCHALEMA">BOCHALEMA</option>
									  <option value="BUCARASICA">BUCARASICA</option>
									   <option value="CACOTA">CACOTA</option>
									    <option value="CACHIRA">CACHIRA</option>
										 <option value="CHINACOTA">CHINACOTA</option>
										  <option value="CHITAGA">CHITAGA</option>
										   <option value="CONVENCION">CONVENCION</option>
										    <option value="CUCUTILLA">CUCUTILLA</option>
											 <option value="DURANIA">DURANIA</option>
											  <option value="EL CARMEN">EL CARMEN</option>
											   <option value="EL TARRA">EL TARRA</option>
											   <option value="EL ZULIA">EL ZULIA</option>
											   <option value="GRAMALOTE">GRAMALOTE</option>
											   <option value="HACARI">HACARI</option>
											   <option value="HERRAN">HERRAN</option>
											   <option value="LABATECA">LABATECA</option>
											   <option value="LA ESPERANZA">LA ESPERANZA</option>
									  <option value="LA PLAYA">LA PLAYA</option>
									    <option value="LOS PATIOS">LOS PATIOS</option>
										  <option value="LOURDES">LOURDES</option>
										    <option value="MUTISCUA">MUTISCUA</option>
											  <option value="OCA&Ntilde;A">OCA&Ntilde;A</option>
											    <option value="PAMPLONA">PAMPLONA</option>
												  <option value="PAMPLONITA">PAMPLONITA</option>
												    <option value="PUERTO SANTANDER">PUERTO SANTANDER</option>
													  <option value="RAGONVALIA">RAGONVALIA</option>
													    <option value="SALAZAR">SALAZAR</option>
														  <option value="SAN CALIXTO">SAN CALIXTO</option>
														    <option value="SAN CAYETANO">SAN CAYETANO</option>
															  <option value="SANTIAGO">SANTIAGO</option>
															    <option value="SARDINATA">SARDINATA</option>
																  <option value="SILOS">SILOS</option>
																    <option value="TEORAMA">TEORAMA</option>
																	  <option value="TIBU">TIBU</option>
																	    <option value="TOLEDO">TOLEDO</option>
																		  <option value="VILLACARO">VILLACARO</option>
																		    <option value="VILLA DEL ROSARIO">VILLA DEL ROSARIO</option>
																			  <option value="SAN ANTONIO DEL TACHIRA">SAN ANTONIO DEL TACHIRA</option>
                              </select></td>
                              <td height="0"  align="center" class="text_negro" ><span class=" text_negro"><select name="embarazada" class="combos">
                                <option value="">Seleccione...</option>
                              </select>
                              
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  align="center" class="text_negro">Telefono: Fijo y Celular </td>
                              <td height="20" align="center"  colspan="1" class="text_negro">Correo Electronico </td>
                              <td height="20" align="center"  colspan="2" class="text_negro">Sisben</td>
                            </tr>
                            <tr class="fondo_celda_5" >
                              <td height="20" align="center" class="text_negro"><input type="text" name="telefono"  class="validate[required,custom[integer]] text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" /></td>
                              <td height="20" align="center"  colspan="1"class="text_negro"><input type="text" name="email"  size="20"  class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" value="No POSEE"/></td>
                              <td height="20" align="center" class="text_negro">

<select name="sisben" onChange="agregarOpciones(this.form)" class="validate[required] combos">
<option value="">Seleccione...</option>
<option value="SI">SI</option>
<option value="NO"  selected="selected">NO</option>
</select></td>
                              <td height="20"  colspan="2"align="center" class="text_negro" >Numero:   &nbsp;&nbsp;&nbsp;<select name="numerosisben" class="combos">
                               <option value="NO"  selected="selected">NO</option>
                              </select>
                        
                       </td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" colspan="4" class="text_negro">Discapacidad</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20"  align="center" class="text_negro"><span class=" text_negro">
                                <select name="discapacidad"  class="validate[required] combos" onChange="activar(this.form)">
                                  
                                  <option value="SI">SI</option>
                                  <option value="NO" selected="selected">NO</option>
                                </select>
                              </span></td>
                              <td height="20"  colspan="3" align="center" class="text_negro">Tipo de Discapacidad: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input name="tipodis" type="text" class="validate[required] text_file"   size="50" maxlength="40" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" id="aparece" style="display:none"></td>
                            </tr>
                            <tr class="fondo_celda_2"  >
                              <td height="20"  align="center"  colspan="4" class="text_negro">Grupo Etnico o Afrodescendiente </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><span class=" text_negro">
                                <select name="grupoet" class="validate[required] combos"  onChange="activar2(this.form)">
                                  <option value="SI">SI</option>
                                  <option value="NO" selected="selected">NO</option>
                                </select>
                              </span></td>
                              <td height="20"  colspan="3" align="center" class=" text_negro"><span class="text_negro">
                                &iquest;Cual?: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="etnico"  size="50" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece2" style="display:none"/>
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  align="center"  colspan="4" class="text_negro">Nivel de Escolaridad</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center"  class="text_negro"><select name="nivelesco"  class="validate[required] combos"  onChange="activar3(this.form)">
                            
                                <option value="PRIMARIA">PRIMARIA</option>
                                <option value="SECUNDARIA">SECUNDARIA</option>
                                <option value="TECNICO">TECNIO</option>
                                <option value="TECNOLOGO">TECNOLOGO</option>
                                <option value="UNIVERSIDAD">UNIVERSIDAD</option>
                                <option value="OTRO">OTRO</option>
                                <option value="NO POSEE" selected="selected">NO POSEE</option>
                              </select></td>
                              <td height="20" align="center"  colspan="4" class="text_negro">Otro: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="text" name="otro"  size="50" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece3" style="display:none"/></td>
  </tr>
  
</table>
        </fieldset>
        <fieldset>
         <legend>Informaci&oacute;n Familiar y <br/> Resoluci&oacute;n de Conflictos</legend>
           <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
  <tr class="fondo_celda_2">
<td height="20" align="center" class="text_negro">Tipo de Familia </td>
                              <td height="20" align="center" class="text_negro">Modo de Familia </td>
                              <td height="20" colspan="2" align="center" class="text_negro">N&ordm; de Personas del Nucleo Familiar </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><select name="tipofamil" id="select" class="validate[required] combos">
                                  <option value="EXTENSA">EXTENSA</option>
                                <option value="NUCLEAR">NUCLEAR</option>
                                <option value="MONOPARENTAL">MONOPARENTAL</option>
								<option value="NO POSEE" selected="selected">NO POSEE</option>
                                </option>
                              </select></td>
                              <td height="20" align="center" class="text_negro"><input type="text" name="modofamil"  size="20" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text"  name="personasgrupo"  size="10" class="validate[required,custom[integer]] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Estado Civil </td>
                              <td height="20" colspan="3" align="center" class="text_negro">Nombre del
                                
                              o la Conyuge o del o la Compa&ntilde;ero(a) Permanente </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><select name="estado" id="select6" class="validate[required] combos">
                                  <option value="">Seleccione...</option>
                                  <option value="CASADO">CASADO</option>
                                <option value="SOLTERO">SOLTERO</option>
                                <option value="DIVORCIADO">DIVORCIADO</option>
                                <option value="UNION LIBRE">UNION LIBRE</option>
                                <option value="VIUDO">VIUDO</option>
                                                      </select></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><input type="text" name="conyuge"  size="45" class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Nombre de Familiar Allegado </td>
                              <td height="20" colspan="2" align="center" class="text_negro">N&deg; Telefono Fijo </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="allegado"  size="45" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="telefonofijo"  size="20" class="validate[custom[integer]] text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Direccion</td>
                              <td height="20" colspan="2" align="center" class="text_negro">Telefono Celular </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="direccionalle"  size="45" class="validate[required] text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="telefonocel"  size="20" class="validate[custom[integer]] text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"/></td>
  </tr>

</table>          
        
            <legend>Resoluci&oacute;n de Conflictos</legend>
          <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
                <tr class="fondo_celda_2">
                  <td height="20" align="center" class="text_negro">Manejo de Autoridad (Quien toma decisiones en el hogar)</td>
                  <td height="20" align="center" class="text_negro">Quien Sanciona</td>
                  <td height="20" colspan="2" align="center" class="text_negro">Aporte Economico a la Comunidad Familiar</td>
                </tr>
                <tr  class="fondo_celda_5">
                  <td height="20" align="center" class="text_negro"><input type="text" name="autoridad"  size="30" class="validate[required] text_file"  onchange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                  <td height="20" align="center" class="text_negro"><input type="text" name="sanciona"  size="30" class="validate[required] text_file"  onchange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                  <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="aporte"  size="20" class="validate[required,custom[integer]] text_file" /></td>
                </tr>
                <tr class="fondo_celda_2">
                  <td height="20" align="center" class="text_negro">Frecuencia con que se presentan los conflictos en el hogar</td>
                  <td height="20" align="center" class="text_negro">Factor que ocasiona el conflicto</td>
                  <td height="20" colspan="2" align="center" class="text_negro">Autores del Conflicto</td>
                </tr>
                <tr class="fondo_celda_5">
                  <td height="20" align="center" class="text_negro"><select name="conflictos" class="validate[required] combos"   id="select7"  >
                    <option value="DIARIO">DIARIO</option>
                    <option value="SEMANAL">SEMANAL</option>
                    <option value="OCASIONAL">OCASIONAL</option>
                    <option value="MENSUAL">MENSUAL</option>
                    <option value="BIMENSUAL">BIMENSUAL</option>
                    <option value="TRIMESTRAL">TRIMESTRAL</option>
                    <option value="SEMESTRAL">SEMESTRAL</option>
                    <option value="ANUAL">ANUAL</option>
                    <option value="NUNCA" selected="selected">NUNCA</option>
                  </select></td>
                  <td height="20" align="center" class="text_negro"><select name="factor"  id="select7"  class="validate[required] combos" >
                    <option value="ECONOMICO">ECONOMICO</option>
                    <option value="ESCOLAR">ESCOLAR</option>
                    <option value="MANEJO DE ROL">MANEJO DE ROL</option>
                    <option value="MANEJO DE AUTORIDAD">MANEJO DE AUTORIDAD</option>
                    <option value="NINGUNO" selected="selected">NINGUNO</option>
                  </select></td>
                  <td height="20" colspan="2" align="center" class="text_negro"><select name="autor"  id="select11" class="validate[required] combos" >
                    <option value="PADRE-MADRE">PADRE-MADRE</option>
                    <option value="PADRE-HIJOS">PADRE-HIJOS</option>
                    <option value="HERMANOS">HERMANOS</option>
                    <option value="OTROS">OTROS</option>
                    <option value="NINGUNO" selected="selected">NINGUNO</option>
                  </select></td>
                </tr>
                <tr class="fondo_celda_2">
                  <td height="20" align="center" class="text_negro">Tipo de Vivienda</td>
                  <td height="20" align="center" class="text_negro">Tenencia</td>
                  <td height="20" colspan="2" align="center" class="text_negro">Servicios</td>
                </tr>
                <tr  class="fondo_celda_5">
                  <td height="20" align="center" class="text_negro"><select name="vivienda"  class="validate[required] combos" >
                    <option value="CASA">CASA</option>
                    <option value="CASA LOTE">CASA LOTE</option>
                    <option value="APTO">APTO</option>
                    <option value="HABITACION">HABITACION</option>
                    <option value="RANCHO">RANCHO</option>
                    <option value="HOTEL">HOTEL</option>
                    <option value="NINGUNO" selected="selected">NINGUNO</option>
                  </select></td>
                  <td height="20" align="center" class="text_negro"><select name="tenencia"  class="validate[required] combos" >
                    <option value="PROPIA">PROPIA</option>
                    <option value="ARRENDADA">ARRENDADA</option>
                    <option value="AMORTIZADA">AMORTIZADA</option>
                    <option value="INQUILINATO">INQUILINATO</option>
                    <option value="INVASION">INVASION</option>
                    <option value="SUCESION">SUCESION</option>
                    <option value="HIPOTECA">HIPOTECA</option>
                    <option value="OTRO">OTRO</option>
                    <option value="NINGUNO" selected="selected">NINGUNO</option>
                  </select></td>
                  <td height="20" colspan="2" align="center" class="text_negro">
                    
                     
                        <input type="checkbox"  name="agua" value="Agua" id="servicios_0" />
                        Agua
                     <input type="checkbox"  name="alcantarillado" value="Alcantarillado" id="servicios_2" />
                        Alcantarillado
                 
                        <input type="checkbox"  name="alumbrado" value="Alumbrado Publico" id="servicios_3" />
                        Alumbrado Publico 
                   
                        <input type="checkbox"  name="luz" value="Luz" id="servicios_1" />
                        Luz
                    
                        <input type="checkbox"  name="telefonos" value="Telefono" id="servicios_4" />
                        Telefono
                    
                    <input type="checkbox" name="aseo" value="Recoleccion de Aseo" id="servicios_5" />
                        Recolecci&oacute;n de Aseo 
                   </td>
                </tr>
              </table>
          </table>
        </fieldset>   
        <fieldset>        
        <legend>Informaci&oacute;n Laboral</legend>
        <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
  <tr class="fondo_celda_2">
   <td height="20" colspan="4" align="center" class="text_negro">Ocupacion</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><input type="text" name="ocupacion"  size="40" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"  value="NO POSEE" /></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Actualmente se encuentra laborando</td>
                              <td height="20" align="center" class="text_negro">Salario Devengado $ </td>
                              <td height="20" colspan="2" align="center" class="text_negro">Tipo de Trabajo</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><select name="labora"  class="validate[required] combos">
                                   
                                  <option value="SI">SI</option>
                                <option value="NO" selected="selected">NO</option>                                
                              </select></td>
                              <td height="20" align="center" class="text_negro"><input type="text"  name="salario"  size="10" class="validate[required,custom[integer]] text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" value="000"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><select name="tipotra"  class="combos" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
                                  <option value="INDEPENDIENTE">INDEPENDIENTE</option>
                                <option value="ASALARIADO">ASALARIADO</option>
                                 <option value="NO" selected="selected">NO</option>
                              </select></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Empresa donde presta el Servicio</td>
                              <td height="20" colspan="2" align="center" class="text_negro">Clase de Contrato</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="empresa"  size="30" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"/></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><select name="clase"  class="combos" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
                                <option value="A TERMINO FIJO">A TERMINIO FIJO</option>
                                <option value="INDEFINIDO">INDEFINIDO</option>
                                <option value="PRESTACION DE SERVICIOS">PRESTACION DE SERVICIOS</option>
                                <option value="NO POSEE" selected="selected">NO POSEE</option>
                                <option value="OTRO">OTRO</option>
                              </select></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Se encuentra Afiliado a la Seguridad Social</td>
                              <td height="20" colspan="2" align="center" class="text_negro">Ocupacion de Conyuge o Compa&ntilde;ero(a)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro">
                                <input type="checkbox"  name="salud" value="Salud" id="servicios_6">
                                Salud
                               
                                  <input type="checkbox"  name="pension" value="Pension" id="servicios_7">
                                  Pension                        
                               
                                  <input  type="checkbox" name="arp" value="Arp" id="servicios_8">
                                ARP
                              
                                  <input type="checkbox"  name="otrosalud" value="Otro" id="servicios_919">
                                  Otro                     
                              <br></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><input type="text" name="ocupaconyu"  size="30" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="NO POSEE" /></td>
  </tr>

</table>
        </fieldset>
          <fieldset>        
        <legend>Historial de Atenci&oacute;n</legend>        
           <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
 
                            <tr class="fondo_celda_2">
                              <td width="321" height="20" align="center" class="text_negro">Se encuentra en situacion de Desplazamiento</td>
                              <td width="326" height="20" colspan="3" align="center" class="text_negro">Lugar de Desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><select name="desplazado"  class="validate[required] combos" onChange="activar4(this.form)">
                                
                                  <option value="SI">SI</option>
                                <option value="NO" selected="selected">NO</option>
                                </select>                              </td>
                              <td height="20" colspan="3" align="center" class="text_negro"><input type="text" name="lugardes"  size="40" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece4" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Fecha del Desplazamiento</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Motivo del Desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro">
                              <input  name="fechades" type="text"   size="10"  class="text_file"  id="cal-field-2_des" style="display:none"/>                             
                            <img src="img/calendario.gif" width="15" height="16" hspace="5" align="absmiddle" border="0" id="cal-button-2_des"  style="display:none"/>
                              
                              </td>
                              <td height="20" colspan="3" align="center" class="text_negro"><input type="text" name="motivo"  size="40" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece6" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Actor Armado que produce el desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><input type="text" name="armado"  size="40" class="text_file"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece7" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Grupo familiar con el que se desplaza</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><input type="text" name="grupo"  size="40" class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece8" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Se encuentra incluido dentro del RUPD</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><input type="text" name="rupd"  size="40" class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece9" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Relacion de Orientacion o asesorias de publica o privada recibidas</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><textarea name="relacion"  cols="60" rows="6" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece10" style="display:none"></textarea></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Ha iniciado acciones juridicas previas</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Cuales</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><select name="juridica"  class="validate[required] combos" onChange="activar5(this.form)">
                                <option value="SI">SI</option>
                                <option value="NO" selected="selected">NO</option>
                              </select></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><textarea name="cuales"  cols="30" rows="2" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece11" style="display:none"></textarea></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Modalidad de la Atencion</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><input type="text" name="modalidad"  size="40" class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece12" style="display:none"/></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Caso (Exposicion de la ruta de acceso al derecho)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><textarea name="caso"  cols="60" rows="6" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece13" style="display:none"></textarea></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="4" align="center" class="text_negro">Asesoria: (El derecho a proteger - Ruta de Acceso al Derecho)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="4" align="center" class="text_negro"><textarea name="asesoria"  cols="60" rows="6" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" id="aparece14" style="display:none"></textarea></td>
  </tr>

</table>
        </fieldset>
         <fieldset>
          <legend>Exposici&oacute;n de Motivos</legend> 
          <table width="650" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
 <tr class="fondo_celda_2">
  <td height="20" colspan="3" align="center" class="text_negro">BREVE EXPOSICION DE LA CONSULTA </td>
 </tr>
 
  <tr class="fondo_celda_5">
 <td height="20"  align="center"  colspan="3" class="text_negro"><textarea name="exposicion"  cols="60" rows="6" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" class="validate[required]"></textarea></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"   colspan="3" align="center"  class="text_negro">AREA DE CONSULTA </td>
                            </tr>
                            <tr  class="fondo_celda_5">
                              <td height="20"   colspan="3" align="center" class="text_negro" >
							  
							       <% 	
									Conex con2 = new Conex();
									ResultSet  res = con2.consultar("select nombrearea from area ");	
									int cont = con2.contar(res);
									String[][] opera = new String[cont][2];
									res.beforeFirst();
									if(cont!=0){ 
									res.next();
										for(int i=0;i<cont;i++)
										{
											opera[i][0]=res.getString("nombrearea");
											res.next();%>
							       
                                
								   <input type="radio" name="area" value="<%=opera[i][0]%>">&nbsp;&nbsp;<%=opera[i][0]%>&nbsp;&nbsp;&nbsp;
							           <%}}%>
						             
</p>						      </td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  colspan="3" align="center" class="text_negro">OBERVACIONES</td>
                            </tr>
                            <tr  class="fondo_celda_5">
                              <td height="20"   colspan="3" align="center" class="text_negro"><textarea name="observaciones" cols="60" rows="4" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></textarea></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  colspan="2" align="center" class="text_negro">RELACION DE DOCUMENTOS RECIBIDOS (fotocopias) </td>
                              <td height="20" align="center" class="text_negro">RECIBIDO</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20"  colspan="2" align="center" class="text_blanco"><span class="text_negro">
                                <textarea name="docucopias"  cols="50" rows="4" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></textarea>
                              </span></td>
                              <td height="20"  align="center" class="text_blanco"><select name="recibido"  class="validate[required] combos" >
                                  <option value="SI" selected="selected">SI</option>
                                <option value="NO">NO</option>
                              </select></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="25"  colspan="3" align="center" class="text_negro">ABOGADO EN FORMACION QUE RECEPCIONA</td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"align="center" class="text_negro">Nombres</td>
                              <td align="center" class="text_negro">Apellidos</td>
                              <td height="20"  align="center" class="text_negro">Documento de Indentificacion </td>

                            </tr>
                            <tr  class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro">
                                <input type="text" name="abogado" size="20" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" class="validate[required]">
                             </td>
                              <td align="center" class="text_negro"><input type="text" name="apeabog" size="20" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" class="validate[required]"></td>
                              <td height="20"  align="center" class="text_negro"><input type="text" name="docu" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" class="validate[required,custom[integer]]"></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="23"  colspan="3" align="center" class="text_negro">ABOGADO EN FORMACION QUE SISTEMATIZA </td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"align="center" class="text_negro">Nombre</td>
                              <td align="center" class="text_negro">Apellido</td>
                              <td height="20"   align="center" class="text_negro">Documento de Identidad</td>
                            </tr>
                            <tr  class="fondo_celda_5">
                              <td height="20"align="center" class="text_negro"><input type="text" name="abogado3" size="20"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" class="validate[required]"></td>
                              <td align="center" class="text_negro"><input type="text" name="apeabog3" size="20"  onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" class="validate[required]"></td>
                              <td height="20"  align="center" class="text_negro"><input type="text" name="docu3" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" class="validate[required,custom[integer]]"></td>
  </tr>
                            
                         
                            

          </table>
    
          </fieldset>
        
        <div style="margin-left:576px; margin-top: -30px;">
        <input name=""  id="SaveAccount"  class="button"   type="button"  style="background-color: #005AAB; border: 0 none; color: #FFFFFF; cursor: pointer; font-family: arial,helvetica,sans-serif; 		font-size: 11px; font-weight: bold; height: 20px; padding-bottom: 3px; margin-right: 2px;" onClick="javascript:registrar(document.forms['form1']);" value="  Registrar  " >
           </div>
       
        </form>
    </div>
    <br/>
<script type="text/javascript">
            Calendar.setup({
              inputField: 	"cal-field-2",
			 
			  ifFormat: 	"%d/%m/%Y",
			  weekNumbers:	false,			  
			  button:		"cal-button-2"
			
            });
			Calendar.setup({
              inputField: 	"cal-field-2_des",
			  ifFormat: 	"%d/%m/%Y",
			  weekNumbers:	false,			  
			  button:		"cal-button-2_des"
            });
          </script>
 <%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>