<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
	
String[] array = new String[22];

array[21] = "#4572A7";
array[20] = "#6F1816";
array[19] = "#99CCFF";
array[18] = "#6F3F16";
array[17] = "#3D95AE";
array[16] = "#95A3DD";
array[15] = "#192C79";
array[14] = "#AA4643";
array[13] = "#8AC6D7";
array[12] = "#AA7343";
array[11] = "#145D71";
array[10] = "#D48F8E";
array[9] = "#00AA80";
array[8] = "#660066";
array[7] = "#CC9900";
array[6] = "#FF66CC";
array[5] = "#0066FF";
array[4] = "#003300";
array[3] = "#999999";
array[2] = "#009";
array[1] = "#0C0";
array[0] = "#990033";

Conex con = new Conex();	
String consulta="select periodo.per as periodo, count(*) as radicados from personacaso as per, (select perid as per, perfecha from periodo order by perfecha desc) as periodo  where per.perid=periodo.per group by perid, periodo.per, periodo.perfecha order by periodo.perfecha desc";
ResultSet  rs= con.consultar(consulta);

int cont = con.contar(rs);
String[][] opes = new String[cont][3];
rs.beforeFirst();
if(cont!=0){ 
	rs.next();
	for(int ii=0;ii<cont;ii++){ 
		opes[ii][0]=rs.getString("periodo");
	    opes[ii][1]=rs.getString("radicados");
		rs.next();
	}

int color = 1;
String fondo = null;	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<link href="css/grafico.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="jquery/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="jScripts/grafico.js" type="text/javascript"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="content">
<table summary="Universidad de Pamplona" border="0" cellpadding="0" cellspacing="0" width="960" align="center">
			<tbody><tr> 
 <td> <jsp:include page="header.jsp" />
</td> 
</tr> 
 <tr> 
  <td><table border="0" cellpadding="0" cellspacing="0" width="100%" height="100px"> 
 <tbody><tr>  
 <td width="260" height="420" align="left" valign="top" bgcolor="#ffffff"> 
<jsp:include page="menu.jsp" />
</td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 
 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1 >Informe Estadistico</h1>
  <p></p>
  <br/>     
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab" tabindex="0">Radicados</li>
      <li class="TabbedPanelsTab" tabindex="0">Casos</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <div class="TabbedPanelsContent"> <br/>    <br/>   
               <div id="container">
                  <div style="float:left;">
                     <table id="chartData" width="450px" >
                       <tr  class="fondo_celda_1 text_blanco">
                         <th align="center">Periodos</th><th align="center">N° Radicados</th>
                        </tr>
                     <%	
                     int y=0;
                     for(int ii=0;ii<cont;ii++){%>
                        <% if(ii<=21){%>   
                     <tr style="color:<%=array[ii]%>">
                        <%}if(ii>21){	
                            if(y==21){
                                y=0; } %>   
                     <tr style="color:<%=array[y]%>">
                     <% y++; }%>
                          <td align="center"><%=opes[ii][0]%></td><td align="center"><%=opes[ii][1]%></td>
                      </tr><%}}%>
                      </table></div>
                    <canvas id="chart" width="350" height="280"></canvas>
                </div>
      </div>
      <div class="TabbedPanelsContent">Contenido 2</div>
    </div>
  </div>
<div id="texto_contenido"> 
  
 </div>
</div> 
 </td> </tr> 
 </tbody></table></td> 
 </tr> 
 <tr> 
 <td height="2"> 
   <div id="footer"></div></td> 
</tr>  
	</tbody></table>
</div>
<jsp:include page="botoom.jsp" />
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>