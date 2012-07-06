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
Conex conper = new Conex();
int pu=0;
int pr=0;
int pe=0;
int la=0;
int total=0;
int i=0;
String periodo=String.valueOf(request.getParameter("periodo"));
ResultSet  per=null;
 String consultaper = "select * from periodo where perid='"+periodo+"'";		
			per = conper.consultar(consultaper);
			per.next();	
			int semestre=per.getInt("persemestre");
			int ano=per.getInt("perano");
			
response.setContentType ("application/vnd.ms-excel"); //Tipo de fichero.
response.setHeader ("Content-Disposition", "attachment;filename=\"abogadorecepcionan_excel_"+periodo+".xls\"");
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
</p>
Abogados en Formacion que Recepcionan
<p>
<table width="50%" border="1" cellpadding="0" cellspacing="1" bgcolor="#104070" style="color:#FFFFFF">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="8" align="center" class="text_blanco">Listado de Abogados</td>
                        </tr>
                        <tr class="fondo_celda_2" bgcolor="#0099FF" style="color:#FFFFFF; ">
                          <td height="20"  align="center" class="text_negro">N&ordm;</td>
                          <td align="center" class="text_negro">Codigo</td>
                          <td width="42%" align="center" class="text_negro">Nombres y Apellidos</td>
                          <td colspan="5" align="center" class="text_negro">Casos Recepcionados</td>
    </tr>
                        <tr class="fondo_celda_2" bgcolor="#0099FF" style="color:#FFFFFF; ">
                          <td height="20" colspan="3"  align="center" class="text_negro">Casos Recepcionados Por Area </td>
                          <td width="7%" align="center" class="text_negro">Laboral</td>
                          <td width="7%" align="center" class="text_negro">Penal</td>
                          <td width="8%" align="center" class="text_negro">Privada</td>
                          <td width="7%" align="center" class="text_negro">Publica</td>
                          <td width="8%" align="center" class="text_negro">Total</td>
                          </tr>
                        <% 	 boolean aux=true;							
							Conex con = new Conex();
							
						 String consulta = null;
				consulta= "select  * from estu_recep_temp where periodo='"+periodo+"' order by perabogado";
									 
							ResultSet  rs=con.consultar(consulta);
							int cont = con.contar(rs);
							String[][] opes = new String[cont][10];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int ii=0;ii<cont;ii++)
								{
									opes[ii][0]=rs.getString("perdocu");
									opes[ii][1]=rs.getString("perabogado");
									opes[ii][2]=rs.getString("perapeabog");
									opes[ii][3]=rs.getString("laboral");
									opes[ii][4]=rs.getString("penal");
									opes[ii][5]=rs.getString("privada");
									opes[ii][6]=rs.getString("publica");
									opes[ii][7]=rs.getString("casos");
									rs.next();
								}
							int color = 1;
							  String fondo = null;
							 for(int ii=0;ii<cont;ii++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>" bgcolor="#ffffff" style="color:#000000; ">
                          <td height="20" align="center"><%= ii+1 %></td>
                          <td width="13%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][0] %> </div></td>
                          <td height="20" class="text_negro"><div align="left">&nbsp; &nbsp;&nbsp;<%= opes[ii][1] %>&nbsp; &nbsp;<%= opes[ii][2] %></div></td> 
						  <% 
								int contar;
								int contar2;
								int contar3;
								int contar4;
								String ca=opes[ii][7];
								int contar5=Integer.parseInt(ca);
							    total=total+contar5;
								contar=Integer.parseInt(opes[ii][3]);
								la=la+contar;
								contar2=Integer.parseInt(opes[ii][4]);
								pe=pe+contar2;
								contar3=Integer.parseInt(opes[ii][5]);
								pr=pr+contar3;
								contar4=Integer.parseInt(opes[i][6]);
								pu=pu+contar4;  %>
                          <td height="20" class="text_negro" align="center"><%=opes[ii][3] %></td>
                          <td height="20" class="text_negro" align="center"><%=opes[ii][4]%></td>
                          <td height="20" class="text_negro" align="center"><%=opes[ii][5]%></td>
                          <td height="20" class="text_negro" align="center"><%=opes[ii][6]%></td>
                          <td height="20" class="text_negro"><div align="center">&nbsp; &nbsp;<%= opes[ii][7] %> </div></td>
                          </tr>
                        <%}
					}else{
					aux=false; %>
                        <tr align="center" class="fondo_celda_5" bgcolor="#ffffff" style="color:#000000; ">
                          <td height="20" class="text_negro" colspan="12">No se encontraron registros.</td>
                        </tr>                        
                        <%}%>
						 <tr  class="fondo_celda_2" bgcolor="#0099FF" style="color:#FFFFFF; ">
                          <td height="20" colspan="3" class="text_negro" align="right">Total:</td>
                          <td height="20" class="text_negro" align="center"><%=la%></td>
                          <td height="20" class="text_negro" align="center"><%=pe%></td>
                          <td height="20" class="text_negro" align="center"><%=pr%></td>
                          <td height="20" class="text_negro" align="center"><%=pu%></td>
                          <td height="20" colspan="1" class="text_negro" align="center"><%=total%></td>
                          </tr>
                    </table>
</div>
</body>
</html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>