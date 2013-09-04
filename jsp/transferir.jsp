<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>

<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
	try{
		String idfile=String.valueOf(request.getParameter("idfile"));
		String periodo=String.valueOf(request.getParameter("periodo"));
	
		Conex con = new Conex();
		Conex conarea = new Conex();
				  
		
		String consulta= "select *  from estudiantes_temp_excel where id_file='"+idfile+"' and perid='"+periodo+"'";
		 ResultSet  rs2=con.consultar(consulta);
		int cont = con.contar(rs2);
		String[][] opes2 = new String[cont][5];
		String insertar="";
		String actualiza="";
		rs2.beforeFirst();
						if(cont!=0){ 
							rs2.next();
							for(int y=0;y<cont;y++)
								{ 
									opes2[y][0]=rs2.getString("id_file");
									opes2[y][1]=rs2.getString("nombre");
									opes2[y][2]=rs2.getString("apellido");
									opes2[y][3]=rs2.getString("cedula");									
									rs2.next();
							}
						}	
			for(int y=0;y<cont;y++){
					
				String consulta2 = "select * from estudiantes where identificacion='"+opes2[y][3]+"' and perid='"+periodo+"'";		
				ResultSet rs3 = con.consultar(consulta2);	
				
				if(!(con.contar(rs3)>0)){		
					
					actualiza = "insert into estudiantes (estuid, identificacion, nombre, apellido, activo, reparto, perid) values(nextval('estudiantes_estuid_seq'),'"+opes2[y][3]+"','"+opes2[y][1]+"','"+opes2[y][2]+"','SI','SI','"+periodo+"')";
					con.actualizar(actualiza);
					
					String consulta3= "SELECT LAST_VALUE  as estuid FROM estudiantes_estuid_seq";
					ResultSet  rs4=con.consultar(consulta3);
					rs4.next();
				//	out.print(rs4.getString("estuid"));
					
					insertar = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('asignacion_codigo_seq'),'"+rs4.getString("estuid")+"', 'LABORAL', '"+periodo+"')";				
					conarea.actualizar(insertar);
					
					insertar = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('asignacion_codigo_seq'),'"+rs4.getString("estuid")+"', 'PENAL', '"+periodo+"')";				
					conarea.actualizar(insertar);
					
					insertar = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('asignacion_codigo_seq'),'"+rs4.getString("estuid")+"', 'PUBLICA', '"+periodo+"')";				
					conarea.actualizar(insertar);
					
					insertar = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('asignacion_codigo_seq'),'"+rs4.getString("estuid")+"', 'PRIVADA', '"+periodo+"')";				
					conarea.actualizar(insertar);												
				}								
			}			
			actualiza = "update file_upload set transfer='1'  where id_file='"+idfile+"' and periodo='"+periodo+"'";
			con.actualizar(actualiza);
			
			String busca="delete from estudiantes_temp_excel where  id_file='"+idfile+"' and perid='"+periodo+"'";
			con.actualizar(busca);	
			
			con.close();					
		%>
	
			<img src="img/acs_chk.gif" width="14" height="14" title="Datos Transferidos" border="0" />
	
		<script>
		alert('Los Estudiantes fueron transferidos exitosamente y asignados a las areas');
		</script>
	<%	}catch(Exception e){
			String error=e.toString(); 
			session.setAttribute("error",error);
			if(session.getAttribute("roles")!=null){			
				if(!rol.equals("Admin")){
					 response.sendRedirect("ilegal.jsp");
				}else{
					response.sendRedirect("error_fatal.jsp");
				}
			}				
}
		
%>