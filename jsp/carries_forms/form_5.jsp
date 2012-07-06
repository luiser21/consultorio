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
String id=String.valueOf(request.getParameter("id")); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function redireccionar(objeto){
	window.parent.location=objeto.value;
}
</script>
</head>
<body>
  <p align="center" style="color: #003366;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;">Seleccione el  Periodo<br/>
  </p><div align="center">
<table width="200" border="0" cellpadding="0" cellspacing="1"  class="fondo_tabla">
                        <tr  class="fondo_celda_1">
                          <td colspan="8" align="center" class="text_blanco">Listado de Periodos </td>
                        </tr>
                        <% 	boolean aux=true;							
							Conex con= new Conex();							
							ResultSet  rs = con.consultar("select * from periodo order by perfecha desc");						int cont = con.contar(rs);
							String[][] opes = new String[cont][4];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getString("perid");
									opes[i][1]=rs.getString("persemestre");
									opes[i][2]=rs.getString("perano");
									rs.next();
								}
							%>
                        <tr  class="fondo_celda_5">                        
                          <td height="20" colspan="4" align="center"> <div align="center">
                      <select name="" onChange="redireccionar(this)"  class="combos">
                      <option>Seleccione...</option>
					  <%for(int i=0;i<cont;i++){	
							if(id.equals("3")){%>
           <option value="../estudiantes_asignados_temp.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
                          <%}if(id.equals("4")){%>
           <option value="../estudiantes_prueba.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
						<%}if(id.equals("5")){%>
           <option value="../estudiantes_recepciona_prueba.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
           				<%}if(id.equals("6")){%>
           <option value="../abogadoasig.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
						<%}if(id.equals("7")){%>
           <option value="../casos.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
          				 <%}if(id.equals("8")){%>
           <option value="../buscar_todos.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
         				<%}if(id.equals("1")){%>
           <option value="../totalperiodo.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
           				<%}if(id.equals("2")){%>
           <option value="../estadistica.jsp?periodo=<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
           				<%}}%>
                          </select>
                           </div>
                          </td>
                        </tr>                        
                        <%	}else{
					aux=false;	 %>
         <tr align="center" class="fondo_celda_5">
            <td height="20" class="text_negro" colspan="8">No se encontraron registros.</td>
              </tr> <%}%>                        
      </table>
  </div>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp?w=1");
}%>