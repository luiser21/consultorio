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

Conex con = new Conex();
ResultSet  rs_contar=null;						  
String consulta_contar = "select count(*) as areas from area";
rs_contar = con.consultar(consulta_contar);
rs_contar.next();		
String numero_area=rs_contar.getString("areas");
int contar_area=Integer.parseInt(numero_area);
	
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
 					 <h1 style="color: #003366;  font-size: 20px;">Nuevo Radicado / Periodo: <%=periodo%></h1>
 					 <p></p>  
 				 <div >
                <% if(contar_area==0){	%>	
               			  <br/><br/><br/><br/>
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
                            <td colspan="2" class="text_blanco"   height="20" align="center">Mensaje de Alerta!!!</td>
                            </tr>
                          <tr class="fondo_celda_2" height="20" align="center">
                            <td width="107"><img src="img/info.png" width="32" height="32" /></td>
                            <td width="339" class="text_negro" align="left"> <br/>No se ha detectado ninguna area del derecho registrada. <br/>Por favor registrelas para poder ingresar los radicados <br/> <br/></td>
                          </tr>
                        </table>    
                            </td>
                          </tr>
                          </table><br/><br/><br/><br/><br/><br/><br/><br/>
           <% }else{	%>	    
                 
   					 <jsp:include page="casoagre.jsp">    
					 <jsp:param name="periodo" value="<%=periodo%>" />
					</jsp:include>
            <%}%>        
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