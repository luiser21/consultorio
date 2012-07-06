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
int semestre=0;
boolean flag=false;
if(!(String.valueOf(request.getParameter("semestre"))).equals("null")){
semestre=Integer.valueOf(String.valueOf(request.getParameter("semestre"))).intValue();}
String ano=String.valueOf(request.getParameter("ano"));
String fecha=String.valueOf(request.getParameter("fecha"));
String consulta = "select * from periodo where persemestre='"+semestre+"' and perano='"+ano+"'";		
ResultSet rs = con.consultar(consulta);	
if(!(con.contar(rs)>0)){	
	String actualiza = "insert into periodo values('"+semestre+ano+"','"+semestre+"','"+ano+"','"+fecha+"')";
	con.actualizar(actualiza);
}
else{
		flag=true;
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
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function volver(frm){
		frm.action="periodo.jsp";
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
  <h1>Nuevo Periodo</h1>
  <p></p><br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:477px">
 <input name="" type="button" class="botones" value=" Atras " onclick="javascript:volver(document.forms['form1']);"></div>  
  <table width="350" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Datos Nuevo Periodo </td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td width="100%" height="20" align="center" class="text_negro" colspan="2"><br/><div align="center"> <%if(flag){%>
                          
                         <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo realizar el proceso. El periodo ya se encuentra registrado 
                          <%}else{%>
                      
                             <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El proceso se realiz&oacute; satisfactoriamente. 
                          <%}%> </div><br/></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>  <p>&nbsp;</p>   <p>&nbsp;</p>   <p>&nbsp;</p> 
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
