<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
Conex con = new Conex();
Conex conarea = new Conex();
boolean flag=false;
String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));
String apellido=String.valueOf(request.getParameter("apellido"));
String nombre=String.valueOf(request.getParameter("nombre"));
String identificacion=String.valueOf(request.getParameter("identificacion"));
String activo=String.valueOf(request.getParameter("activo"));
String observacion=String.valueOf(request.getParameter("observacion"));
String reparto=String.valueOf(request.getParameter("reparto"));
String[] area = request.getParameterValues("area"); 
String codigoarea=String.valueOf(request.getParameter("codigoarea"));
String repar=reparto;
int contador=Integer.parseInt(codigoarea);
if(!codigo.equals("null"))
{
	String consulta = "select * from estudiantes where identificacion='"+identificacion+"' and perid='"+periodo+"'";		
	ResultSet rs = con.consultar(consulta);	
	if(!(con.contar(rs)>0)){		
 		String actualiza = "insert into estudiantes ( estuid, identificacion, nombre, apellido, activo, observacion, reparto, perid) values('"+codigo+"','"+identificacion+"','"+nombre+"','"+apellido+"','"+activo+"','"+observacion+"','"+reparto+"','"+periodo+"')";
		con.actualizar(actualiza);	
		if(repar.equals("SI")){				
			for (int i = 0; i < area.length;i++) {			
				String insertar = "insert into asignacion (codigo, estudiante, area, periodo) values('"+contador+"', '"+codigo+"', '"+area[i]+"', '"+periodo+"')";				
				conarea.actualizar(insertar);
				 contador=contador+1;
			}
		}
		con.close();
		conarea.close();		
	}else{
		flag=true;
	}
}
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
function volver(frm){
		frm.action="abogadoasig.jsp";
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
    <h1>Nuevo Abogado en Formacion / Periodo: <%=periodo%></h1>
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
                          <td height="20" colspan="6" align="center" class="text_blanco">Datos Estudiante en Formacion  <input name="periodo"  type="hidden"  value="<%=periodo%>" ></td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td width="100%" height="20" align="center" class="text_negro" colspan="2"><br/><div align="center"> <%if(flag){%>
                          
                         <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo realizar el proceso. La Identificacion del estudiante ya se encuentra registrado 
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
<%}catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		if(session.getAttribute("roles")!=null){			
			if(!rol.equals("Admin")){
				 response.sendRedirect("ilegal.jsp");
			}else{
				response.sendRedirect("error_fatal.jsp");
			}
		}				
}%>