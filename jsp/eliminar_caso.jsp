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
Conex con3 = new Conex();
Conex con4 = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String[] codigo=request.getParameterValues("cc");
String actualiza=null;
String consulta2=null;
String actualiza2=null;
int seq=0;
String var="";
String[][] opes = new String[codigo.length][3];
if(!codigo.equals("null")){	
	seq=1;
	for (int i = 0; i < codigo.length;i++) {		
	    //actualiza = "delete from personacaso where perradicado='"+codigo[i]+"'";
		//con.actualizar(actualiza);		
		var=var+codigo[i]+" ";	
		consulta2 = "select * from personacaso where perradicado='"+codigo[i]+"'";		
		ResultSet  rs2= con4.consultar(consulta2);
		rs2.next();			
		opes[i][1]=rs2.getString("perarea");
		opes[i][0]=rs2.getString("estuid");
		opes[i][2]=rs2.getString("perradicado");
		
	}
	for (int i = 0; i < codigo.length;i++) {		
		actualiza2 = "update asignacion set casos=casos-1 where estudiante='"+opes[i][0]+"' and area='"+opes[i][1]+"' and periodo='"+periodo+"'";
		con3.actualizar(actualiza2);
		
		actualiza = "delete from personacaso where perradicado='"+opes[i][2]+"'";
		con.actualizar(actualiza);
		
		
	}	
	con3.close();
	con4.close();
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
		frm.action="casos.jsp";
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
   <h1>Agregar Nuevo Abogado en Formacion / Periodo: <%=periodo%></h1>
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
                          <td height="20" colspan="6" align="center" class="text_blanco">Datos Estudiante <input name="periodo"  type="hidden"  value="<%=periodo%>" ></td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td width="100%" height="20" align="center" class="text_negro" colspan="2"><br/><div align="center">  <% 
						  if(seq==1){ %>                          
                          <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El proceso se realiz&oacute; satisfactoriamente. <br/>Los Radicado <br/><br/> <%=var%> <br/><br/> Fueron Eliminados<br/> 
                  
					  <%}if(seq==0){%>
                          <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo realizar el proceso<br/>
                       <%}%></div></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
    <p>&nbsp;</p>   <p>&nbsp;</p>   
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