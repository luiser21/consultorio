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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">

<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function eliminar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Area.");
	}else if(confirm("¿Está  seguro de Eliminar el Area?.")){
		frm.action="areaelim.jsp";
		frm.submit();
		}
}
function modificar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Area.");
	}else{
		frm.action="areamod.jsp";
		frm.submit();
		}
}
function agregar(frm){
		frm.action="areaagre.jsp";
		frm.submit();
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
  <h1>Areas </h1>
  <p></p>
  <div id="texto_contenido">
 
<form name="form1" method="post">
  
 
  
  <table width="350" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Listado de Areas</td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td width="5%" height="20"  align="center" class="text_negro"></td>
                          <td align="center" class="text_negro">Tipo de Areas </td>                          
                          </tr>
                        <% 	
							boolean aux=true;
							
							Conex con2 = new Conex();
							 
							ResultSet  rs = con.consultar("select * from area order by nombrearea asc");	
							int cont = con.contar(rs);
							String[][] opes = new String[cont][3];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									
									opes[i][0]=rs.getString("nombrearea");
									rs.next();
								}
								
							
							
								
							  int color = 1;
							  String fondo = null;
							 for(int i=0;i<cont;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>">
                          <td width="5%" height="20" align="center">
                            <input type="radio" name="nombre" value="<%= opes[i][0] %>"/>                          </td>
                          <td height="20" class="text_negro"> <div align="center"><%= opes[i][0] %> </div></td>                          
                          </tr>
                        <%}
					}else{
					aux=false;
				 %>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="6">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table></td>
                  </tr>
                  <%if(aux){%>
                  <tr> 
                    <td height="17" align="right" valign="top" class="fondo_celda_3">					
					<input name="" type="button" class="botones" value=" Modificar " onclick="javascript:modificar(document.forms['form1']);">
					<input name="" type="button" class="botones" value=" Eliminar " onclick="javascript:eliminar(document.forms['form1']);">
					<input name="" type="button" class="botones" value=" Agregar " onclick="javascript:agregar(document.forms['form1']);"> </td>
					
                  </tr>
                  <%}else{%>
				  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3"><input name="" type="button" class="botones" value=" Agregar " onclick="javascript:agregar(document.forms['form1']);"> </td>
					
                  </tr>
				  <%}%>
                </table>
  
  
  
  
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  
  
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
