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
Conex con22 = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));
ResultSet  rs=null;
if(!codigo.equals("null")){
	String consulta = "select * from estudiantes where estuid='"+codigo+"'";		
	rs = con.consultar(consulta);
	rs.next();

}
boolean aux=true;
ResultSet  rs2 = con2.consultar("(select nombrearea as area from area) except (SELECT asig.area  as area FROM estudiantes as es,  asignacion as asig, area  as ar where es.estuid=asig.estudiante and asig.area=ar.nombrearea and asig.estudiante='"+codigo+"')");	
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
	}else if(confirm ("¿Está seguro de actualizar el registro?")){
		frm.action="abogadoasigmodMsg.jsp";
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
				$("input[name=area]").prop("checked", true);
			} else {
				$("input[name=area]").prop("checked", false);
			}
		});
	});
 
});
</script>
<script type="text/javascript">
$(document).ready(function(){
 
	//Checkbox
	$("input[name=checktodos2]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos2]:checked").length == 1){
				$("input[name=area2]").prop("checked", true);
				//$("input[name=area2]").checked = true;
			} else {
				$("input[name=area2]").prop("checked", false);
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
  <h1>Agregar Nuevo Abogado en Formacion / Periodo: <%=periodo%></h1>
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
                          <td  align="center" class="text_blanco" colspan="4">Datos Estudiante en Formacion
                            <input name="periodo"  type="hidden"  value="<%=periodo%>" > </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td colspan="3"   align="center" class="text_negro" >Nombre </td>
                          <td width="61%"   align="center" class="text_negro" >Apellido</td>
                        </tr>
                     
                        <tr class="fondo_celda_5">
                          <td colspan="3"   align="center"> 
                          <input  type="hidden" name="codigo"  value="<%=rs.getString("estuid")%>" >
                                                        <input type="text" name="nombre" size="30"  class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"  value="<%=rs.getString("nombre")%>"></td>
                          <td height="20"  align="center"><input type="text" name="apellido" class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%=rs.getString("apellido")%>"></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" colspan="3"  align="center" class="text_negro">Identificacion</td>
                          <td height="20"  align="center" class="text_negro">Activo</td>
                          </tr>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="3"  align="center"><input  type="text" name="identificacion" class="text_file" size="20"  value="<%=rs.getString("identificacion")%>"></td>
                          <td height="20"  align="center" class="text_negro"><label><%if(rs.getString("activo").equals("SI")){%>
                            <input type="radio" name="activo" value="SI" checked="checked">
                            Activar </label><label> <input type="radio" name="activo" value="NO" >
                              Desactivar</label><label>
                                <%}else{ if(rs.getString("activo").equals("NO")){%>
                                <input type="radio" name="activo" value="SI" >
                                Activar
                                </label><label><input type="radio" name="activo" value="NO" checked="checked">
                                  Desactivar </label>
                            <%}}%> </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" colspan="3" align="center" class="text_negro">Observacion</td>
                          <td height="20"  align="center" class="text_negro">Reparto</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="3" align="center">
                            <textarea name="observacion" class="text_file"  cols="25" rows="3" ><%if((rs.getString("observacion"))!=null){out.print(rs.getString("observacion"));}else{}%></textarea>
                        </td>
                          <td height="20"  align="center" class="text_negro">
                          <input name="cont2"  type="hidden"  value="<%=cont2%>" >	
                          <label><%if(rs.getString("reparto").equals("SI")){%>
                            <input type="radio" name="reparto" value="SI" checked="checked" onclick="javascript:MostrarFilas('Op','Op2')">
                            Activar </label><label> <input type="radio" name="reparto" value="NO" onclick="javascript:OcultarFilas('Op','Op2')" >
                              Desactivar</label><label>
                                <%}else{ if(rs.getString("reparto").equals("NO")){%>
                                <input type="radio" name="reparto" value="SI" onclick="javascript:MostrarFilas('Op','Op2')">
                                Activar
                                </label><label><input type="radio" name="reparto" value="NO" checked="checked" onclick="javascript:OcultarFilas('Op','Op2')" >
                                  Desactivar </label>
                                  
                                  
                            <%}}%></td>
                        </tr>
                        <tr   class="fondo_celda_1" name="Op" id="Op">
                          <td  height="20" colspan="5" align="left" ><input name="checktodos"   id="checktodos" type="checkbox"  value="" ><div style=" float:right; width:295px;">                <span class="text_blanco" >Areas a Asignar</span></div></td>
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
                          <input  type="hidden" name="area" id="area" value="<%=0 %>"/>
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
                        
                          <td width="6%" height="20"  align="left" ><input  type="checkbox" name="area" id="area" value="<%= opes[i][0] %>"/></td>
                          <td width="32%"  align="left" >&nbsp;</td>
                          <td height="20" colspan="9"  align="left" ><%= opes[i][0] %></td>
                          </tr>
                          <% }
							}else{
							aux=false;
							 %>
                        <tr class="fondo_celda_5" name="Op" id="Op">
                          <td height="20" colspan="5" align="center"  >No se encontraron registros o ya tiene asignada todas las areas.</td>
                          </tr>
                          <%	}%>
                          
                          
                          <%  //---------------------------------------------------------%>
                            <tr   class="fondo_celda_1">
                          <td  height="20" colspan="5" align="left" >
                          <input name="checktodos2"   id="checktodos2" type="checkbox"  value="" ><div style=" float:right; width:295px;"><span class="text_blanco" >Eliminar Areas Asignadas</span></div></td>
                          </tr>
                       <input  type="hidden" name="area2" value="<%=0 %>"/>
						                       
                       
                        <%
				boolean aux2=true;
ResultSet  rs22 = con22.consultar("SELECT asig.area  as area FROM estudiantes as es,  asignacion as asig, area  as ar where es.estuid=asig.estudiante and asig.area=ar.nombrearea and asig.estudiante='"+codigo+"' order by area asc");	
int cont22 = con22.contar(rs22);
String[][] opes2 = new String[cont22][2];
							rs22.beforeFirst();
							if(cont22!=0){ 
								rs22.next();
								for(int ii=0;ii<cont22;ii++){
									opes2[ii][0]=rs22.getString("area");
									rs22.next();
								}
						     	int color2 = 1;
							    String fondo2 = null;
							    for(int ii=0;ii<cont22;ii++){				    
								  fondo2 = "fondo_celda_3";
								  if ((color2%2)==0)
									fondo2 = "fondo_celda_4";
								  color2 += 1;
						%>
                        <tr class="<%= fondo2 %>"  > 
                        
                          <td width="6%" height="20"  align="left" ><input  type="checkbox" name="area2" id="area2" value="<%= opes2[ii][0] %>"/></td>
                          <td width="32%"  align="left" >&nbsp;</td>
                          <td height="20" colspan="9"  align="left" ><%= opes2[ii][0] %></td>
                          </tr>
                          <% }
							}else{
							aux2=false;
							 %>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="5" align="center"  >No posee areas asignadas.</td>
                          </tr>
                          <%	}%>
                          
                          
                      </table>
					</td>
                  </tr>
                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">
                     <input name="" type="button" class="botones" value=" Modificar " onclick="javascript:registrar(document.forms['form1']);">
                    </td>
                  </tr>              
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>   <p>&nbsp;</p>   <p>&nbsp;</p> 
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