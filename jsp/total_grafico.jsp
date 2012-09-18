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
<div id='imgLOAD' style="TEXT-ALIGN: center; width:600px;" > 
<br/><br/><b>Generando el Grafico Por Favor espere.......</b><br/> <br/><br/> <br/>
<img alt='LOADING'  src='images/loadingAnimation.gif'/> 
</div>
<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){				
			jQuery('#myTable2').gvChart({
				chartType: 'LineChart',
				gvSettings: {
					vAxis: {title: 'Numero de Radicados'},
					hAxis: {title: 'Periodos'},
					width: 600,
					height: 250
					}
			});
		});
		</script>      
			<table id='myTable2'>
				<caption>Crecimiento Recepcion de Casos por Periodos<caption>			
				<thead>
					<tr>
						<th></th>
                        <% if(cont!=0){ for(int ii=0;ii<cont;ii++){%>		
						<th><%=opes[ii][0]%>  Radicados: <%=opes[ii][1]%></th>
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
	<%
	//Calcular Media
	int suma=0;
	int ultimo=0;
	int anterior=0;
	for(int ii=0;ii<cont;ii++){
		int radicado=Integer.parseInt(opes[ii][1]);
		suma=suma+radicado;	
		if(ii==cont-1)	ultimo=Integer.parseInt(opes[ii][1]);
		if(ii==cont-2) anterior=Integer.parseInt(opes[ii][1]);
	}
	double media=suma/cont;
	//Calcular Varianza
	double suma2=0;
	for(int ii=0;ii<cont;ii++){
		int radicado=Integer.parseInt(opes[ii][1]);
		double resta=radicado-media;
		double elevar=Math.pow(resta, 2);
		suma2=suma2+elevar;			
	}
	double varianza=suma2/(cont-1);
	double desviacion=Math.sqrt(varianza);	
    	%>	
		<bR/>
		<strong>MEDIDAS DE DISPERSION<br/></strong>
	<bR/><table width="100%">
		<tr>
			<td width="33%"><strong>Media:  </strong>
				<% out.print((double)Math.round(media*100)/100);%>
			</td>
			<td width="33%"><strong>Varianza:  </strong>
				<% out.print((double)Math.round(varianza*100)/100);%>
			</td>
			<td width="33%"><strong>Desviacion Estandar:  </strong>
				<% out.print((double)Math.round(desviacion*100)/100);%>
			</td>
		</tr>
		<tr>
			<td colspan="3">
		<bR/>
				Se Concluye que la Recepcion de Casos es de un Promedio de  <%=(double)Math.round(media*100)/100%> por Semestre. <br/>
				Con una tendencia a variar por debajo o por encima de <%=(double)Math.round(desviacion*100)/100%> Casos por Semestre. <br/>

		<bR/>			
			<%if((anterior-ultimo)<0){%>
				Por lo que se determina segun la Grafica que la tendencia fue por encima, ya que aumento la Rececepcion de Casos con relacion al Periodo anterior <br/>
				<%}if((anterior-ultimo)>0){%>
				Por lo que se determina segun la Grafica que la tendencia fue por debajo, ya que disminuyo la Recepcion de Casos con relacion al Periodo anterior.
				Lo cual corresponde tomar medidas correctivas.
				<%}%>
			</td>
		</tr>
	</table>
		<bR/>
		
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