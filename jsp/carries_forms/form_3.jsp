<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='../login.jsp';
</script>
<%
} 
try{
String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));

 Conex conesd = new Conex();		
						   ResultSet  cones = conesd.consultar("SELECT perapeabogss, perabogadoss from personacaso where perid='"+periodo+"' and perdocuss='"+codigo+"' group by perabogadoss, perapeabogss");		
						 
							cones.next();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/estilo.css" rel="stylesheet" type="text/css">


</script>
</head>
<body>
  <p class="ver">Ver Casos   Sistematizados   / Periodo: <%=periodo%>  <br/>Estudiante: <%=cones.getString("perabogadoss")%>  <%=cones.getString("perapeabogss")%> </p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
        <tr class="fondo_celda_1">
          <td height="20" colspan="8" align="center" class="text_blanco"><label>Area LABORAL </label></td>
        </tr>
        <tr class="fondo_celda_2">
          <td width="6%" height="20"  align="center" class="text_negro">N&ordm;</td>
          <td width="12%" align="center" class="text_negro">Radicado </td>
          <td width="48%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
          <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
          <td align="center" class="text_negro" colspan="3">Hora</td>
          <td width="9%" align="center" class="text_negro">Recibido</td>
        </tr>
        <% 	
							boolean aux=true;
							
							Conex con = new Conex();
							
							ResultSet  rs = con.consultar("select *  from personacaso where perid='"+periodo+"' and perdocuss='"+codigo+"' and perarea='LABORAL' order by perradicado");	
							int cont = con.contar(rs);
							String[][] opes = new String[cont][6];
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
          <td height="20" align="center" class="text_negro"><div align="center"> <%=i+1%></div></td>
          <td height="20" class="text_negro"><div align="center"> <%= opes[i][0] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[i][1] %>&nbsp;&nbsp;&nbsp;<%= opes[i][2] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[i][3] %></div></td>
          <td height="20" class="text_negro" colspan="3"><div align="center"><%= opes[i][4] %></div></td>
          <td height="20" class="text_negro" align="center"><%=opes[i][5]%>
            <% // String recibido=opes[i][5];
						  //if(recibido!=null){//}%></td>
        </tr>
        <%}
					}else{
					aux=false;
				 %>
        <tr align="center" class="fondo_celda_5">
          <td height="20" class="text_negro" colspan="8">No se encontraron registros.</td>
        </tr>
        <%}%>
      </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
        <tr class="fondo_celda_1">
          <td height="20" colspan="8" align="center" class="text_blanco"><label>Area PENAL </label></td>
        </tr>
        <tr class="fondo_celda_2">
          <td width="6%" height="20"  align="center" class="text_negro">N&ordm;</td>
          <td width="12%" align="center" class="text_negro">Radicado </td>
          <td width="48%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
          <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
          <td align="center" class="text_negro" colspan="3">Hora</td>
          <td width="9%" align="center" class="text_negro">Recibido</td>
        </tr>
        <% 	
							boolean auxi=true;
							
							Conex coni = new Conex();
							
							ResultSet  rsi = coni.consultar("select *  from personacaso where perid='"+periodo+"' and perdocuss='"+codigo+"' and perarea='PENAL'  order by perradicado");	
							int conti = coni.contar(rsi);
							String[][] opesi = new String[conti][6];
							rsi.beforeFirst();
							if(conti!=0){ 
							rsi.next();
								for(int ii=0;ii<conti;ii++)
								{
									opesi[ii][0]=rsi.getString("perradicado");
									opesi[ii][1]=rsi.getString("pernombre");
									opesi[ii][2]=rsi.getString("perapellido");
									opesi[ii][3]=rsi.getString("perfecha");
									opesi[ii][4]=rsi.getString("perhora");
									opesi[ii][5]=rsi.getString("perrecibido");
									rsi.next();
								}
								
							
							
								
							  int colori = 1;
							  String fondoi = null;
							 for(int ii=0;ii<conti;ii++){				    
								  fondoi = "fondo_celda_3";
								  if ((colori%2)==0)
									fondoi = "fondo_celda_4";
								  colori += 1;
							%>
        <tr class="<%= fondoi %>">
          <td height="20" align="center" class="text_negro"><div align="center"> <%=ii+1%></div></td>
          <td height="20" class="text_negro"><div align="center"> <%= opesi[ii][0] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesi[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opesi[ii][2] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesi[ii][3] %></div></td>
          <td height="20" class="text_negro" colspan="3"><div align="center"><%= opesi[ii][4] %></div></td>
          <td height="20" class="text_negro" align="center"><%=opesi[ii][5]%>
            <% // String recibido=opes[i][5];
						  //if(recibido!=null){//}%></td>
        </tr>
        <%}
					}else{
					auxi=false;
				 %>
        <tr align="center" class="fondo_celda_5">
          <td height="20" class="text_negro" colspan="8">No se encontraron registros.</td>
        </tr>
        <%}%>
      </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
        <tr class="fondo_celda_1">
          <td height="20" colspan="8" align="center" class="text_blanco"><label> Area PRIVADA</label></td>
        </tr>
        <tr class="fondo_celda_2">
          <td width="6%" height="20"  align="center" class="text_negro">N&ordm;</td>
          <td width="13%" align="center" class="text_negro">Radicado </td>
          <td width="48%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
          <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
          <td align="center" class="text_negro" colspan="3">Hora</td>
          <td width="11%" align="center" class="text_negro">Recibido</td>
        </tr>
        <% 	
							boolean auxii=true;
							
							Conex conii = new Conex();
							
							ResultSet  rsii = conii.consultar("select *  from personacaso where perid='"+periodo+"' and perdocuss='"+codigo+"' and perarea='PRIVADA'  order by perradicado");	
							int contii = conii.contar(rsii);
							String[][] opesii = new String[contii][6];
							rsii.beforeFirst();
							if(contii!=0){ 
							rsii.next();
								for(int iii=0;iii<contii;iii++)
								{
									opesii[iii][0]=rsii.getString("perradicado");
									opesii[iii][1]=rsii.getString("pernombre");
									opesii[iii][2]=rsii.getString("perapellido");
									opesii[iii][3]=rsii.getString("perfecha");
									opesii[iii][4]=rsii.getString("perhora");
									opesii[iii][5]=rsii.getString("perrecibido");
									rsii.next();
								}
								
							
							
								
							  int colorii = 1;
							  String fondoii = null;
							 for(int iii=0;iii<contii;iii++){				    
								  fondoii = "fondo_celda_3";
								  if ((colorii%2)==0)
									fondoii = "fondo_celda_4";
								  colorii += 1;
							%>
        <tr class="<%= fondoii %>">
          <td height="20" align="center" class="text_negro"><div align="center"> <%=iii+1%></div></td>
          <td height="20" class="text_negro"><div align="center"> <%= opesii[iii][0] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesii[iii][1] %>&nbsp;&nbsp;&nbsp;<%= opesii[iii][2] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesii[iii][3] %></div></td>
          <td height="20" class="text_negro" colspan="3"><div align="center"><%= opesii[iii][4] %></div></td>
          <td height="20" class="text_negro" align="center"><%=opesii[iii][5]%>
            <% // String recibido=opes[i][5];
						  //if(recibido!=null){//}%></td>
        </tr>
        <%}
					}else{
					auxii=false;
				 %>
        <tr align="center" class="fondo_celda_5">
          <td height="20" class="text_negro" colspan="8">No se encontraron registros.</td>
        </tr>
        <%}%>
      </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
        <tr class="fondo_celda_1">
          <td height="20" colspan="8" align="center" class="text_blanco"><label>Area PUBLICA </label></td>
        </tr>
        <tr class="fondo_celda_2">
          <td width="7%" height="20"  align="center" class="text_negro">N&ordm;</td>
          <td width="8%" align="center" class="text_negro">Radicado</td>
          <td width="50%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
          <td width="13%" align="center" class="text_negro" colspan="1">Fecha</td>
          <td align="center" class="text_negro" colspan="3">Hora</td>
          <td width="8%" align="center" class="text_negro">Recibido</td>
        </tr>
        <% 	
							boolean auxiii=true;
							
							Conex coniii = new Conex();
							
							ResultSet  rsiii = coniii.consultar("select *  from personacaso where perid='"+periodo+"' and perdocuss='"+codigo+"' and perarea='PUBLICA'  order by perradicado");	
							int contiii = coniii.contar(rsiii);
							String[][] opesiii = new String[contiii][6];
							rsiii.beforeFirst();
							if(contiii!=0){ 
							rsiii.next();
								for(int iiii=0;iiii<contiii;iiii++)
								{
									opesiii[iiii][0]=rsiii.getString("perradicado");
									opesiii[iiii][1]=rsiii.getString("pernombre");
									opesiii[iiii][2]=rsiii.getString("perapellido");
									opesiii[iiii][3]=rsiii.getString("perfecha");
									opesiii[iiii][4]=rsiii.getString("perhora");
									opesiii[iiii][5]=rsiii.getString("perrecibido");
									rsiii.next();
								}
								
							
							
								
							  int coloriii = 1;
							  String fondoiii = null;
							 for(int iiii=0;iiii<contiii;iiii++){				    
								  fondoiii = "fondo_celda_3";
								  if ((coloriii%2)==0)
									fondoiii = "fondo_celda_4";
								  coloriii += 1;
							%>
        <tr class="<%= fondoiii %>">
          <td height="20" align="center" class="text_negro"><div align="center"> <%=iiii+1%></div></td>
          <td height="20" class="text_negro"><div align="center"> <%= opesiii[iiii][0] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesiii[iiii][1] %>&nbsp;&nbsp;&nbsp;<%= opesiii[iiii][2] %></div></td>
          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opesiii[iiii][3] %></div></td>
          <td height="20" class="text_negro" colspan="3"><div align="center"><%= opesiii[iiii][4] %></div></td>
          <td height="20" class="text_negro" align="center"><%=opesiii[iiii][5]%>
            <% // String recibido=opes[i][5];
						  //if(recibido!=null){//}%></td>
        </tr>
        <%}
					}else{
					auxiii=false;
				 %>
        <tr align="center" class="fondo_celda_5">
          <td height="20" class="text_negro" colspan="8">No se encontraron registros.</td>
        </tr>
        <%}%>
      </table></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</body></html>
<%}catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		if(session.getAttribute("roles")!=null){			
			if(!rol.equals("Admin")){
				 response.sendRedirect("../ilegal.jsp");
			}else{
				response.sendRedirect("error_fatal_form.jsp");
			}
		}				
}%>
