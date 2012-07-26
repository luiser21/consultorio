<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%

String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
Conex conper = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String buscar=String.valueOf(request.getParameter("buscar2"));
String sexo=String.valueOf(request.getParameter("sexo2"));
String municipio=String.valueOf(request.getParameter("municipio2"));
String nacionalidad=String.valueOf(request.getParameter("nacionalidad2"));
String edades=String.valueOf(request.getParameter("edades2"));
String areas=String.valueOf(request.getParameter("areas2"));
int buscars=Integer.valueOf(buscar).intValue();
int sexos=Integer.valueOf(sexo).intValue();
int edadess=Integer.valueOf(edades).intValue();
int nacionalidads=Integer.valueOf(nacionalidad).intValue();
int areass=Integer.valueOf(areas).intValue();

ResultSet  per=null;
 String consultaper = "select * from periodo where perid='"+periodo+"'";		
			per = conper.consultar(consultaper);
			per.next();	
			int semestre=per.getInt("persemestre");
			int ano=per.getInt("perano");
			
response.setContentType ("application/vnd.ms-excel"); //Tipo de fichero.
response.setHeader ("Content-Disposition", "attachment;filename=\"reporte_excel_"+periodo+".xls\"");
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
  <br/>Consulta
  de Radicados por  <%switch(buscars){ 
		case 1: %> 
Municipio

<%if(municipio!=null)%>&nbsp;-&nbsp; <%=municipio%>
<% break;
    case 2: %>	
Embarazada
	<% break;
    case 3: %>	
Desplazados
	<% break;
    case 4: %>	
Sexo

<%if(sexos==1)%>&nbsp;-&nbsp; Masculino
<%if(sexos==2)%>&nbsp;-&nbsp; Femenino
	<% break;
    case 5: %>
Edades

<%if(edadess==1)%>&nbsp; De 0 - 14 a&ntilde;os
<%if(edadess==2)%>&nbsp; De 14 - 18 a&ntilde;os
<%if(edadess==3)%>&nbsp; De 18 - 25 a&ntilde;os
<%if(edadess==4)%>&nbsp; De 25 - 35 a&ntilde;os
<%if(edadess==5)%>&nbsp; De 35 - 50 a&ntilde;os
<%if(edadess==6)%>&nbsp;-&nbsp; Mayor de 50 a&ntilde;os
	<% break;
    case 6: %>
Discapacitados
<% break;
    case 7: %>
Nacionalidad

<%if(nacionalidads==1)%>&nbsp;-&nbsp; COLOMBIANA
<%if(nacionalidads==2)%>&nbsp;-&nbsp; VENEZOLANA
<%if(nacionalidads==3)%>&nbsp;-&nbsp; OTRO
	<% break;
    case 8: %>
Grupo Etnico Afrodescendiente
<%break; 
 case 9: %>
Areas
<%if(areass==1)%>&nbsp;-&nbsp; LABORAL
<%if(areass==2)%>&nbsp;-&nbsp; PENAL
<%if(areass==3)%>&nbsp;-&nbsp; PRIVADA
<%if(areass==4)%>&nbsp;-&nbsp; PUBLICA
<%break; 
default:
}; %>





  <br/>
  <br/>
  
</p>
<% 							boolean aux=true;							
							Conex con = new Conex();						
							ResultSet rs=null;
						//	rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
							if(buscars==0){																
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
							}							
							if(buscars==1){															
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(municipio!="0"){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and municipio='"+municipio+"'  order by perradicado");		
								}
							}							
							if(buscars==2){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SI'  order by perradicado");	
							}
							if(buscars==3){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perdesplazado='SI'  order by perradicado");	
							}
							if(buscars==4){																
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(sexos==1){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and persexo='MASCULINO'  order by perradicado");	
								}
								if(sexos==2){
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and persexo='FEMENINO'  order by perradicado");	
								}
							}
							if(buscars==5){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(edadess==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='0 - 14 anos'  order by perradicado");	
								}if(edadess==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='14 - 18 anos'  order by perradicado");	
								}if(edadess==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='18 - 25 anos'  order by perradicado");	
								}if(edadess==4){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='25 - 35 anos'  order by perradicado");	
								}if(edadess==5){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='35 - 50 anos'  order by perradicado");	
								}if(edadess==6){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perrango='mayor 50 anos'  order by perradicado");	
								}								
							}
							if(buscars==6){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perdiscapacidad='SI'  order by perradicado");	
							}
							if(buscars==7){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(nacionalidads==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='COLOMBIANA'  order by perradicado");	
								}if(nacionalidads==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='VENEZOLANA'  order by perradicado");	
								}if(nacionalidads==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pernacionalidad='OTRO'  order by perradicado");	
								}							
							}
							if(buscars==8){								
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and pergrupoetnico='SI'  order by perradicado");	
							}	
							if(buscars==9){	
								rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and embarazada='SIii'  order by perradicado");	
								if(areass==1){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='LABORAL'  order by perradicado");	
								}if(areass==2){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PENAL'  order by perradicado");	
								}if(areass==3){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PRIVADA'  order by perradicado");	
								}if(areass==4){						
									rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perarea='PUBLICA'  order by perradicado");	
								}							
							}						
							int cont = con.contar(rs); 


%>




<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolor="#000000">
  <tr >
    <td height="20" colspan="3" align="center"  bgcolor="#104070" style="color:#FFFFFF"><strong>Listado de Casos</strong>    </td>
    <td height="20" colspan="2" align="center"  bgcolor="#104070" style="color:#FFFFFF"><strong>Total:&nbsp; <%=cont%>&nbsp; Casos</strong>	</td>
    </tr>
  <tr  bgcolor="#0099FF" style="color:#FFFFFF; "><strong>
    <td width="6%"  align="center" class="text_negro">N&ordm;</td>
    <td width="26%" align="center" class="text_negro">Radicado N&ordm; </td>
    <td width="39%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
    <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
    <td width="16%" align="center" class="text_negro">Recibido</td></strong>  </tr>
  <% 						String[][] opes = new String[cont][6];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getString("perradicado");
									opes[i][1]=rs.getString("pernombre");
									opes[i][2]=rs.getString("perapellido");
									opes[i][3]=rs.getString("perfecha");
									opes[i][4]=rs.getString("perhora");
									opes[i][5]=rs.getString("perrecibido");
									rs.next();
								}
								
							
							
								
							  int color = 1;
							  String fondo = null;
							 for(int i=0;i<cont;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
  <tr class="<%= fondo %>">
    <td height="20" align="center"><div align="center"> <%=i+1%></div></td>
    <td height="20" class="text_negro"><div align="center"> <%= opes[i][0] %></div></td>
    <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[i][1] %>&nbsp;&nbsp;&nbsp;<%= opes[i][2] %></div></td>
    <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[i][3] %></div></td>
    <td height="20" class="text_negro"><div align="center"><%=opes[i][5]%>
     </div></td>
  </tr>
  <%}
					}else{
					aux=false;
				 %>
  <tr align="center">
    <td height="20" class="text_negro" colspan="5">No se encontraron registros.</td>
  </tr>
  <%}
  
  
  con.close();%>
</table>
</div>
</body>
</html>
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