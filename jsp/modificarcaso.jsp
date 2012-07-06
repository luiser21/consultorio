<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
String periodo=String.valueOf(request.getParameter("periodo"));
String radicado=String.valueOf(request.getParameter("cc"));
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
</head>
<body onload="mueveReloj()">
<div id="content" align="left">
        <jsp:include page="header.jsp" />
    	<div style=" margin-top:-50px">     
        	<div style="float:left; width:230px"> 
            	<jsp:include page="menu.jsp" />
            </div>  
 			<div id="pagina_contenido2">
  				<div class="actualizacion">Administrador - Consultorio</div>
 					 <h1 style="color: #003366;  font-size: 20px;">Actualizar Radicado / Periodo: <%=periodo%></h1>
 					 <p></p>  
 				 <div >
   					 <jsp:include page="caso_mod.jsp">    
					 <jsp:param name="periodo" value="<%=periodo%>" />
                     <jsp:param name="radicado" value="<%=radicado%>" />
					</jsp:include>
  				</div>
			</div>  
 			<div style="clear:both"></div>
  
  		</div>  
       <div id="footer"></div>
</div>
<jsp:include page="botoom.jsp" />
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>