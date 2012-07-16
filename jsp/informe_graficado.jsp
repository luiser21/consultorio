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
<script>

function aleatorio(inferior,superior){
    numPosibilidades = superior - inferior
    aleat = Math.random() * numPosibilidades
    aleat = Math.floor(aleat)
    return parseInt(inferior) + aleat
} 

function dame_color_aleatorio(){
	hexadecimal = new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F")
	color_aleatorio = "#";
	for (i=0;i<6;i++){
		pos = aleatorio(0,hexadecimal.length)
		color_aleatorio += hexadecimal[pos]
	}
	return color_aleatorio
}


/*for (j=0;j<1;j++){
	document.write (dame_color_aleatorio() + "<br>")
}*/
</script>
<style>
.fondo_celda_color {/*fondo segunda celda - titulos secundarios generalmente*/
background-color: !important javascript: document.write (dame_color_aleatorio());

}
</style>
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
  <p></p><br/>
     
	<div id="texto_contenido"> 





<div id="container">
<div style="float:left;">
  <table id="chartData" width="450px">

    <tr  class="fondo_celda_1 text_blanco">
      <th align="center">Periodos</th><th align="center">N° Radicados</th>
     </tr>
 <%	for(int ii=0;ii<cont;ii++){%>                        
 <script> document.write ('<tr  style="color:'+dame_color_aleatorio()+''>)</script>
      <td align="center"><%=opes[ii][0]%></td><td align="center"><%=opes[ii][1]%></td>
    </tr><%}}%>
  </table></div>
  <canvas id="chart" width="550" height="350"></canvas>

</div>
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
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>