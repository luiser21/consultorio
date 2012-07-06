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

String Nombres=String.valueOf(request.getParameter("Nombres"));
String Apellidos=String.valueOf(request.getParameter("Apellidos"));
String documentoIdentidad=String.valueOf(request.getParameter("documentoIdentidad"));
String direccion=String.valueOf(request.getParameter("direccion"));
String email=String.valueOf(request.getParameter("email"));
String celular=String.valueOf(request.getParameter("celular"));

if(!Nombres.equals("null"))
{

ResultSet  rs2 = con.consultar("select * from usuario u, persona p where u.perid=p.perid and u.usulogin='"+sesion+"'");
rs2.next();

	String actualiza = "update persona set pernombre='"+Nombres+"',perapellido='"+Apellidos+"', perdocumento='"+documentoIdentidad+"', perdireccion='"+direccion+"',percorreo='"+email+"',pertelefono='"+celular+"' where perid='"+rs2.getString("perid")+"'";
	con.actualizar(actualiza);
	response.sendRedirect("misdatos_modMsg.jsp");
}

 
ResultSet  rs = con.consultar("select * from persona p, usuario u where p.perid=u.perid and u.usulogin='"+sesion+"'");
rs.next();
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
<script language="javascript">
function registrar(frm){
	if(esVacio(frm.Nombres.value)){	
		alert("Debe ingresar los nombres.");
		frm.Nombres.select();	
	}else if(esVacio(frm.Apellidos.value)){	
		alert("Debe ingresar los apellidos.");
		frm.Apellidos.select();	
	}else if(esVacio(frm.documentoIdentidad.value)){	
		alert("Debe ingresar el documento de identidad.");
		frm.documentoIdentidad.select();
	}else if(!esNumero(frm.documentoIdentidad.value)){	
		alert("El documento de identidad es tipo numérico.");
		frm.documentoIdentidad.select();
	}else if(!esVacio(frm.email.value)){
			if(!validarEmail(frm.email.value)){	
			alert("El email que intenta ingresar es invalido, debe llevar @ y el servidor de correo");
			frm.email.select();
			}else if(esVacio(frm.celular.value)){	
				alert("Debe ingresar el numero del telefono celular.");
				frm.celular.select();
			}else if(!esNumero(frm.celular.value)){	
				alert("El valor de este campo debe ser tipo numérico.");
				frm.celular.select();	
			}else if(confirm ("¿Está seguro de actualizar el registro?")){
			  frm.action = "misdatosMsg.jsp";
			  frm.submit();
			}	
			
	}else if(esVacio(frm.celular.value)){	
		alert("Debe ingresar el numero del telefono celular.");
		frm.celular.select();
	}else if(!esNumero(frm.celular.value)){	
		alert("El valor de este campo debe ser tipo numérico.");
		frm.celular.select();	
	}else if(confirm ("¿Está seguro de actualizar el registro?")){
		frm.action = "misdatosMsg.jsp";
		frm.submit();
	}	
	
}
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
  <h1>Datos Personales</h1>
  <p></p> <br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">  
<div style="width:553px"  align="right"> 
 <input name="" type="button" class="botones" value=" Atras " onclick="window.location='misdatos.jsp'">
<input name="" type="button" class="botones" value=" Modificar " onclick="javascript:registrar(document.forms['form1']);"></div>
 <table width="500" border="0" align="center" cellpadding="0" cellspacing="1" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">                      <table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="ffffff">
                      <tr class="fondo_celda_1">
                        <td height="20" colspan="6" align="center" class="text_blanco">Datos Personales</td>
                      </tr>
                     
                      <tr class="fondo_celda_2">
                        <td width="25%" align="center" class="text_negro"> Nombres</td>
                        <td width="25%" align="center" class="text_negro">Apellidos</td>
                       
                      </tr >
                      <tr align="center" class="fondo_celda_5">
                        <td width="25%" class="text_negro"><input name="Nombres" maxlength="50"  type="text" class="text_file" size="25" value="<%=rs.getString("pernombre")%>"></td><td width="25%" class="text_negro"><input  name="Apellidos" maxlength="50"  type="text" class="text_file" size="25" value="<%=rs.getString("perapellido")%>"></td>						
                      </tr>
                      <tr class="fondo_celda_2">
                        <td width="25%" align="center" class="text_negro">
                        
                        Documento de Identidad</td>
                        <td width="25%" align="center" class="text_negro">Correo Electr&oacute;nico</td>
                      </tr>
                      <tr align="center" class="fondo_celda_5">
                        <td width="25%" class="text_negro"><input  name="documentoIdentidad" maxlength="50"  type="text" class="text_file" size="20" value="<%=rs.getString("perdocumento")%>"></td><td width="25%" class="text_negro"><input  name="email" maxlength="50"  type="text" class="text_file" size="40" value="<%=rs.getString("percorreo")%>"></td></tr>
                      <tr class="fondo_celda_2">
                        <td height="18" align="center" class="text_negro" colspan="2">Datos de Ubicaci&oacute;n</td>
                      </tr>
                      <tr class="fondo_celda_4">
                        <td width="50%" align="center" class="text_negro">Direcci&oacute;n</td>
                        <td width="50%" align="center" class="text_negro">Celular</td>
						
                      </tr>
                      <tr align="center" class="fondo_celda_5">
                        <td width="50%" class="text_negro"><input  name="direccion"  type="text" class="text_file" size="30" value="<%=rs.getString("perdireccion")%>"></td>
                        <td width="50%" class="text_negro"><input  name="celular" maxlength="20" type="text" class="text_file" size="20" value="<%=rs.getString("pertelefono")%>"></td></tr>                      
                    </table></td>
                  </tr>
              
                </table>
                
  
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