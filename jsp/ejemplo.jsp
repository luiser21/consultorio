<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
Conex con = new Conex();
String print=String.valueOf(request.getParameter("print"));
String consulta="select periodo.per as periodo, count(*) as radicados from personacaso as per, (select perid as per, perfecha from periodo order by perfecha desc) as periodo  where per.perid=periodo.per group by perid, periodo.per, periodo.perfecha order by periodo.perfecha asc";
ResultSet  rs= con.consultar(consulta);
int total=0;
int cont = con.contar(rs);
String[][] opes = new String[cont][3];
rs.beforeFirst();
if(cont!=0){ 
	rs.next();
	for(int ii=0;ii<cont;ii++){ 
		opes[ii][0]=rs.getString("periodo");
	    opes[ii][1]=rs.getString("radicados");
		total= total + Integer.parseInt(opes[ii][1]);
		rs.next();
	}
}
%>
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

<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){			
			jQuery('#myTable1').gvChart({
				chartType: 'AreaChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Periodos'},
					width: 600,
					height: 250
					}
			});		
			jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Periodos'},
					width: 600,
					height: 250
					}
			});
			jQuery('#myTable4').gvChart({
				chartType: 'ColumnChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Periodos'},
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
				<caption>Crecimiento Recepcion de Casos - TOTAL: <%=total%> Casos Recibidos</caption>
				<thead>
					<tr>
                   		<th>PERIODOS</th>        
       				 <% if(cont!=0){  for(int ii=0;ii<cont;ii++){%>						
						<th><%=opes[ii][0]%>  Periodo</th>
                     <%}}%>						
					</tr>
				</thead>
					<tbody>
					<tr>
                    	<th>RADICADOS</th> 
                      <% if(cont!=0){  for(int ii=0;ii<cont;ii++){%>	
						<td><%=opes[ii][1]%></td>
						 <%}}%>	
					</tr>
				</tbody>
			</table>
			<table id='myTable1'>				
				<thead>
					<tr>
						<th></th>
                        <% if(cont!=0){ for(int ii=0;ii<cont;ii++){%>		
						<th><%=opes[ii][0]%></th>
                     <%}}%>	
						
					</tr>
				</thead>
					<tbody>
					<tr>
						<th>Radicados</th>
						<% if(cont!=0){ for(int ii=0;ii<cont;ii++){%>	
						<td><%=opes[ii][1]%></td>
						 <%}}%>	
					</tr>
					
				</tbody>
			</table>
            			
			<table id='myTable4'>
				<thead>
					<tr>
						<th></th>
                        <% if(cont!=0){ for(int ii=0;ii<cont;ii++){%>		
						<th><%=opes[ii][0]%></th>
                     <%}}%>		
					</tr>                    
				</thead>               
				<tbody>                   
                     <tr>
                       <th>Radicados</th>
                        <% if(cont!=0){ for(int ii=0;ii<cont;ii++){%>		
						<td><%=opes[ii][1]%></td>
                     <%}}%>	                       
                   </tr>                                       
				</tbody>              
			</table>   
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