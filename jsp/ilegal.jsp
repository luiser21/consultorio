<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<link rel="shortcut icon" href="img/favicon.ico">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css"></head>
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
            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100px"> 
                 <tr> 
                    <td height="450" align="left" valign="top" bgcolor="#ffffff">
                      <div id="pagina_contenido">
                        <div class="actualizacion">Actualizado: <span>07/04/2012 10:27 AM</span></div>
                        <div id="texto_contenido">
                         <br/><br/><br/><br/><br/><br/><br/>
                          <table width="450" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >
    
          <table width="450" border="0" cellpadding="1" cellspacing="0" >
  <tr class="fondo_celda_1">
    <td colspan="2" height="20" class="text_blanco"  align="center">Se ha generado un Error</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td width="79"><img src="images/bloque.png" width="60" height="60" /></td>
    <td width="367" class="text_negro">Usted está intentando entrar ilegalmente al sistema.</td>
  </tr>
</table>
    
    </td>
  </tr>
  </table>
          <br/><br/><br/><br/><br/> <br/><br/><br/><br/>         
                          </div>
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
</table>
</div>
<jsp:include page="botoom.jsp" />
</body>
</html>