<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
try{

Conex con = new Conex();	
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

int color = 1;
String fondo = null;	
%>
<script type="text/javascript" src="jScripts/jsapi.js"></script>
<script type="text/javascript" src="jquery/jquery.gvChart-1.1.min.js"></script>
<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){
			jQuery('#myTable1').gvChart({
				chartType: 'AreaChart',
				gvSettings: {
					vAxis: {title: 'Radicados'},
					hAxis: {title: 'Periodos'},
					width: 600,
					height: 250
					}
			});
			jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'Radicados'},
					hAxis: {title: 'Periodo'},
					width: 600,
					height: 250
					}
			});
		});
		</script>
        <table id='myTable5'>
				<caption>Crecimiento Recepcion de Casos - TOTAL: <%=total%> Casos Recibidos</caption>
				<thead>
					<tr>
                   		<th>PERIODOS</th>        
       				 <% for(int ii=0;ii<cont;ii++){%>						
						<th><%=opes[ii][0]%></th>
                     <%}%>						
					</tr>
				</thead>
					<tbody>
					<tr>
                    	<th>RADICADOS</th> 
                      <% for(int ii=0;ii<cont;ii++){%>	
						<td><%=opes[ii][1]%></td>
						 <%}%>	
					</tr>
				</tbody>
			</table>
           
			<table id='myTable1'>				
				<thead>
					<tr>
						<th></th>
                        <% for(int ii=0;ii<cont;ii++){%>		
						<th><%=opes[ii][0]%></th>
                     <%}%>	
						
					</tr>
				</thead>
					<tbody>
					<tr>
						<th>Radicados</th>
						<% for(int ii=0;ii<cont;ii++){%>	
						<td><%=opes[ii][1]%></td>
						 <%}}%>	
					</tr>
					
				</tbody>
			</table>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>