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
Conex conper = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
ResultSet  per=null;
 String consultaper = "select * from periodo where perid='"+periodo+"'";		
			per = conper.consultar(consultaper);
			per.next();	
			int semestre=per.getInt("persemestre");
			int ano=per.getInt("perano");
			
response.setContentType ("application/vnd.ms-excel"); //Tipo de fichero.
response.setHeader ("Content-Disposition", "attachment;filename=\"abogados_activos_excel_"+periodo+".xls\"");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body >
<br/><div align="center">
<p>UNIVERSIDAD DE PAMPLONA<br/>
  FACULTAD DE ARTES Y HUMANIDADES<br/>
  PROGRAMA DE DERECHO Y JURISPRUDENCIA<br/>
  CONSULTORIO JURIDICO<br/>
  <%=semestre%>&nbsp;- PERIODO LECTIVO  &nbsp;<%=ano%><br/>
SEDE VILLA DEL ROSARIO<br/> 
<br/>
Abogados en Formacion Activos y en Reparto<br/> 
<table width="50%" border="1" cellpadding="0" cellspacing="1" bgcolor="#104070" style="color:#FFFFFF">
                        <tr bgcolor="#104070" style="color:#FFFFFF">
                          <td height="20" colspan="6" align="center" class="text_blanco">Listado de Abogados</td>
                          </tr>
                        <tr bgcolor="#0099FF" style="color:#FFFFFF; ">
                       
                          <td width="4%" height="20" align="center" class="text_negro">N</td>                          
                          <td width="13%" align="center" class="text_negro">Codigo</td>
                          <td width="24%" align="center" class="text_negro">Nombre </td>
                          <td width="29%" align="center" class="text_negro">Apellido</td>
                          <td width="12%" align="center" class="text_negro">Activo</td>
                          <td width="13%" align="center" class="text_negro">Reparto </td>
                        </tr>
                        <% 	
							
						boolean aux=true;String consulta = null;  
						String comparar=null;
							String comparar2=null;		
							
						consulta = "select  *  from  ((select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudiantes as e where perid='"+periodo+"' order by e.nombre asc) union (select e.estuid, e.identificacion, e.nombre,e.apellido, e.activo, e.reparto, e.perid  from estudianteperiodo as et, estudiantes e where e.estuid=et.estudiante and et.periodo='"+periodo+"')) as  estudiantes order by nombre asc ";	
						
						 ResultSet  rs=con.consultar(consulta);
int cont = con.contar(rs);String[][] opes = new String[cont][7];
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("estuid");
									opes[ii][1]=rs.getString("identificacion");
									opes[ii][2]=rs.getString("nombre");
									opes[ii][3]=rs.getString("apellido");
									opes[ii][4]=rs.getString("activo");
									opes[ii][5]=rs.getString("reparto");
									rs.next();
							}	
							
							 for(int ii=0;ii<cont;ii++){
							 	
							%>
                        <tr bgcolor="#ffffff" style="color:#000000; ">
                          <td width="4%" height="20" class="text_negro" align="center"><%=ii+1 %></td>
                          <td width="13%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][1] %> </div></td>
                          <td width="24%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][2] %> </div></td>
                          <td width="29%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][3] %> </div></td>
                          <td width="12%" height="20" class="text_negro"><div align="center"><%=opes[ii][4]%>						 
						   </div></td>
                          <td width="13%" height="20" class="text_negro" align="center"><%=opes[ii][5]%>   
						  </td>
                        </tr>
                        <%						
							}
					}else{
					aux=false;
				 %>    <tr align="center" bgcolor="#ffffff" style="color:#000000; ">
                          <td height="20" class="text_negro" colspan="11">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table>
                        
                
          
</div>
</body>
</html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>