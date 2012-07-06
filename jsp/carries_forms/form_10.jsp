<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");

if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='../login.jsp';
</script>
<%
} 
try{
Conex con = new Conex();
Conex con3 = new Conex();
Conex con2 = new Conex();
Conex con4 = new Conex();

String usuario=String.valueOf(request.getParameter("usuario")); ///codigo
String dep=String.valueOf(request.getParameter("dep"));

String nombre=String.valueOf(request.getParameter("nombre"));
String apellido=String.valueOf(request.getParameter("apellido"));
String usulogin=String.valueOf(request.getParameter("usulogin"));
String contrasena=String.valueOf(request.getParameter("contrasena"));
String perfil=String.valueOf(request.getParameter("perfil"));
String perfilviejo=String.valueOf(request.getParameter("perfilviejo"));

ResultSet  rs=null;
String consulta = "SELECT usuario.usuestado, usuario.perid, usuario.usulogin, usuario.usupassword, rol.roldescripcion, rol.rolid, persona.pernombre, persona.perapellido, persona.percorreo FROM usuario Inner Join rolxusuario ON usuario.perid =rolxusuario.perid Inner Join rol ON rol.rolid = rolxusuario.rolid Inner Join persona ON usuario.perid =persona.perid  where usuario.perid='"+usuario+"'";		
rs = con.consultar(consulta);
rs.next();
	

String es=String.valueOf(request.getParameter("es"));
if(es.equals("modificar")){							
		
		String actualiza2 = "update usuario set usulogin='"+usulogin+"', usupassword='"+contrasena+"'  where  perid='"+usuario+"'";
		con3.actualizar(actualiza2);
		con3.close();
		
		String actualiza = "update rolxusuario set rolid='"+perfil+"' where perid='"+usuario+"' and rolid='"+perfilviejo+"'";
		con2.actualizar(actualiza);	
		con2.close();
		
		String actualiza3 = "update persona set pernombre='"+nombre+"', perapellido='"+apellido+"' where perid='"+usuario+"'";
		con4.actualizar(actualiza3);	
		con4.close();
		%>
			<script>
window.parent.location='../usuarios.jsp?dep=<%=dep%>';
			</script>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
<link href="../images/estilo.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="../jScripts/validaciones.js"></script>
<script language="JavaScript">
function modificar(frm){	
	if(esVacio(frm.nombre.value)){	
		alert("Debe ingresar el Nombre.");
		frm.nombre.focus();	
	}else if(esVacio(frm.apellido.value)){	
		alert("Debe ingresar el Apellido.");
		frm.apellido.focus();			
	}else if(esVacio(frm.usulogin.value)){	
		alert("El Ingresar el nombre de Usuario.");
		frm.usulogin.focus();		
	}else if(esVacio(frm.contrasena.value)){	
		alert("Debe ingresar el Password.");
		frm.contrasena.focus();
	}else{
		frm.action="form_10.jsp?es=modificar";
		frm.submit();
	}
}

</script>
<style>
.notification div {
                line-height: 1.5em;
				
}
</style>
<body  style="background-color:#FFFFFF" >
<div  id="pagina_contenido" >
<h1 style="font-size:16px" align="center"> Usuario</h1>

<br/>

<form name="form1" method="post" >
 <input name="usuario"  type="hidden"  value="<%=usuario%>" />
 <input name="dep"  type="hidden"  value="<%=dep%>" />
  <input name="perfilviejo"  type="hidden"  value="<%=rs.getString("rolid")%>" />
  <div  style="width:366px"  align="right">
    <input name="submit3"  type="button" class="botones"   onClick="javascript:modificar(document.forms['form1']);" value="Modificar"></div>
 <table width="100%" border="0" cellpadding="1" cellspacing="0" >
                   
                     
                      <tr class="fondo_celda_1">
                        <td align="center"  colspan="2"class="text_negro"><span class="text_blanco">Datos Personales</span></td>
                      </tr >
                      <tr class="fondo_celda_2">
                        <td width="53%" align="center"  colspan=""class="text_negro"> Nombres</td>
                        <td width="47%" align="center" class="text_negro">Apellidos</td>
                      </tr >
                      <tr align="center" class="fondo_celda_5">
                        <td width="53%" class="text_negro"><input name="nombre" maxlength="50"  type="text" class="text_file" size="25" value="<%=rs.getString("pernombre")%>"></td><td width="47%" class="text_negro"><input  name="apellido" maxlength="50"  type="text" class="text_file" size="25" value="<%=rs.getString("perapellido")%>"></td><td width="0%" colspan="2" rowspan="6">&nbsp;</td>						
                      </tr>
                      <tr class="fondo_celda_2">
                        <td width="53%" align="center" class="text_negro">
                        
                        Usuario</td>
                        <td width="47%" align="center" class="text_negro">Contrase&ntilde;a</td>
                      </tr>
                      <tr align="center" class="fondo_celda_5">
                        <td width="53%" class="text_negro"><input  name="usulogin" maxlength="50"  type="text" class="text_file" size="20" value="<%=rs.getString("usulogin")%>"></td><td width="47%" class="text_negro"><input  name="contrasena" maxlength="50"  type="password" class="text_file" size="20" value="<%=rs.getString("usupassword")%>"></td></tr>
                      <tr class="fondo_celda_2">
                        <td height="18" align="center" class="text_negro" colspan="2">Perfil</td>
                      </tr>
                     
                      <tr align="center" class="fondo_celda_5">
                        <td colspan="2" class="text_negro">
                          <select name="perfil" id="select" class="combos">
                          <option value="<%=rs.getString("rolid")%>"><%=rs.getString("roldescripcion")%></option>
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
                    </table>
</form>
</div>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp");
}%>