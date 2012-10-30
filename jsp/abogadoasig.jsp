<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
int exito=0;
Conex con = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String buscar=String.valueOf(request.getParameter("buscar"));
String satisfactorio=String.valueOf(request.getParameter("exito"));
if(satisfactorio!= "null"){
	exito=Integer.valueOf(satisfactorio).intValue();
}
Conex asignacion=new Conex();
ResultSet  asignacionrs = asignacion.consultar("select  count(*) as numero from asignacion where periodo='"+periodo+"' ");	
asignacionrs.next();
int cantidadasig=Integer.valueOf(asignacionrs.getString("numero")).intValue();

int contador;
Conex conn = new Conex();
Conex conact = new Conex();
int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("select  *  from  ((select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudiantes as e where perid='"+periodo+"' order by e.nombre asc) union (select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudianteperiodo as et, estudiantes e where e.estuid=et.estudiante and et.periodo='"+periodo+"')) as  estudiantes order by nombre asc");	
int contt = conn.contar(rss);
int ntuplas=20;
int x=contt/ntuplas;
int y=contt%ntuplas;
if(y!=0){
x=x+1;
}
int i=0;
String id=String.valueOf(request.getParameter("id"));
String ac=String.valueOf(request.getParameter("ac"));
if(!ac.equals("null") && !id.equals("null")){	
	if(ac.equals("desactivar")){		
		String actualiza = "update estudiantes set activo='NO' where estuid='"+id+"'";
		conact.actualizar(actualiza);
	}
	if(ac.equals("activar")){
		String actualiza = "update estudiantes set activo='SI' where estuid='"+id+"'";
		conact.actualizar(actualiza);
	}
}
String id2=String.valueOf(request.getParameter("id2"));
String ac2=String.valueOf(request.getParameter("ac2"));
if(!ac2.equals("null") && !id2.equals("null")){	
	if(ac2.equals("desactivar")){		
		String actualiza = "update estudiantes set reparto='NO' where estuid='"+id2+"'";
		conact.actualizar(actualiza);
	}
	if(ac2.equals("activar")){
		String actualiza = "update estudiantes set reparto='SI' where estuid='"+id2+"'";
		conact.actualizar(actualiza);
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<style type="text/css"> @import url("css/calendar-win2k-cold-1.css"); </style>
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript" src="jScripts/calendario.js"></script>
<script type="text/javascript" src="jScripts/calendar.js"></script>
<script type="text/javascript" src="jScripts/calendar-setup.js"></script>
<script type="text/javascript" src="jScripts/calendar-es.js"></script>
<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
 
	//Checkbox
	$("input[name=checktodos]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos]:checked").length == 1){
				$("input[name=codigo]").prop("checked", true);
				//$("input[name=area2]").checked = true;
			} else {
				$("input[name=codigo]").prop("checked", false);
			}
		});
	});
 
});
</script>
<script language="JavaScript">

function exportar(frm){
		frm.action="abogadoasig_excel.jsp";
		frm.submit();		
}
function agregar(frm){
		frm.action="abogadoasigagre.jsp";
		frm.submit();
}
function modificar(frm){
		var y=0;		
		for(var i = 0; i < frm.codigo.length; i++){		
			if(frm.codigo[i].checked)y++;
		}		
		if(y>0 ) {
			if(y>1){
				alert ("Para Modificar solo seleccione un Estudiante a la vez.");
			}else{
				frm.action="abogadoasigmod.jsp";
				frm.submit();
			}
		}else{
				alert ("Debe seleccionar un Estudiante.");
		}
}
function eliminar(frm){
		var y=0;		
		for(var i = 0; i < frm.codigo.length; i++){		
			if(frm.codigo[i].checked)y++;
		}		
		if(y>0 ) {
			if(y>1){
				if(confirm("¿Está seguro de Eliminar los "+y+" Estudiantes?.")){
					frm.action="abogadoasigelim.jsp";
					frm.submit();
				}
			}
			if(y==1){
				if(confirm("¿Está seguro de Eliminar el Estudiante?.")){
					frm.action="abogadoasigelim.jsp";
					frm.submit();
				}
			}
		}else{
				alert ("Debe seleccionar un Estudiante.");
		}
}
function eliminar_radio(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Estudiante.");
	}else if(confirm("¿Está seguro de Eliminar el Estudiante?.")){
		frm.action="abogadoasigelim.jsp";
		frm.submit();
		}
}
function modificar_radio(frm){
	if (!chequearOpcion()) {	
		alert("Debe seleccionar un Estudiante.");
	}else{ 
		frm.action="abogadoasigmod.jsp";
		frm.submit();
	}
}
function modificar2(frm){
		frm.action="abogadoasig.jsp";
		frm.submit();
}
function cargarmun(frm){
		frm.action="abogadoasig.jsp";
		frm.submit();
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="abogadoasig.jsp";
		frm.submit();
}
function asignarzona(frm, per, bus, departamento){
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	
if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;	
if(departamento=="null")    frm.dep.value="";
else    frm.dep.value=departamento;	
}
function actionChange(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "abogadoasig.jsp?periodo="+<%=periodo%>+"&dep="+<%=dep%>+"&id=" + fileID + "&ac=" + actionName;
}
function actionChange2(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "abogadoasig.jsp?periodo="+<%=periodo%>+"&dep="+<%=dep%>+"&id2=" + fileID + "&ac2=" + actionName;
}
</script>

