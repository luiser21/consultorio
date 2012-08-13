<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
Conex con = new Conex();

String buscar=String.valueOf(request.getParameter("buscar"));
int contador;
Conex conn = new Conex();
Conex conact = new Conex();
int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("SELECT usuario.usuestado, usuario.perid, usuario.usulogin, usuario.usupassword, rol.roldescripcion, persona.pernombre, persona.perapellido, persona.percorreo FROM usuario Inner Join rolxusuario ON usuario.perid =rolxusuario.perid Inner Join rol ON rol.rolid = rolxusuario.rolid Inner Join persona ON usuario.perid =persona.perid");	
int contt = conn.contar(rss);
int ntuplas=20;
int x=contt/ntuplas;
int y=contt%ntuplas;
if(y!=0){
x=x+1;
}
int i=0;
String id=String.valueOf(request.getParameter("id"));
String perfil=String.valueOf(request.getParameter("perfil"));
String ac=String.valueOf(request.getParameter("ac"));
if(!ac.equals("null") && !id.equals("null")){	
	if(ac.equals("desactivar")){		
		String actualiza = "update usuario set usuestado=0 where perid='"+id+"'";
		conact.actualizar(actualiza);
	}
	if(ac.equals("activar")){
		String actualiza = "update usuario set usuestado=1 where perid='"+id+"'";
		conact.actualizar(actualiza);
	}
	if(ac.equals("eliminar")){
		
		String actualiza = "delete from rolxusuario where perid='"+id+"' and rolid='"+perfil+"'";
		conact.actualizar(actualiza);
		
		 actualiza = "delete from usuario where perid='"+id+"'";
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

function agregar(frm){
		frm.action="usuarios_agre.jsp";
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
		frm.action="usuarios.jsp";
		frm.submit();
}
function cargarmun(frm){
		frm.action="usuarios.jsp";
		frm.submit();
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="usuarios.jsp";
		frm.submit();
}
function asignarzona(frm, bus, departamento){

if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;	
if(departamento=="null")    frm.dep.value="";
else    frm.dep.value=departamento;	
}
function actionChange(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "usuarios.jsp?dep="+<%=dep%>+"&id=" + fileID + "&ac=" + actionName;
}
function actionChange2(actionName, fileID, fileID2)
{
	/*show_div_loader();*/
	window.location = "usuarios.jsp?dep="+<%=dep%>+"&id=" + fileID + "&perfil=" + fileID2 + "&ac=" + actionName;
}

</script>
<script>
	$(document).ready(function(){
			$(".iframe").colorbox({iframe:true, width:"500px", height:"300px"});	
					
		});	
</script>
</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(buscar);%>','<% out.print(dep);%>');">
<div id="content">
<%
						boolean aux=true;
						String consulta = null;  
						String comparar=null;
						String comparar2=null;		
					 if(buscar=="null" || buscar==""){ 			
						consulta = "SELECT usuario.usuestado, usuario.perid, usuario.usulogin, usuario.usupassword, rol.roldescripcion, rol.rolid, persona.pernombre, persona.perapellido, persona.percorreo FROM usuario Inner Join rolxusuario ON usuario.perid =rolxusuario.perid Inner Join rol ON rol.rolid = rolxusuario.rolid Inner Join persona ON usuario.perid =persona.perid limit 20 offset "+dep+"";	
						}else{
						consulta = "SELECT usuario.usuestado, usuario.perid, usuario.usulogin, usuario.usupassword, rol.roldescripcion, rol.rolid, persona.pernombre, persona.perapellido, persona.percorreo FROM usuario Inner Join rolxusuario ON usuario.perid =rolxusuario.perid Inner Join rol ON rol.rolid = rolxusuario.rolid Inner Join persona ON usuario.perid =persona.perid where  upper(persona.pernombre) like '%"+buscar+"%' OR lower(usuario.usulogin) like '%"+buscar+"%'  or upper(persona.perapellido) like '%"+buscar+"%' or upper(rol.roldescripcion) like '%"+buscar+"%' ";	
					
						 	}
						 ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][9];
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

</td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 

 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1>Usuarios Registrados</h1>
  <p></p><br/>
   <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Puede buscar un usuario por nombres, perfil, nombre de usuario</div>
				</div>
  <div id="texto_contenido">
 
<form name="form1" method="post">
    
<strong class="text_negro">BUSCAR USUARIO: </strong> 
<input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                  <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/>
                  <div align="right" style="width:604px"></div><br/>
  	<div align="right" style=" padding-bottom:1px;"> 		
                
                
                	<input name="Input3" type="button" onClick="javascript:agregar(document.forms['form1']);" class="botones" value="  Agregar ">
                  </div>
          
<table width="600" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
   				  <tr>				  
                    <td valign="top" height="17" >
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="5" align="center" class="text_blanco">Listado de Usuarios</td>
                          <td height="20" colspan="7" align="center"  > <div>  <%
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
                          <td width="31%" align="center" class="text_negro">Nombre y Apellidos</td>
                          <td width="13%" align="center" class="text_negro">Usuario</td>
                          <td width="16%" align="center" class="text_negro">Contraseña</td>
                          <td width="12%" align="center" class="text_negro">Perfil</td>
                          <td width="9%" align="center" class="text_negro">Activo </td>
                          <td width="10%" align="center" class="text_negro">Acciones</td>
                        </tr>
                        <% 	
							
					
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perid");
									opes[ii][1]=rs.getString("usulogin");
									opes[ii][2]=rs.getString("pernombre");
									opes[ii][3]=rs.getString("perapellido");
									opes[ii][4]=rs.getString("usuestado");
									opes[ii][5]=rs.getString("roldescripcion");
									opes[ii][6]=rs.getString("usupassword");
									opes[ii][7]=rs.getString("rolid");
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
                          <td width="31%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][2] %>  <%= opes[ii][3] %></div></td>
                          <td width="13%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][1] %> </div></td>
                          <td width="16%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][6] %> </div></td>
                          <td width="12%" height="20" class="text_negro"><div align="center"><%= opes[ii][5] %></div></td>
                          <td width="9%" height="20" align="center" class="text_negro"><%
						  comparar2=opes[ii][4];
						  if(comparar2.equals("1")){%>
						  <img src="img/acs_chk.gif" width="14" title="Desactivar Usuario" height="14" border="0" onclick='javascript:actionChange("desactivar", "<%= opes[ii][0]%>")' style='cursor:pointer;'>
						   <%}else{
						   		 if(comparar2.equals("0")){%>
						    <img src="img/error.gif" width="14" title="Activar Usuario" height="14" border="0" onclick='javascript:actionChange("activar", "<%= opes[ii][0]%>")' style='cursor:pointer;'>
							<%	}
							}%>
						  </td>
                          <td width="10%" height="20" align="center" class="text_negro">
 <a href="carries_forms/form_10.jsp?usuario=<%=opes[ii][0]%>" class='iframe'>
 <img src="img/accessories-text-editor.png" width="14" height="14" border="0" style='cursor:pointer;' title="Editar Usuario"  />
 </a>
 
  <img src="img/user-trash-full.png" width="14" height="14" border="0" style='cursor:pointer;' title="Eliminar" onclick='javascript:actionChange2("eliminar", "<%= opes[ii][0]%>", "<%= opes[ii][7]%>")' /></td>
                        </tr>
                        <%
							dep++;
							}
					}else{
					aux=false;
				 %>    <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="12">No se encontraron registros.</td>
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