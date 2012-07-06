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
Conex con = new Conex();
Conex con2 = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
		boolean aux=true;
						ResultSet  rs2 = con2.consultar("select nombrearea as area from area order by area asc");	
							int cont2 = con2.contar(rs2);
							String[][] opes = new String[cont2][2];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset="iso-8859-1>
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<style type="text/css"> @import url("css/calendar-win2k-cold-1.css"); </style>
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script language="JavaScript">
function registrar(frm){
	var y=0;
	for(var i = 0; i < frm.area.length; i++){
		if(frm.area[i].checked)y++;
	}
	if(esVacio(frm.nombre.value)){
		alert("Debe ingresar el nombre del estudiante.");
		frm.nombre.focus();
	}else if(esVacio(frm.apellido.value)){
		alert("Debe ingresar el apellido del estudiante.");
		frm.apellido.focus();
	}else if(esVacio(frm.identificacion.value)){
		alert("Debe ingresar la identificacion del estudiante.");
		frm.identificacion.focus();	
	}else if(!esNumero(frm.identificacion.value)){	
		alert("El valor de este campo debe ser tipo numérico.");
		frm.identificacion.focus();
	}else if(y==0){	
		alert("Debe seleccionar las Areas.");
		frm.area.focus();	
	}else if(confirm ("¿Está seguro de crear el registro?")){
		frm.action="abogadoasigagreMsg.jsp";
		frm.submit();
	}
}
function registrar2(frm){
	if(esVacio(frm.nombre.value)){
		alert("Debe ingresar el nombre del estudiante.");
		frm.nombre.focus();
	}else if(esVacio(frm.apellido.value)){
		alert("Debe ingresar el apellido del estudiante.");
		frm.apellido.focus();
	}else if(esVacio(frm.identificacion.value)){
		alert("Debe ingresar la identificacion del estudiante.");
		frm.identificacion.focus();	
	}else if(!esNumero(frm.identificacion.value)){	
		alert("El valor de este campo debe ser tipo numérico.");
		frm.identificacion.focus();
	}else if(confirm ("¿Está seguro de crear el registro?")){
		frm.action="abogadoasigagreMsg.jsp";
		frm.submit();
	}
}
function volver(frm){

		frm.action="abogadoasig.jsp";
		frm.submit();
		
}
function OcultarFilas(Fila, Fila2) {
    var elementos = document.getElementsByName(Fila);
	var elementos2 = document.getElementsByName(Fila2);
    for (k = 0; k< elementos.length; k++) {
               elementos[k].style.display = "none";
    }
	for (kk = 0; kk< elementos2.length; kk++) {
               elementos2[kk].style.display ="inline";
    }
	
}
function MostrarFilas(Fila, Fila2) {
var elementos = document.getElementsByName(Fila);
    for (i = 0; i< elementos.length; i++) {
        if(navigator.appName.indexOf("Microsoft") > -1){
               var visible = 'block'
        } else {
               var visible = 'table-row';
        }
	elementos[i].style.display = visible;
        }
		
var elementos2 = document.getElementsByName(Fila2);
    for (ii = 0; ii< elementos2.length; ii++) {
        if(navigator.appName.indexOf("Microsoft") > -1){
               var visible = 'block'
        } else {
               var visible = 'table-row';
        }
	elementos2[ii].style.display = "none";
        }
}

</script>
<script type="text/javascript">
$(document).ready(function(){
 
	//Checkbox
	$("input[name=checktodos]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos]:checked").length == 1){
				this.checked = true;
			} else {
				this.checked = false;
			}
		});
	});
 
});
</script>

</head>
<body>
<div id="content">

