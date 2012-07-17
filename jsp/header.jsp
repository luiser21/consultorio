<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*"  import="javax.servlet.*" import="javax.servlet.http.*" import="java.util.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
java.util.Calendar cal = java.util.Calendar.getInstance(java.util.Locale.US);
java.util.Date date = cal.getTime();
java.text.DateFormat formateadorHora = java.text.DateFormat.getTimeInstance(java.text.DateFormat.FULL);
java.text.DateFormat formateadorFecha = java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL);  
 String m=formateadorFecha.format(date);
 String h=formateadorHora.format(date);
Calendar ahoraCal = Calendar.getInstance();
int d=0; 
if(((ahoraCal.get(Calendar.MONTH) == Calendar.NOVEMBER) && (ahoraCal.get(Calendar.DATE) >= 15)) ||  ((ahoraCal.get(Calendar.MONTH) == Calendar.DECEMBER) && (ahoraCal.get(Calendar.DATE) <= 31))){
d=1;
}
%>
<link href="images/estilo.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='Scripts/jquery.min.js'></script>
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<%if(d==1){%>
<style>
body {
	background-image:url(images/navidad.png);
	background-repeat:repeat-x;
}
</style>
<%}%>
<div id="header" style="box-shadow: 0 0 20px #BBBBBB;">
<div id="header_int_sup">

			<ul>
            <li class="sitio1">Jurisprudencia y Derecho</li>
            <li class="sitio2">Consultorio Juridico</li>
            <li class="sitio3">Universidad de Pamplona</li>
            <li class="sitio3">Sede Villa del Rosario</li>
          	</ul>
</div>

<div id="botonera" >
          <ul>
            <li class="inicio" ><a href="landing_page.jsp" title="Inicio">Inicio</a></li>     
            <%if(nomc!=null){%>       
           		 <li class="transacciones" ><a title="Bienvenido">Bienvenido: <%= nomc%></a></li>
            <%}%>
            <li class="correo"><a href="fuera.jsp" title="Salir">Salir
            <span style="color:#FFFFFF; margin-left:200px; margin-top:-21px"><%out.println(m.toUpperCase()); out.println(h.toUpperCase());
			 %></span> </a></li>
          </ul>
         
	</div>
    
    
  <div id="logo1"></div>
  <div id="logos2"></div>

</div>