</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>','<% out.print(dep);%>');">
<div id="content">
<%
						boolean aux=true;
						String consulta = null;  
						String comparar=null;
						String comparar2=null;		
					 if(buscar=="null" || buscar==""){ 			
						consulta = "select  *  from  ((select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudiantes as e where perid='"+periodo+"' order by e.nombre asc) union (select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudianteperiodo as et, estudiantes e where e.estuid=et.estudiante and et.periodo='"+periodo+"')) as  estudiantes order by nombre asc limit 20 offset "+dep+"";	
						}else{
						consulta = "select  *  from  ((select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudiantes as e where perid='"+periodo+"' order by e.nombre asc) union (select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudianteperiodo as et, estudiantes e where e.estuid=et.estudiante and et.periodo='"+periodo+"'  )) as  estudiantes where  upper(nombre) like '%"+buscar+"%' OR upper(apellido) like '%"+buscar+"%'  or upper(identificacion) like '%"+buscar+"%' order by nombre asc";	
					
						 	}
						 ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][7];
%>
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
<%if(contt!=0){%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/distributor_report_98371.jpg" width="100" height="100" />
<%}%>
</td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 

 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1>Abogados en Formacion Activos y en Reparto</h1>
  <p></p><br/>
  <%if(exito==1){%>
   <div id="msgBox_info" class="notification information png_bg">
					<div>
                   El Proceso de Asignacion de Estudiantes a las Areas se Realizo Exitosamente </div>
				</div>
	<%}%>			
   <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Puede buscar un estudiante por numero de cedula, nombres y apellidos </div>
				</div>
				
  <div id="texto_contenido">
 
<form name="form1" method="post">

 	 <input name="periodo"  type="hidden"  value="<%=periodo%>" />
    
<strong class="text_negro">BUSCAR ESTUDIANTE: </strong> <input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                  <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/>
                  				   <strong class="text_negro">PERIODO  <%=periodo%></strong>
  <div align="right" style="width:604px"></div><br/>
  	<div align="right" style=" padding-bottom:1px;"> 		
	<%if(cont>1 && cantidadasig==0){%>
<input name="input" type="button" class="botones" onClick="javascript: window.location='asignacion.jsp?periodo=<%=periodo%>'"  value="Asignacion Automatica"/>
<%} asignacion.close();%>
	 <%if(contt!=0){%>
				  <input name="input" type="button" class="botones" onClick="javascript:exportar(document.forms['form1'])"  value=" Exportar a Excel " />
                
                 		
                  <%if(cont>1){%>
                  	<input name="" type="button"  onClick="javascript:modificar(document.forms['form1'])" class="botones" value="Modificar">
               	  	<input name="" type="button"  onClick="javascript:eliminar(this.form)" class="botones" value="Eliminar">
                  
                <%}if(cont==1){%>
                  	<input name="" type="button"  onClick="javascript:modificar_radio(document.forms['form1'])" class="botones" value="Modificar">
				  	<input name=""  type="button" onClick="javascript:eliminar_radio(this.form)" class="botones" value="Eliminar">
                  
				<%}%>
                
                
                	<input name="Input3" type="button" onClick="javascript:agregar(document.forms['form1']);" class="botones" value="  Agregar ">
                  </div>
                  <%}%>

