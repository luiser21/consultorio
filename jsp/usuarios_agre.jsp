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
Conex con2 = new Conex();
Conex con3 = new Conex();
Conex con4 = new Conex();
String nombre=String.valueOf(request.getParameter("nombre"));
String apellido=String.valueOf(request.getParameter("apellido"));
String usuario=String.valueOf(request.getParameter("usuario"));
String contrasenanueva=String.valueOf(request.getParameter("contrasenanueva"));
String contrasenaconfir=String.valueOf(request.getParameter("contrasenconfir"));
String contradefecto=String.valueOf(request.getParameter("contradefecto"));
String identificacion=String.valueOf(request.getParameter("identificacion"));
String perfil=String.valueOf(request.getParameter("perfil"));
String activo=String.valueOf(request.getParameter("activo"));
String ac=String.valueOf(request.getParameter("ac"));
int contt=0;
if(ac.equals("insert")){
		ResultSet  rs=null;
		String consulta = "select max(perid) as numeromaxi from persona";		
		rs = con.consultar(consulta);
		rs.next();							
		String numero=rs.getString("numeromaxi");
		int contares=Integer.parseInt(numero)+1;			
		
		ResultSet  rsusu=null;
		String consultausu = "select count(*) as cont from usuario where usulogin='"+usuario+"'";		
		rsusu = con.consultar(consultausu);	
		rsusu.next();
		contt = Integer.parseInt(rsusu.getString("cont"));
		String actualiza2=null;	
		
		if(contt==0){
			String actualiza3 = "insert into persona (perid, pernombre, perapellido, perdocumento) values ('"+contares+"', '"+nombre+"', '"+apellido+"', '"+identificacion+"')";
			con4.actualizar(actualiza3);
			con4.close();	
				
			if(contrasenanueva.equals("null") || contrasenanueva.equals("")){
				actualiza2 = "insert into usuario (perid, usulogin, usupassword, usuestado) values ('"+contares+"', '"+usuario+"','"+contradefecto+"', '"+activo+"')";
			}else{
				actualiza2 = "insert into usuario (perid, usulogin, usupassword, usuestado) values ('"+contares+"', '"+usuario+"','"+contrasenanueva+"', '"+activo+"')";
			}
			con2.actualizar(actualiza2);
			con2.close();
			
			String actualiza = "insert into rolxusuario (rolid, perid) values ('"+perfil+"', '"+contares+"')";
			con3.actualizar(actualiza);	
			con3.close();	
			
			response.sendRedirect("usuarios_agre_Msg.jsp");		
		}		
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset="iso-8859-1>
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>

<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script language="JavaScript">
function registrar(frm){
	
	if(esVacio(frm.nombre.value)){
		alert("Debe ingresar el nombre del Usuario.");
		frm.nombre.focus();
	}else if(esVacio(frm.apellido.value)){
		alert("Debe ingresar el apellido del Usuario.");
		frm.apellido.focus();
	}else if(esVacio(frm.identificacion.value)){
		alert("Debe ingresar la identificacion del Usuario.");
		frm.identificacion.focus();	
	}else if(!esNumero(frm.identificacion.value)){	
		alert("El valor de este campo debe ser tipo numerico.");
		frm.identificacion.focus();
	}else if(esVacio(frm.usuario.value)){
		alert("Debe ingresar El nombre de Usuario.");
		frm.usuario.focus();
	}else if(esVacio(frm.perfil.value)){
		alert("Debe selecionar un rol para el Usuario.");
		frm.perfil.select();				
	}else if(!esVacio(frm.contrasenanueva.value)){
			if(!esContrasenaValida(frm.contrasenanueva.value)){
				alert("Uno o mas caracteres ingresados no son válidos");
				frm.contrasenanueva.select();
			}else if(esVacio(frm.contrasenaconfir.value)){	
				alert("Confirme la nueva contraseña.");
				frm.contrasenaconfir.select();
			}else if(!esContrasenaValida(frm.contrasenaconfir.value)){
				alert("Uno o mas caracteres ingresados no son válidos");
				frm.contrasenaconfir.select();
			}else if(frm.contrasenanueva.value!=frm.contrasenaconfir.value){
				alert("La contraseña nueva y su confirmación no coinciden");
				frm.contrasenaconfir.select();
			}else{
				frm.action="usuarios_agre.jsp?ac=insert";
				frm.submit();
			}
			
	}else{
		frm.action="usuarios_agre.jsp?ac=insert";
		frm.submit();
	}
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
<style>
.notification div {
                line-height: 1.7em;
}
</style>
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
  <h1>Nuevo Usuario</h1>
  <p></p>
     <div id="msgBox_info" class="notification information png_bg">
					<div>
                   Cuando se crea el usuario se le asigna por defecto una contrase&ntilde;a. <br/> Si desea cambiarla dar click en la opci&oacute;n cambiar contrase&ntilde;a.</div>
				</div>

  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:552px">
 <input name="" type="button" class="botones" value=" Atras " onclick="window.location='usuarios.jsp'"></div>  
  <table width="500" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" >
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td colspan="2"  align="center" class="text_blanco" >Datos Usuario                             </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td   height="20" align="center" class="text_negro" >Nombre </td>
                          <td width="50%"    height="20"  align="center" class="text_negro" >Apellido</td>
                        </tr>
                     
                        <tr class="fondo_celda_5">
                          <td   align="center"> 
                          <input type="text" name="nombre" class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" ></td>
                          <td height="20"  align="center"><input type="text" name="apellido" size="30"  class="text_file" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro">Identificacion</td>
                          <td height="20"  align="center" class="text_negro">Activo</td>
                          </tr>
                        <tr class="fondo_celda_5">
                          <td height="20"   align="center"><input  type="text" name="identificacion"  class="text_file" size="20" ></td>
                          <td height="20"  align="center" class="text_negro"><label>
                            <input type="radio" name="activo" value="1" checked="checked">
                            Activar</label><label>
                              <input type="radio" name="activo" value="0">
                              Desactivar</label>  </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro">Nombre de Usuario</td>
                          <td height="20"  align="center" class="text_negro">Contrase&ntilde;a Por Defecto</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td height="20"   align="center"><input type="text" name="usuario" size="30"  class="text_file" onchange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" /></td>
                          <td height="20"  align="center" class="text_negro"><input type="hidden" name="contradefecto" size="30"  class="text_file" value="consultorio" />
                            consultorio</td>
                          </tr>
                        <tr class="fondo_celda_2 text_negro">
                          <td height="20" colspan="2"   align="center">Asignar Perfil</td>
                          </tr>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="2"   align="center">  <select name="perfil" id="select" class="combos">
     <option value="">Seleccione...</option>
                           <% 	
									Conex conrol = new Conex();
									ResultSet  res = conrol.consultar("select * from rol ");	
									int cont = conrol.contar(res);
									String[][] opera = new String[cont][2];
									res.beforeFirst();
									if(cont!=0){ 
									res.next();
										for(int i=0;i<cont;i++)
										{
											opera[i][0]=res.getString("roldescripcion");											
											opera[i][1]=res.getString("rolid");
											res.next();%>
							       
                                
								  <option value="<%=opera[i][1]%>"><%=opera[i][0]%></option>
							           <%}}%>
						             
                        </select></td>
                        </tr>
                     
                        <tr   class="fondo_celda_1 text_blanco" >
                          <td   height="20" colspan="3" align="left" ><input name="Op2" id="Op2"  type="checkbox"  onclick="javascript:MostrarFilas('Op','Op2')" >
                            <input  type="checkbox" name="Op" id="Op"  onclick="javascript:OcultarFilas('Op','Op2')"  style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;Cambiar Cotrase&ntilde;a</td>
                        </tr>
                        <tr   class="fondo_celda_2 text_negro" name="Op" id="Op"  style="display:none">
                          <td   height="20" align="center" >Cotrase&ntilde;a Nueva</td>
                          <td   height="20" align="center" >Confirmar Cotrase&ntilde;a</td>
                        </tr>
                        <tr   class="fondo_celda_5" name="Op" id="Op" style="display:none" >
                          <td   height="20" align="center" ><span class="text_negro">
                            <input  type="password" name="contrasenanueva" size="30"  class="text_file" value=""/>
                          </span></td>
                          <td   height="20" align="center" ><span class="text_negro">
                            <input type="password" name="contrasenaconfir" size="30"  class="text_file" value=""  />
                          </span></td>
                        </tr>
                      
                      </table>
                      
					</td>
                  </tr>
                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3" >
                     <input type="button" class="botones"  value=" Registrar " onclick="javascript:registrar(document.forms['form1']);">                
                  
                     
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
<%if(contt>0){%>
<script>
alert("El usuario ya existe");
</script>
<%}%>
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
