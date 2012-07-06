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

 

String nueva=String.valueOf(request.getParameter("contrasenaNueva"));

if(!nueva.equals("null"))
{
	String actualiza = "update usuario set usupassword='"+nueva+"' where usulogin='"+sesion+"'";
	con.actualizar(actualiza);
	response.sendRedirect("cambiopassMsg.jsp");
}

String consulta = "select * from rolxusuario rx, rol r, usuario u where r.rolnombre='Admin' and u.usulogin='"+sesion+"'";		
ResultSet rs = con.consultar(consulta);
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


<script language="JavaScript">
var enviar = 0;
function validar(frm){
	if(esVacio(frm.contrasenaActual.value)){	
		alert("Debe ingresar la contraseña actual.");
		frm.contrasenaActual.select();
	}else if(!esContrasenaValida(frm.contrasenaActual.value)){
		alert("Uno o mas caracteres ingresados no son válidos.");
		frm.contrasenaActual.select();
	}else if(frm.sClave.value!=frm.contrasenaActual.value){
	alert("La contraseña actual no coincide con la del usuario logueado.");
	frm.contrasenaActual.select();
	}else if(esVacio(frm.contrasenaNueva.value)){	
		alert("Debe ingresar la nueva contraseña.");
		frm.contrasenaNueva.select();
	}else if(!esContrasenaValida(frm.contrasenaNueva.value)){
		alert("Uno o mas caracteres ingresados no son válidos");
		frm.contrasenaNueva.select();
	}else if(esVacio(frm.contrasenaNuevaDos.value)){	
		alert("Confirme la nueva contraseña.");
		frm.contrasenaNuevaDos.select();
	}else if(!esContrasenaValida(frm.contrasenaNuevaDos.value)){
		alert("Uno o mas caracteres ingresados no son válidos");
		frm.contrasenaNuevaDos.select();
	}else if(frm.contrasenaNueva.value!=frm.contrasenaNuevaDos.value){
		alert("La contraseña nueva y su confirmación no coinciden");
		frm.contrasenaNuevaDos.select();
	}else if(enviar==0 && confirm("¿Está seguro de cambiar la contraseña?")){
		enviar = 1;
		frm.action="cambiopass.jsp"
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
  <h1>Cambiar Contrase&ntilde;a</h1>
  <p></p><br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <input type="hidden" name="sClave" value="<%=rs.getString("usupassword")%>"> 
  
  <table width="350" border="0" align="center" cellpadding="0" cellspacing="1" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Datos Contrase&ntilde;a</td>
                        </tr>
						<tr class="fondo_celda_2">
                          <td width="49%" height="20" align="center" class="text_negro" colspan="2">Contrase&ntilde;a Actual</td>
                          
                        </tr>
                        <tr class="fondo_celda_5">
                          <td align="center" class="text_negro" colspan="2">
                            <input name="contrasenaActual" type="password" maxlength="30" class="text_file" size="20" onFocus="javascript:prender();" onBlur="javascript:apagar();">
                          </td>
                          
                        </tr>
                        <tr class="fondo_celda_2">
                          <td width="49%" height="20" align="center" class="text_negro">Nueva Contrase&ntilde;a</td>
                          <td width="51%" align="center" class="text_negro">Confirmar Nueva Contrase&ntilde;a</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td align="center" class="text_negro">
                            <input name="contrasenaNueva" type="password" maxlength="30" class="text_file" size="20" onFocus="javascript:prender();" onBlur="javascript:apagar();">
                          </td>
                          <td align="center" class="text_negro">
                            <input name="contrasenaNuevaDos" type="password" maxlength="30" class="text_file" size="20" onFocus="javascript:prender();" onBlur="javascript:apagar();"></td>
                        </tr>
                    </table></td>
                  </tr>                 
                </table> 
                <div style="width:478px"  align="right"> <input name="" type="button" class="botones" value=" Modificar " onclick="javascript:validar(document.forms['form1']);"></div>
  
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>   <p>&nbsp;</p>   <p>&nbsp;</p> <p>&nbsp;</p>   <p>&nbsp;</p> 
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