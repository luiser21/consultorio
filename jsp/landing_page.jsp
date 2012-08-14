<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
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
<body>
<div >
<table summary="Universidad de Pamplona" border="0" cellpadding="0" cellspacing="0" width="960" align="center">
	<tr> 
 		<td>
			<jsp:include page="header.jsp" />
		</td> 
	</tr> 
 	<tr> 
    	<td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%"> 
                 <tr> 
                    <td width="260" height="450" align="left" valign="top" bgcolor="#ffffff">
                        <jsp:include page="menu.jsp" />
                    </td>
                    <td bgcolor="#ffffff" valign="top" width="300px"  align="left"> 
                        <div id="pagina_contenido">
                           <div class="actualizacion">Actualizado: <span>07/04/2012 10:27 AM</span></div><br/><br/><br/><br/>
                                <jsp:include page="slider_imagen_menu_admin.jsp" />    <br/><br/>  <br/><br/>                          
                       </div>                     
                    </td> 
                  </tr> 
            </table>
        </td> 
 	</tr> 
         <tr> 
             <td height="2"> 
               <div id="footer"></div>
              </td>
         </tr>  
	</tbody>
</table>
</div>
<jsp:include page="botoom.jsp" />
</body></html>