<table summary="Universidad de Pamplona" border="0" cellpadding="0" cellspacing="0" width="960" align="center">
			<tbody><tr> 
 <td> <jsp:include page="header.jsp" />

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
  <h1>Nuevo Abogado en Formacion / Periodo: <%=periodo%></h1>
  <p></p><br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:552px">
 <input name="" type="button" class="botones" value=" Atras " onclick="javascript:volver(document.forms['form1']);"></div>  
  <table width="500" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" >
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td colspan="2"  align="center" class="text_blanco" >Datos Estudiante en Formacion
                            <input name="periodo"  type="hidden"  value="<%=periodo%>" > </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td   height="20" align="center" class="text_negro" >Nombre </td>
                          <td width="58%"    height="20"  align="center" class="text_negro" >Apellido</td>
                        </tr>
                     
                        <tr class="fondo_celda_5">
                          <td   align="center"> 
                            <%
						  ResultSet  rs=null;
						  String consulta = "select max(estuid) as numeromaxi from estudiantes";		
						  rs = con.consultar(consulta);
						  rs.next();							
						  String numero=rs.getString("numeromaxi");
						  con.close();
					      int contares=Integer.parseInt(numero)+1;
		   				  %>
                            <input  type="hidden" name="codigo" size="10"  value="<%=contares%>" >                            <input type="text" name="nombre" class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" ></td>
                          <td height="20"  align="center"><input type="text" name="apellido" size="30"  class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro">Identificacion</td>
                          <td height="20"  align="center" class="text_negro">Activo</td>
                          </tr>
                        <tr class="fondo_celda_5">
                          <td height="20"   align="center"><input  type="text" name="identificacion"  class="text_file" size="20" ></td>
                          <td height="20"  align="center" class="text_negro"><label>
                            <input type="radio" name="activo" value="SI" checked="checked">
                            Activar</label><label>
                              <input type="radio" name="activo" value="NO">
                              Desactivar</label>  </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro">Observacion</td>
                          <td height="20"  align="center" class="text_negro">Reparto</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td height="20"   align="center"><textarea name="observacion"  class="text_file" cols="25" rows="3" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" ></textarea></td>
                          <td height="20"  align="center" class="text_negro">
                            <input name="cont2"  type="hidden"  value="<%=cont2%>" >	
                            
                            <input type="radio" name="reparto" value="SI" checked="checked" onclick="javascript:MostrarFilas('Op','Op2')">
                            Activar
                            <input type="radio" name="reparto" value="NO"  onclick="javascript:OcultarFilas('Op','Op2')" >
                            Desactivar
                            
                            
                          </td>
                        </tr>
                     
                        <tr   class="fondo_celda_1" name="Op" id="Op">
                          <td   height="20" colspan="2" align="left" > <input name="checktodos"   id="checktodos" type="checkbox"  value="" ><div style=" float:right; width:295px;">                <span class="text_blanco" >Areas a Asignar</span></div></td>
                          </tr>
                          <%
							Conex con1=new Conex();
						  ResultSet  res=null;
						  String consultas = "select max(codigo) as numeromaxi from asignacion";		
						  res = con1.consultar(consultas);
						  res.next();							
						  String numeros=res.getString("numeromaxi");
						  con1.close();
					      int contadors=Integer.parseInt(numeros)+1;
		   				  %>
						  <input name="codigoarea"  type="hidden"  value="<%=contadors%>" >			
                      
                       
                        <%
				
							rs2.beforeFirst();
							if(cont2!=0){ 
								rs2.next();
								for(int i=0;i<cont2;i++){
									opes[i][0]=rs2.getString("area");
									rs2.next();
								}
						     	int color = 1;
							    String fondo = null;
							    for(int i=0;i<cont2;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
						%>
                        <tr class="<%= fondo %>"  name="Op" id="Op"> 
                        
                          <td height="20"  align="left" ><input  type="checkbox" name="area" id="area" value="<%= opes[i][0] %>"/></td>
                          <td height="20" align="left" ><%= opes[i][0] %></td>
                          </tr>
                          <% }
							}else{
							aux=false;
							 %>
                        <tr class="fondo_celda_5" name="Op" id="Op">
                          <td height="20" colspan="2"   align="center"  >No se encontraron registros o ya tiene asignada todas las areas.</td>
                          </tr>
                          <%	}%>
                      
                         
                      </table>
                      
					</td>
                  </tr>
                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3" >
                     <input name="Op" type="button" class="botones" id="Op" value=" Registrar " onclick="javascript:registrar(document.forms['form1']);">
                     
                     <input name="Op2" type="button" class="botones" id="Op2" value=" Registrar " onclick="javascript:registrar2(document.forms['form1']);" style="display:none">
                     
                    </td>
                  </tr> 
                        
                </table>
  <p>&nbsp;</p>
</form>				

 
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