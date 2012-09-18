<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
String periodo=String.valueOf(request.getParameter("periodo"));
String print=String.valueOf(request.getParameter("print"));
int y=0;
int cont2=0;
Conex con = new Conex();	
String consulta=null;
String[][] opes2=null;
if(periodo.equals("0")){
	consulta="SELECT  personacaso.perarea as area, count(personacaso.perarea) as narea FROM personacaso group by personacaso.perarea";
}if(!periodo.equals(null) && !periodo.equals("0")){
	consulta="SELECT personacaso.perarea as area, count(personacaso.perarea) as narea FROM personacaso where personacaso.perid='"+periodo+"' group by personacaso.perarea";
	String consulta2="SELECT  personacaso.perarea as area, count(personacaso.perarea) as narea FROM personacaso group by personacaso.perarea";
		ResultSet  rs2= con.consultar(consulta2);
		cont2 = con.contar(rs2);		
		opes2 = new String[cont2][3];
		rs2.beforeFirst();
		if(cont2!=0){ 
			rs2.next();
			for(y=0;y<cont2;y++){ 
				opes2[y][0]=rs2.getString("area");
				opes2[y][1]=rs2.getString("narea");				
				rs2.next();
			}
		}	
}
ResultSet  rs= con.consultar(consulta);
int total=0;
int i=0;
int cont = con.contar(rs);
String[][] opes = new String[cont][3];
rs.beforeFirst();
if(cont!=0){ 
	rs.next();
	for(i=0;i<cont;i++){ 
		opes[i][0]=rs.getString("area");
	    opes[i][1]=rs.getString("narea");
		total= total + Integer.parseInt(opes[i][1]);
		rs.next();
	}
}
%>
<link href="css/estilo.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript" src="jScripts/jsapi.js"></script>
	<%if(print.equals("1")){%>
<script type='text/javascript' src='Scripts/jquery.min.js'></script>
<%}%>
<script type="text/javascript" src="jquery/jquery.gvChart-1.1.min.js"></script>
<link rel="shortcut icon" href="img/favicon.ico">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css"> 
<script type='text/javascript'> 
window.onload = detectarCarga; 
function detectarCarga(){ 
document.getElementById("imgLOAD").style.display="none"; 
} 
</script>
<div id='imgLOAD' style="TEXT-ALIGN: center"> 
<br/><br/><b>Generando el Grafico Por Favor espere.......</b><br/> <br/><br/> <br/>
<img alt='LOADING'  src='images/loadingAnimation.gif'/> 
</div>
<body bgcolor="#FFFFFF">
<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){			
			jQuery('#myTable1').gvChart({
				chartType: 'AreaChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Areas'},
					width: 600,
					height: 250
					}
			});		
			jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Areas'},
					width: 600,
					height: 250
					}
			});
			jQuery('#myTable4').gvChart({
				chartType: 'ColumnChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Areas'},
					width: 600,
					height: 250
					}
			});
		
		});
		</script>
		<%if(print.equals("1")){%>
<div align="center" >
<br/>
<table>
<tr>
	<td><img src="images/unipamplona.png" width="70px" height="85px"/></td>
	<td class="text_negro" style="font-size:12px; color:#036; font-family:"trebuchet MS", tahoma, arial;">UNIVERSIDAD DE PAMPLONA<br/>
  FACULTAD DE ARTES Y HUMANIDADES<br/>
  PROGRAMA DE DERECHO Y JURISPRUDENCIA<br/>
  CONSULTORIO JURIDICO<br/>
SEDE VILLA DEL ROSARIO
	</td>
</tr>
</table>
</div>
<%}%>
        <table id='myTable5'>
			<%if(print.equals("1")){%>
				<h1 style="font-size:12px; color:#036; font-family:"trebuchet MS", tahoma, arial;">Crecimiento Recepcion de Casos Por Area  -  TOTAL: <%=total%>  Casos Recibidos 
             <%}else{%>
			 <h1 style="font-size:16px; color:#036; font-family:"trebuchet MS", tahoma, arial;">Crecimiento Recepcion de Casos Por Area  -  TOTAL: <%=total%>  Casos Recibidos 
           
				<%}%>
			   <% if(periodo.equals("0")){%>
                en todos los Periodos
                <%} if(!periodo.equals(null) && !periodo.equals("0")){  %>
                en el Periodo <%=periodo%>
                <%}%>                
                </h1>
				<thead>
					<tr>
                   		<th>AREAS</th>        
       				 <% if(cont!=0){  for(i=0;i<cont;i++){%>						
						<th><%=opes[i][0]%></th>
                     <%}}%>						
					</tr>
				</thead>
					<tbody>
					<tr>
                    	<th>RADICADOS</th> 
                      <% if(cont!=0){ for(i=0;i<cont;i++){%>	
						<td><%=opes[i][1]%></td>
						 <%}}%>	
					</tr>
				</tbody>
			</table>
            <% if(!periodo.equals(null) && !periodo.equals("0")){%>
			<%if(print.equals("1")){%>
            <h3 style="font-size:12px; color:#036; font-family:"trebuchet MS", tahoma, arial;">Grafico de Radicados Recepcionados por <br/> Areas seg&uacute;n el Periodo: <%=periodo%>  Contra el Global</h3> 
             <%}else{%>
			 <h3 style="font-size:16px; color:#036; font-family:"trebuchet MS", tahoma, arial;">Grafico de Radicados Recepcionados por <br/> Areas seg&uacute;n el Periodo: <%=periodo%>  Contra el Global</h3> 
         
				<%}%>
			   <%}%> 
			<table id='myTable1'>				
				<thead>
					<tr>
						<th>AREAS</th> 
                        <% if(cont!=0){ for(i=0;i<cont;i++){%>		
						<th><%=opes[i][0]%></th>
                     <%}}%>	
						
					</tr>
				</thead>
					<tbody>
					<tr>
						<th>Radicados</th>
						<% if(cont!=0){ for(i=0;i<cont;i++){%>	
						<td><%=opes[i][1]%></td>
						 <%}}%>	
					</tr>
                     <tr>
                       <th>Radicados Global</th>
                        <% if(cont2!=0){ for(y=0;y<cont2;y++){%>		
						<td><%=opes2[y][1]%></td>
                        
                     <%}}%>	                       
                   </tr>    
					
				</tbody>
			</table>           
            <table id='myTable4'>
				<thead>
					<tr>
						<th>AREAS</th>
                        <% if(cont!=0){ for(i=0;i<cont;i++){%>		
						<th><%=opes[i][0]%></th>
                     <%}}%>		
					</tr>                                   
				</thead>  
                        
				<tbody>                   
                     <tr>
                       <th>Radicados </th>
                        <% if(cont!=0){ for(i=0;i<cont;i++){%>		
						<td><%=opes[i][1]%></td>
                       
                     <%}}%>	                       
                   </tr>     
                   <tr>
                       <th>Radicados Global</th>
                        <% if(cont2!=0){ for(y=0;y<cont2;y++){%>		
						<td><%=opes2[y][1]%></td>
                        
                     <%}}%>	                       
                   </tr>                                       
				</tbody>              
			</table>     
	   </body>
<%if(print.equals("1")){%>
	<script>	  setTimeout ("window.print();", 1000); </script>
<br/><br/><br/>
<h1 style="font-size:10px; color:#036; font-family:"trebuchet MS", tahoma, arial;" >HERsoft Gestion Documental - version 4.1</h1>
<%}%>
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
