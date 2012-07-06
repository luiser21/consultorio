<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='../login.jsp';
</script>
<%
} 
try{
Conex con = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div align="center"><br/>
<table border="0" align="center" cellpadding="2" cellspacing="0" class="fondo_tabla" width="248">
					<form name="form1" method="post">
					  <tr>  
						<td width="244" height="17" valign="top"> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<tr class="fondo_celda_1"> 
							  <td height="5" colspan="2" align="center" class="text_blanco"> Radicados que Faltan por <br/> 
						     Asignar Estudiante </td>
							</tr>
							<tr> 
							  <td height="27" colspan="2" align="center" valign="top"> 
								<table width="100%" border="0" cellspacing="1" cellpadding="2">
						
								   <tr align="center" valign="middle"> 
									 <td width="100%" height="20" class="text_negro"> 
									   <%
							boolean aux=true;					
							
							ResultSet  rs = con.consultar("SELECT personacaso.perradicado as radicado, personacaso.perid as perid, personacaso.estuid as estuid FROM personacaso where personacaso.perid='"+periodo+"' and personacaso.estuid is null order by personacaso.perradicado asc ");	
							int cont = con.contar(rs);
							String[][] opes = new String[cont][4];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getString("radicado");
									opes[i][1]=rs.getString("perid");
									opes[i][2]=rs.getString("estuid");
									rs.next();
								
							
							%>
							<%=opes[i][0]%> -								
					  <%}					  
					  }else{%>
					  Los Radicados Tienen Abogado Asignado					  
					 <%}%></td>
                     </tr>					
						</table></td>
							</tr>
							<tr class="fondo_celda_2">
							  <td width="75%" height="20" align="right" class="text_negro" >Total:&nbsp;</td>
							  <td width="25%" align="center"  class="text_negro"><%=cont%></td>
					      </tr>
							<%
							con.close();
							
							%>
					    </table></td>
					  </tr>
					  </form>
					</table>
</div>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp?w=1");
}%>