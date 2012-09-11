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
<br/><div align="left">
HERsoft Gesti&oacute;n Documental
<br/>
<p>UNIVERSIDAD DE PAMPLONA<br/>
  FACULTAD DE ARTES Y HUMANIDADES<br/>
  PROGRAMA DE DERECHO Y JURISPRUDENCIA<br/>
  CONSULTORIO JURIDICO<br/>
  <%=semestre%>&nbsp;- PERIODO LECTIVO  &nbsp;<%=ano%><br/>
SEDE VILLA DEL ROSARIO<br/> 
<br/> 
Radicados Cargados<br/> 

Nota: Las Filas que estan En Rojo les falta Asignar Abogado en Formacion<br/> 
<table width="50%" border="1" cellpadding="0" cellspacing="1" bgcolor="#104070" style="color:#FFFFFF">
                        <tr bgcolor="#104070" style="color:#FFFFFF">
                          <td height="20" colspan="26"  align="center" class="text_blanco">Listado de Casos                     </td>
                        
                          </tr>
                        <tr bgcolor="#0099FF" style="color:#FFFFFF; ">
                        
                          <td width="4%" align="center" class="text_negro" colspan="1">N&ordm;</td>
                          <td width="8%" align="center" class="text_negro">Radicado N&ordm; </td>
                          <td width="37%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
                          <td width="10%" align="center" class="text_negro" colspan="1">Fecha</td>
                          <td width="10%" align="center" class="text_negro">Sexo</td>						  
                          <td width="7%" align="center" class="text_negro" colspan="1">Embarazada</td>
                          <td width="7%" align="center" class="text_negro">Trabaja</td>						  
						  <td width="8%" align="center" class="text_negro" colspan="1">Discapacitado</td>
                          <td width="5%" align="center" class="text_negro">Tipo de Discapacidad</td>
                          <td width="8%" align="center" class="text_negro" colspan="1">Grupo Etnico </td>
                          <td width="5%" align="center" class="text_negro" colspan="1">Cual Grupo Etnico</td>
                          <td width="8%" align="center" class="text_negro">Sisben</td>
                          <td width="5%" align="center" class="text_negro">Estrato</td>						  
						  <td width="14%" align="center" class="text_negro" colspan="1">Nivel Escolaridad</td>
                          <td width="5%" align="center" class="text_negro">Cual Nivel</td>
                          <td width="7%" align="center" class="text_negro" colspan="1">Tipo de Familia</td>
                          <td width="10%" align="center" class="text_negro" colspan="1">Modo de Familia</td>
                          <td width="10%" align="center" class="text_negro">Estado Civil</td>
                          <td width="7%" align="center" class="text_negro">Desplazado</td>						  
						  <td width="24%" align="center" class="text_negro" colspan="1">Motivo</td>
                          <td width="8%" align="center" class="text_negro">Area</td>
                          <td width="17%" align="center" class="text_negro" colspan="1">Municipio</td>
                          <td width="10%" align="center" class="text_negro">Rango de Edad</td>
                          <td width="37%" align="center" class="text_negro">Abogado que Recepciona</td>
						  <td width="37%" align="center" class="text_negro">Abogado Asignado</td>
					      <td width="37%" align="center" class="text_negro">Abogado que Sistematiza</td>
						  
                        </tr>
                        <% 	
						boolean aux=true;
						String consulta = null;
						//consulta ="select *  from personacaso where perid='"+periodo+"' order by perradicado";
						consulta ="SELECT personacaso.perradicado, personacaso.perfecha, personacaso.pernombre, personacaso.perapellido, personacaso.persexo, personacaso.perlabora, personacaso.perdiscapacidad, personacaso.pertipodisca, personacaso.pergrupoetnico, personacaso.percualetnico, personacaso.persisben, personacaso.pernumero, personacaso.pernivelescola, personacaso.percualnivel, personacaso.pertipofamilia, personacaso.permodofamil, personacaso.perestadocivil, personacaso.perdesplazado, personacaso.permotivo, personacaso.perarea, personacaso.perabogado, personacaso.perapeabog, personacaso.perabogadoss, personacaso.perapeabogss, personacaso.municipio, personacaso.embarazada, personacaso.perrango, personacaso.estuid, estudiantes.nombre, estudiantes.apellido from personacaso LEFT JOIN estudiantes ON estudiantes.estuid = personacaso.estuid where personacaso.perid='"+periodo+"' order by perradicado ";
						ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][32];
						rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perradicado");
									opes[ii][1]=rs.getString("pernombre");
									opes[ii][2]=rs.getString("perapellido");
									opes[ii][3]=rs.getString("perfecha");
									opes[ii][4]=rs.getString("persexo");
									opes[ii][5]=rs.getString("perlabora");
									opes[ii][6]=rs.getString("perdiscapacidad");
									opes[ii][7]=rs.getString("pertipodisca");
									opes[ii][8]=rs.getString("pergrupoetnico");									
									opes[ii][9]=rs.getString("percualetnico");
									opes[ii][10]=rs.getString("persisben");
									opes[ii][11]=rs.getString("pernumero");
									opes[ii][12]=rs.getString("pernivelescola");
									opes[ii][13]=rs.getString("percualnivel");
									opes[ii][14]=rs.getString("pertipofamilia");
									opes[ii][15]=rs.getString("permodofamil");
									opes[ii][16]=rs.getString("perestadocivil");
									opes[ii][17]=rs.getString("perdesplazado");									
									opes[ii][18]=rs.getString("permotivo");									
									opes[ii][19]=rs.getString("perarea");
									opes[ii][20]=rs.getString("municipio");
									opes[ii][21]=rs.getString("embarazada");
									opes[ii][22]=rs.getString("perrango");
									opes[ii][23]=rs.getString("perabogado");
									opes[ii][24]=rs.getString("perapeabog");
									opes[ii][25]=rs.getString("perabogadoss");
									opes[ii][26]=rs.getString("perapeabogss");								
									opes[ii][27]=rs.getString("nombre");
									opes[ii][28]=rs.getString("apellido");
									opes[ii][29]=rs.getString("estuid");
									rs.next();
							}															 
							 for(int ii=0;ii<cont;ii++){	%>
                        <tr  bgcolor="#ffffff" style="color:#000000; ">
                          <%if(opes[ii][29]==null){ %>                         
                              <td height="20" style=" background-color:#FF8080"><div align="center"> <%=ii+1%></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][0] %></div></td>                              
                 <td height="20" style=" background-color:#FF8080" colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                              <td height="20" style=" background-color:#FF8080" colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"><%= opes[ii][4] %></div></td>
							   <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][21] %></div></td>
                              <td height="20" align="center" style=" background-color:#FF8080"><%=opes[ii][5]%>                              </td>			  
							  <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][6] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][7] %></div></td>                              
                              <td height="20" style=" background-color:#FF8080" colspan="1"><div align="center"><%= opes[ii][8] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"><%= opes[ii][9] %></div></td>
                              <td height="20" align="center" style=" background-color:#FF8080"><%=opes[ii][10]%>                              </td>
							  <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][11] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][12] %></div></td>                              
                              <td height="20" style=" background-color:#FF8080" colspan="1"><div align="center"><%= opes[ii][13] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"><%= opes[ii][14] %></div></td>
                              <td height="20" align="center" style=" background-color:#FF8080"><%=opes[ii][15]%>                              </td>
							  <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][16] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][17] %></div></td>                              
                              <td height="20" style=" background-color:#FF8080" colspan="1"><div align="center"><%= opes[ii][18] %></div></td>
                              <td height="20" style=" background-color:#FF8080"><div align="center"><%= opes[ii][19] %></div></td>
                              <td height="20" align="center" style=" background-color:#FF8080"><%=opes[ii][20]%>                              </td>
	                          <td height="20" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][22] %></div></td> 
			 <td height="20" style=" background-color:#FF8080" colspan="1"><div align="left"><%= opes[ii][23] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][24] %></div></td>
             <td height="20" style=" background-color:#FF8080" colspan="1"><div align="left"><%= opes[ii][27] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][28] %></div></td>
             <td height="20" style=" background-color:#FF8080" colspan="1"><div align="left"><%= opes[ii][25] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][26] %></div></td>
                        <%}else{%>
                              <td height="20" class="text_negro"><div align="center"> <%=ii+1%></div></td>
                              <td height="20" class="text_negro"><div align="center"> <%= opes[ii][0] %></div></td>                  
                    <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                              <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][4] %></div></td>
							  <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][21] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][5]%>                              </td>                   
						      <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][6] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][7] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][8]%>                              </td>
                              <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][9] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][10] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][11]%>                              </td>
                              <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][12] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][13] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][14]%>                              </td>
						      <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][15] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][16] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][17]%>                              </td>
                              <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][18] %></div></td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][19] %></div></td>
                              <td height="20" align="center" class="text_negro"><%=opes[ii][20]%>                              </td>
                              <td height="20" class="text_negro"><div align="center"><%= opes[ii][22] %></div></td>
                   <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][23] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][24] %></div></td>
                   <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][27] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][28] %></div></td>
                   <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][25] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][26] %></div></td>
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