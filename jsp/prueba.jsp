<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%

Conex con = new Conex();
Conex con2 = new Conex();
String consulta ="SELECT perradicado FROM personacaso order by perradicado ";	
						
						ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][2];
						
			rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perradicado");		
										out.print(opes[ii][0]);
									String actualiza = "update personacaso set serie=nextval('radicados') where perradicado='"+opes[ii][0]+"'";
									con2.actualizar(actualiza);									
									rs.next();
									
									
							}
}							
						
%>