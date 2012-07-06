<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
String error=(String)session.getAttribute("error");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<link rel="shortcut icon" href="img/favicon.ico">
<link href="images/estilo.css" rel="stylesheet" type="text/css"><link href="css/estilo.css" rel="stylesheet" type="text/css"></head>
<body>
<div id="content">
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
                    <td bgcolor="#ffffff" valign="top" width="700"  align="left"> 
             <div id="pagina_contenido">
                   <div class="actualizacion">Actualizado: <span>07/04/2012 10:27 AM</span></div> <br/><br/><br/><br/><br/>
<table width="450" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right"><input name="" type="button" class="botones" value=" Volver" onclick='history.go(-1)'></td>
  </tr>
</table>
<br/>
                 <table width="450" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >    
          <table width="450" border="0" cellpadding="1" cellspacing="0" >
  <tr class="fondo_celda_1">
    <td colspan="2" class="text_blanco"   height="20" align="center">Mensaje de Error !!!</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td width="107"><img src="img/warning.png" width="60" height="50" /></td>
    <td width="339" class="text_negro" align="left"> <br/>Se ha generado una excepción no controlada durante la ejecución de la solicitud web actual <br/><br/><%  out.print("Error:  "+error+"<br/>");  %><br/></td>
  </tr>
</table>    
    </td>
  </tr>
  </table> 
         <br/><br/><br/><br/><br/><br/><br/><br/><br/> </div>             </td> 
                  </tr> 
            </table>
        </td> 
 	</tr> 
         <tr> 
             <td height="2"> 
               <div id="footer"></div></td> 
</tr>  
	</tbody></table>
</div>
<jsp:include page="botoom.jsp" />
</body>
</html>