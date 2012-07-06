<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}else{ 
	if(!rol.equals("Admin")){
		 response.sendRedirect("ilegal.jsp");
	}
}

try{
String periodo=String.valueOf(request.getParameter("periodo"));
int buscar;
int sexo;
String municipio;	
int nacionalidad;
int edades;int areas;
String auxx=String.valueOf(request.getParameter("buscar"));
String auxxsexo=String.valueOf(request.getParameter("sexo"));
String auxxmunicipio=String.valueOf(request.getParameter("municipio"));
String auxxnacionalidad=String.valueOf(request.getParameter("nacionalidad"));
String auxxedades=String.valueOf(request.getParameter("edades"));
String auxxareas=String.valueOf(request.getParameter("areas"));

if(auxx.equals("null") || auxx.equals("") ){ buscar=0;}
	else{ buscar=Integer.valueOf(auxx).intValue();}
	
if(auxxsexo.equals("null") || auxxsexo.equals("") ){ sexo=0;}
	else{ sexo=Integer.valueOf(auxxsexo).intValue();}

if(auxxnacionalidad.equals("null") || auxxnacionalidad.equals("")){ nacionalidad=0;}
		else{ nacionalidad=Integer.valueOf(auxxnacionalidad).intValue();}
	
if(auxxedades.equals("null") || auxxedades.equals("") ){ edades=0;}
		else{ edades=Integer.valueOf(auxxedades).intValue();}
		
if(auxxareas.equals("null") || auxxareas.equals("") ){ areas=0;}
		else{ areas=Integer.valueOf(auxxareas).intValue();}
	
if(auxxmunicipio.equals("null") || auxxmunicipio.equals("") ){ municipio="0";}
	else{ municipio=auxxmunicipio;}	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">

<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function ver(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Registro.");
	}else{
		frm.action="amd_Trata_ver.jsp";
		frm.submit();
		}
}
function cargarmun(frm){
		frm.action="buscar_todos.jsp";
		frm.submit();
}

function asignarzona(frm, per, bus, sex, mun, na, eda, ar){
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	

if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;

if(sex=="null")    frm.sexo.value="";
else          	    frm.sexo.value=sex;

if(mun=="null")    frm.municipio.value="";
else          	    frm.municipio.value=mun;

if(na=="null")    frm.nacionalidad.value="";
else          	    frm.nacionalidad.value=na;

if(eda=="null")    frm.edades.value="";
else          	    frm.edades.value=eda;

if(ar=="null")    frm.areas.value="";
else          	    frm.areas.value=ar;
}

function exportar(frm){

		frm.action="filtro_excel.jsp";
		frm.submit();
		
}

</script>

</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>','<% out.print(sexo);%>','<% out.print(municipio);%>','<% out.print(nacionalidad);%>','<% out.print(edades);%>','<% out.print(areas);%>');" >
<div id="content">

<table summary="Universidad de Pamplona" border="0" cellpadding="0" cellspacing="0" width="960" align="center">
			<tbody><tr> 
 <td > <jsp:include page="header.jsp" />

</td> 
</tr> 
 <tr> 
  <td><table border="0" cellpadding="0" cellspacing="0" width="100%" height="100px"> 
 <tbody><tr>  
 <td width="260" height="420" align="left" valign="top" bgcolor="#ffffff"> 
<jsp:include page="menu.jsp" />
 </td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 

 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1>Buscar Radicados  / Periodo:  <%=periodo%></h1>
  <p></p>
  <div id="texto_contenido">
 
