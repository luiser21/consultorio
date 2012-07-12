<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%

String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
int contador;
Conex conn = new Conex();
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
response.setHeader ("Content-Disposition", "attachment;filename=\"radicados_excel_"+periodo+".xls\"");
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
Radicados Cargados<br/> 
<table width="50%" border="1" cellpadding="0" cellspacing="1" bgcolor="#104070" style="color:#FFFFFF">
                        <tr bgcolor="#104070" style="color:#FFFFFF">
                          <td height="20" colspan="6"  align="center" class="text_blanco">Listado de Casos                     </td>
                        
                          </tr>
                        <tr bgcolor="#0099FF" style="color:#FFFFFF; ">
                        
                          <td width="4%" align="center" class="text_negro" colspan="1">N&ordm;</td>
                          <td width="8%" align="center" class="text_negro">Radicado N&ordm; </td>
                          <td width="37%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
                          <td width="10%" align="center" class="text_negro" colspan="1">Fecha</td>
                          <td width="10%" align="center" class="text_negro">Hora</td>
                          <td width="7%" align="center" class="text_negro">Recibido</td>
                        </tr>
                        <% 	
						boolean aux=true;
						String consulta = null;
						consulta ="select *  from personacaso where perid='"+periodo+"' order by perradicado";
						ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][7];
						rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perradicado");
									opes[ii][1]=rs.getString("pernombre");
									opes[ii][2]=rs.getString("perapellido");
									opes[ii][3]=rs.getString("perfecha");
									opes[ii][4]=rs.getString("perhora");
									opes[ii][5]=rs.getString("perrecibido");
									opes[ii][6]=rs.getString("estuid");
									rs.next();
							}	
														 
							 for(int ii=0;ii<cont;ii++){
							 	
							%>
                        <tr  bgcolor="#ffffff" style="color:#000000; ">
                          <%if(opes[ii][6]==null){ %> 
                        
                              <td height="20" style="color: #F00; "><div align="center"> <%=ii+1%></div></td>
                              <td height="20" style="color: #F00; "><div align="center"> <%= opes[ii][0] %></div></td>                  
                            
                              <td height="20" style="color: #F00; " colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                             
                              <td height="20" style="color: #F00; " colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                              <td height="20" style="color: #F00; "><div align="center"><%= opes[ii][4] %></div></td>
                              <td height="20" align="center" style="color: #F00; "><%=opes[ii][5]%>                              </td>
                          <%}else{%>
                      
                              <td height="20" class="text_negro"><div align="center"> <%=ii+1%></div></td>
                              <td height="20" class="text_negro"><div align="center"> <%= opes[ii][0] %></div></td>                  
                            
                              <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                             
                              <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][4] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][5]%>                              </td>
                         
                         
                           <%}%>
                        </tr>
                       	    <%
							
							}
					}else{
					aux=false;
				 %>
                        <tr align="center"  bgcolor="#ffffff" style="color:#000000; ">
                          <td height="20" class="text_negro" colspan="6">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table>      
                  <%
				
			 con.close();
			 %>
          
</div>
</body>
</html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>