<table width="600" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
   				  <tr>				  
                    <td valign="top" height="17" >
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="5" align="center" class="text_blanco">Listado de Abogados                          </td>
                          <td height="20" colspan="6" align="center"  > <div>  <%
						 if(buscar=="null" || buscar==""){   
						  if(contt>0){%>
                            <select name="dep" style="font-size:10px; font-family:Arial, Helvetica, sans-serif" onchange="javascript:cargarmun(document.forms['form1']);" >
                              <%if(dep!=0){%>
                              <option  value="<%=dep%>"><%=(dep+1)%> - <%=(dep+20)%> de <%=contt%></option>
                              
                              <%}%>
                              <%while(i<x){ %>							  
                              <option value="<%=i*ntuplas%>" ><%=(i*ntuplas+1)%> - <%=((i+1)*ntuplas)%> de <%=contt%></option>
                              <%i++;%>							  
                              <%}%>
                              </select>  
                            <%}}%></div></td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="5%" height="20"  align="center" class="text_negro"><span class="text_blanco">
                        <%if(cont>1){%>    <input name="checktodos"   id="checktodos" type="checkbox"  value="" /> <%}%>
                          </span></td>
                          <td width="4%" align="center" class="text_negro">N</td>                          
                          <td width="13%" align="center" class="text_negro">Codigo</td>
                          <td width="24%" align="center" class="text_negro">Nombre </td>
                          <td width="29%" align="center" class="text_negro">Apellido</td>
                          <td width="12%" align="center" class="text_negro">Activo</td>
                          <td width="13%" align="center" class="text_negro">Reparto </td>
                        </tr>
                        <% 	
							
					
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("estuid");
									opes[ii][1]=rs.getString("identificacion");
									opes[ii][2]=rs.getString("nombre");
									opes[ii][3]=rs.getString("apellido");
									opes[ii][4]=rs.getString("activo");
									opes[ii][5]=rs.getString("reparto");
									rs.next();
							}	
							
							 int color = 1;
							  String fondo = null;
							  dep=dep+1;
							 for(int ii=0;ii<cont;ii++){
							 				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>">
                          <td width="5%" height="20" align="center">
                              <%if(cont>1){%>
                            <input  type="checkbox" name="codigo" value="<%= opes[ii][0] %>"/>   
                             <%}if(cont==1){%>
                          <input  type="radio" name="codigo" value="<%= opes[ii][0] %>"/>  
						  <%}%>                       </td>
                          <td width="4%" height="20" class="text_negro" align="center"><%=dep %></td>
                          <td width="13%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][1] %> </div></td>
                          <td width="24%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][2] %> </div></td>
                          <td width="29%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][3] %> </div></td>
                          <td width="12%" height="20" class="text_negro"><div align="center"><%
						  comparar=opes[ii][4];
						  if(comparar.equals("SI")){%>
			 <img src="img/acs_chk.gif" width="14" height="14" title="Desactivar Estudiante" border="0" onclick='javascript:actionChange("desactivar", "<%= opes[ii][0]%>")' style='cursor:pointer;'>   
						   <%}else{
						   		 if(comparar.equals("NO")){%>
						    <img src="img/error.gif" width="14" title="Activar Estudiante" height="14" border="0" onclick='javascript:actionChange("activar", <%= opes[ii][0]%>)' style='cursor:pointer;'>        
							<%	}
							}%>
						   </div></td>
                          <td width="13%" height="20" class="text_negro" align="center"><%
						  comparar2=opes[ii][5];
						  if(comparar2.equals("SI")){%>
						  <img src="img/acs_chk.gif" width="14"  title="" height="14" border="0" onclick='javascript:actionChange2("desactivar", "<%= opes[ii][0]%>")' style='cursor:pointer;'>
						   <%}else{
						   		 if(comparar2.equals("NO")){%>
						    <img src="img/error.gif" width="14" height="14" border="0" onclick='javascript:actionChange2("activar", "<%= opes[ii][0]%>")' style='cursor:pointer;'>
							<%	}
							}%>
						  </td>
                        </tr>
                        <%
							dep++;
							}
					}else{
					aux=false;
				 %>    <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="11">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table>
                    </td>
                  </tr>
                  <%if(aux){%>
                 
                  <%}else{%>
				  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">		<input name="Input3" type="button" onClick="javascript:agregar(document.forms['form1']);" class="botones" value="  Agregar "></td>
                  </tr>
				  <%}%>
                </table>
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
<%}catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		if(session.getAttribute("roles")!=null){			
			if(!rol.equals("Admin")){
				 response.sendRedirect("ilegal.jsp");
			}else{
				response.sendRedirect("error_fatal.jsp");
			}
		}				
}%>