<form name="form1" method="post">
  <div  >
  <table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="166">&nbsp;</td>
    <td width="257">&nbsp;</td>
    <td rowspan="4" align="right">
    <%if(buscar==6){	%>
    
    <img src="images/stickman_in_wheelchair_pc_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
     <%if(buscar==2){%>    
    <img src="images/woman_pregnant_at_doctors_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
      <%if(buscar==4){%>    
    <img src="images/romantic_walk_pc_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
     <%if(buscar==1){%>    
    <img src="images/canada_blue_map_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
     <%if(buscar==3){%>    
    <img src="images/stick_figure_family_portrait_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
      <%if(buscar==7){%>    
    <img src="images/green_flat_world_map_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
      <%if(buscar==5){%>    
    <img src="images/puzzle_piece_impression_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
    <%if(buscar==8){%>    
    <img src="images/group_stick_figures_standing_together_pc_sm_wm.jpg" width="103" height="81"  border="10px"/>
    <%}%>
    </td>
    </tr>
  <tr>
    <td>Filtrar Radicados Por:</td>
    <td>
      
      <select name="buscar" class="combos">
        <%switch(buscar){ 
	case 0:%>	
        <option value="">Seleccione...</option>
        <%
	break;
	case 1: %> 
        <option value="<%=buscar%>">Municipio</option>
        <% break;
    case 2: %>	
        <option value="<%=buscar%>">Embarazada</option>
        <% break;
    case 3: %>	
        <option value="<%=buscar%>">Desplazados</option>
        <% break;
    case 4: %>	
        <option value="<%=buscar%>">Sexo</option>
        <% break;
    case 5: %>
        <option value="<%=buscar%>">Edades</option>
        <% break;
    case 6: %>
        <option value="<%=buscar%>">Discapacitados</option>
        <% break;
    case 7: %>
        <option value="<%=buscar%>">Nacionalidad</option>
        <% break;
    case 8: %>
        <option value="<%=buscar%>">Grupo Etnico Afrodescendiente</option>
        <%break; 
	 case 9: %>
        <option value="<%=buscar%>">Areas</option>
        <%break; 
default:
}; %>
        <option value="9"  onClick="javascript:cargarmun(document.forms['form1']);">Areas</option>
        <option value="3"  onClick="javascript:cargarmun(document.forms['form1']);">Desplazados</option>
        <option value="6"  onClick="javascript:cargarmun(document.forms['form1']);">Discapacitados</option>
        <option value="2"  onClick="javascript:cargarmun(document.forms['form1']);">Embarazada</option>
        <option value="8" onClick="javascript:cargarmun(document.forms['form1']);">Grupo Etnico Afrodescendiente</option>
        <option value="7"  onClick="javascript:cargarmun(document.forms['form1']);">Nacionalidad</option>
        <option value="1"  onClick="javascript:cargarmun(document.forms['form1']);">Municipio</option>
        <option value="4"  onClick="javascript:cargarmun(document.forms['form1']);">Sexo</option>
        <option value="5"  onClick="javascript:cargarmun(document.forms['form1']);">Edades</option>
      </select></td>
    </tr>
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr><td >
  	  <%if(buscar==1){	%>
   		 Seleccione el Municipio:
     <%	}if(buscar==4){	%>
 			Seleccione el Sexo:
     <%	}if(buscar==5){	%>
 			Seleccione el Rango:
     <%	}if(buscar==7){	%>
     		 Seleccione la Nacionalidad:
     <%	}if(buscar==9){	%>
     		 Seleccione el Area:
     <%	}%> 
     </td>
    <td><%if(buscar==1){%>	
      <select name="municipio" class="combos">
        <%if(!municipio.equals("0")){%>		
        <option><%=municipio%></option>
        <%}else{%>		
        <option value="">Seleccione...</option>
        <%}%>
        <option value="CUCUTA" onClick="javascript:cargarmun(document.forms['form1']);">CUCUTA</option>
        <option value="ABREGO" onClick="javascript:cargarmun(document.forms['form1']);">ABREGO</option>
        <option value="ARBOLEDAS" onClick="javascript:cargarmun(document.forms['form1']);">ARBOLEDAS</option>
        <option value="BOCHALEMA" onClick="javascript:cargarmun(document.forms['form1']);">BOCHALEMA</option>
        <option value="BUCARASICA" onClick="javascript:cargarmun(document.forms['form1']);">BUCARASICA</option>
        <option value="CACOTA" onClick="javascript:cargarmun(document.forms['form1']);">CACOTA</option>
        <option value="CACHIRA" onClick="javascript:cargarmun(document.forms['form1']);">CACHIRA</option>
        <option value="CHINACOTA" onClick="javascript:cargarmun(document.forms['form1']);">CHINACOTA</option>
        <option value="CHITAGA" onClick="javascript:cargarmun(document.forms['form1']);">CHITAGA</option>
        <option value="CONVENCION" onClick="javascript:cargarmun(document.forms['form1']);">CONVENCION</option>
        <option value="CUCUTILLA" onClick="javascript:cargarmun(document.forms['form1']);">CUCUTILLA</option>
        <option value="DURANIA" onClick="javascript:cargarmun(document.forms['form1']);">DURANIA</option>
        <option value="EL CARMEN" onClick="javascript:cargarmun(document.forms['form1']);">EL CARMEN</option>
        <option value="EL TARRA" onClick="javascript:cargarmun(document.forms['form1']);">EL TARRA</option>
        <option value="EL ZULIA" onClick="javascript:cargarmun(document.forms['form1']);">EL ZULIA</option>
        <option value="GRAMALOTE" onClick="javascript:cargarmun(document.forms['form1']);">GRAMALOTE</option>
        <option value="HACARI" onClick="javascript:cargarmun(document.forms['form1']);">HACARI</option>
        <option value="HERRAN" onClick="javascript:cargarmun(document.forms['form1']);">HERRAN</option>
        <option value="LABATECA" onClick="javascript:cargarmun(document.forms['form1']);">LABATECA</option>
        <option value="LA ESPERANZA" onClick="javascript:cargarmun(document.forms['form1']);">LA ESPERANZA</option>
        <option value="LA PLAYA" onClick="javascript:cargarmun(document.forms['form1']);">LA PLAYA</option>
        <option value="LOS PATIOS" onClick="javascript:cargarmun(document.forms['form1']);">LOS PATIOS</option>
        <option value="LOURDES" onClick="javascript:cargarmun(document.forms['form1']);">LOURDES</option>
        <option value="MUTISCUA" onClick="javascript:cargarmun(document.forms['form1']);">MUTISCUA</option>
        <option value="OCAÑA" onClick="javascript:cargarmun(document.forms['form1']);">OCAÑA</option>
        <option value="PAMPLONA" onClick="javascript:cargarmun(document.forms['form1']);">PAMPLONA</option>
        <option value="PAMPLONITA" onClick="javascript:cargarmun(document.forms['form1']);">PAMPLONITA</option>
        <option value="PUERTO SANTANDER" onClick="javascript:cargarmun(document.forms['form1']);">PUERTO SANTANDER</option>
        <option value="RAGONVALIA" onClick="javascript:cargarmun(document.forms['form1']);">RAGONVALIA</option>
        <option value="SALAZAR" onClick="javascript:cargarmun(document.forms['form1']);">SALAZAR</option>
        <option value="SAN CALIXTO" onClick="javascript:cargarmun(document.forms['form1']);">SAN CALIXTO</option>
        <option value="SAN CAYETANO" onClick="javascript:cargarmun(document.forms['form1']);">SAN CAYETANO</option>
        <option value="SANTIAGO" onClick="javascript:cargarmun(document.forms['form1']);">SANTIAGO</option>
        <option value="SARDINATA" onClick="javascript:cargarmun(document.forms['form1']);">SARDINATA</option>
        <option value="SILOS" onClick="javascript:cargarmun(document.forms['form1']);">SILOS</option>
        <option value="TEORAMA" onClick="javascript:cargarmun(document.forms['form1']);">TEORAMA</option>
        <option value="TIBU" onClick="javascript:cargarmun(document.forms['form1']);">TIBU</option>
        <option value="TOLEDO" onClick="javascript:cargarmun(document.forms['form1']);">TOLEDO</option>
        <option value="VILLACARO" onClick="javascript:cargarmun(document.forms['form1']);">VILLACARO</option>
        <option value="VILLA DEL ROSARIO" onClick="javascript:cargarmun(document.forms['form1']);">VILLA DEL ROSARIO</option>
        <option value="SAN ANTONIO DEL TACHIRA" onClick="javascript:cargarmun(document.forms['form1']);">SAN ANTONIO DEL TACHIRA</option>
        </select>
      <%}if(buscar==4){	%>
      <select name="sexo" class="combos" >
        
        <%if(sexo==0){%>
        <option value="">Seleccione...</option>
        <%}if(sexo==1){%>
        <option value="<%=sexo%>">MASCULINO</option>
        <%}if(sexo==2){%>
        <option value="<%=sexo%>">FEMENINO</option>
        <%}%>
        <option value="1" onClick="javascript:cargarmun(document.forms['form1']);">MASCULINO</option>
        <option value="2" onClick="javascript:cargarmun(document.forms['form1']);">FEMENINO</option>         
        </select>
        <%}if(buscar==9){	%>
      <select name="areas" class="combos" >
        
        <%if(areas==0){%>
        <option value="">Seleccione...</option>
        <%}if(areas==1){%>
        <option value="<%=areas%>">LABORAL</option>
        <%}if(areas==2){%>
        <option value="<%=areas%>">PENAL</option>
        <%}if(areas==3){%>
        <option value="<%=areas%>">PRIVADA</option>
        <%}if(areas==4){%>
        <option value="<%=areas%>">PUBLICA</option>
        <%}%>
        <option value="1" onClick="javascript:cargarmun(document.forms['form1']);">LABORAL</option>
        <option value="2" onClick="javascript:cargarmun(document.forms['form1']);">PENAL</option>        
        <option value="3" onClick="javascript:cargarmun(document.forms['form1']);">PRIVADA</option>
        <option value="4" onClick="javascript:cargarmun(document.forms['form1']);">PUBLICA</option>        
        </select>
      <%}if(buscar==7){	%>
      <select name="nacionalidad" class="combos" >	  
        <%if(nacionalidad==0){%>		
        <option value="">Seleccione...</option>
        <%}if(nacionalidad==1){%>	  
        <option value="<%=nacionalidad%>">COLOMBIANA</option>
        <%}if(nacionalidad==2){%>	   
        <option value="<%=nacionalidad%>">VENEZOLANA</option> 
        <%}if(nacionalidad==3){%>
        <option value="<%=nacionalidad%>">OTRO</option>    
        <%}%>
        <option value="1" onClick="javascript:cargarmun(document.forms['form1']);">COLOMBIANA</option>
        <option value="2" onClick="javascript:cargarmun(document.forms['form1']);">VENEZOLANA</option>          
        <option value="3" onClick="javascript:cargarmun(document.forms['form1']);">OTRO</option>         
        </select>
      
      <%}if(buscar==5){	%>
      <select name="edades" class="combos" >
        <%if(edades==0){%>  		
        <option value="">Seleccione...</option>
        <%}if(edades==1){%> 		
        <option value="<%=edades%>">0 - 14 a&ntilde;os</option>
        <%}if(edades==2){%> 		
        <option value="<%=edades%>">14 - 18 a&ntilde;os</option>
        <%}if(edades==3){%> 		
        <option value="<%=edades%>">18 - 25 a&ntilde;os</option>
        <%}if(edades==4){%>		
        <option value="<%=edades%>">25 - 35 a&ntilde;os</option>
        <%}if(edades==5){%>		
        <option value="<%=edades%>">35 - 50 a&ntilde;os</option>
        <%}if(edades==6){%> 
        <option value="<%=edades%>">mayor 50 a&ntilde;os</option>
        <%}%>
        <option value="1" onClick="javascript:cargarmun(document.forms['form1']);">0 - 14 a&ntilde;os</option>
        <option value="2" onClick="javascript:cargarmun(document.forms['form1']);">14 - 18 a&ntilde;os</option>
        <option value="3" onClick="javascript:cargarmun(document.forms['form1']);">18 - 25 a&ntilde;os</option>
        <option value="4" onClick="javascript:cargarmun(document.forms['form1']);">25 - 35 a&ntilde;os</option>
        <option value="5" onClick="javascript:cargarmun(document.forms['form1']);">35 - 50 a&ntilde;os</option>
        <option value="6" onClick="javascript:cargarmun(document.forms['form1']);">mayor 50 a&ntilde;os</option>
        </select>
      <%}%>  
    </td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
  </table>

   <input  type="hidden" name="periodo" value="<%=periodo%>">
                 <input  type="hidden" name="buscar2" value="<%=buscar%>">
                 <input  type="hidden" name="sexo2" value="<%=sexo%>">
                 <input  type="hidden" name="municipio2" value="<%=municipio%>">
                 <input  type="hidden" name="nacionalidad2" value="<%=nacionalidad%>">
                 <input  type="hidden" name="edades2" value="<%=edades%>">
                   <input  type="hidden" name="areas2" value="<%=areas%>">
  </div>
  <div align="right" >
  <%
  							boolean aux=true;							
							Conex con = new Conex();						
							ResultSet rs=null;
							if(buscar==0){																
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
							}							
							if(buscar==1){															
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(municipio!="0"){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and municipio='"+municipio+"'  order by perradicado");		
								}
							}							
							if(buscar==2){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SI'  order by perradicado");	
							}
							if(buscar==3){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perdesplazado='SI'  order by perradicado");	
							}
							if(buscar==4){																
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(sexo==1){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and persexo='MASCULINO'  order by perradicado");	
								}
								if(sexo==2){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and persexo='FEMENINO'  order by perradicado");	
								}
							}
							if(buscar==5){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(edades==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='0 - 14 anos'  order by perradicado");	
								}if(edades==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='14 - 18 anos'  order by perradicado");	
								}if(edades==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='18 - 25 anos'  order by perradicado");	
								}if(edades==4){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='25 - 35 anos'  order by perradicado");	
								}if(edades==5){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='35 - 50 anos'  order by perradicado");	
								}if(edades==6){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='mayor 50 anos'  order by perradicado");	
								}								
							}
							if(buscar==6){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perdiscapacidad='SI'  order by perradicado");	
							}
							if(buscar==7){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(nacionalidad==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='COLOMBIANA'  order by perradicado");	
								}if(nacionalidad==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='VENEZOLANA'  order by perradicado");	
								}if(nacionalidad==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='OTRO'  order by perradicado");	
								}							
							}
							if(buscar==8){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pergrupoetnico='SI'  order by perradicado");	
							}
							if(buscar==9){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(areas==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='LABORAL'  order by perradicado");	
								}if(areas==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PENAL'  order by perradicado");	
								}if(areas==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PRIVADA'  order by perradicado");	
								}if(areas==4){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PUBLICA'  order by perradicado");	
								}							
							}							
							int cont = con.contar(rs); 
  %>				
                 <%if(cont!=0){%>
				  <input name="input" type="button" class="botones" onClick="javascript:exportar(document.forms['form1'])"  value=" Exportar a Excel " />
                  <%}%>
  </div> 
  <table width="600" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
    <tr>
                    <td width="600" height="17" valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="3" align="center" class="text_blanco">Listado de Casos                          </td>
                          <td height="20" colspan="3" align="center" class="text_blanco">Total:&nbsp; <%=cont%>&nbsp; Casos</td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro">N&ordm;</td>
                          <td width="14%" align="center" class="text_negro">Radicado N&ordm; </td>
                          <td width="45%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
                          <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
                          <td align="center" class="text_negro">Hora</td>
                          <td width="8%" align="center" class="text_negro">Recibido</td>
                        </tr>
                         <% 	
							
							String[][] opes = new String[cont][6];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getString("perradicado");
									opes[i][1]=rs.getString("pernombre");
									opes[i][2]=rs.getString("perapellido");
									opes[i][3]=rs.getString("perfecha");
									opes[i][4]=rs.getString("perhora");
									opes[i][5]=rs.getString("perrecibido");
									rs.next();
								}
								
							
							
								
							  int color = 1;
							  String fondo = null;
							 for(int i=0;i<cont;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>">
 <td  align="center" height="20" class="text_negro"> <%=i+1%></td>
                       <td  class="text_negro" align="center"> <%= opes[i][0] %></td>
                    <td  class="text_negro" colspan="1">&nbsp;<%= opes[i][1] %>&nbsp;&nbsp;<%= opes[i][2] %></td>
         <td  class="text_negro" colspan="1" align="center"><%= opes[i][3] %></td>
      <td class="text_negro" align="center"><%= opes[i][4] %></td>
       <td  class="text_negro" align="center"><%=opes[i][5]%>                             </td>
                        </tr>
                        <%}
					}else{
					aux=false;
				 %>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="6">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table>
						
                  </tr>
                  <%if(aux){%>
                  <tr>
                    <td align="right" class="fondo_celda_3">&nbsp;</td>
                  </tr>
                  <%}else{}%>
              </table>
  </form><br/>			  
   </div>
</div>
 
 </td> </tr> 
 </tbody></table></td> 
 </tr> 
 <tr> 
 <td height="2"> 
   <div id="footer"></div></td> 
</tr> 
 
	</tbody></table>
</div>
<jsp:include page="botoom.jsp" />
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>