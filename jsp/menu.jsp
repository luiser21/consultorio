<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/careers_lightbox/colorbox.css" />
<script src="jquery/jquery.colorbox.js"></script> 
<%
try{
String rol=(String)session.getAttribute("roles");
Conex con = new Conex();
String consulta = "select sum(contador) as contador  from usuario";	
ResultSet rs = con.consultar(consulta);	
rs.next();

%>
<script>
	$(document).ready(function(){
			$(".iframe2").colorbox({iframe:true, width:"280px", height:"180px"});						
		});		
</script>
<script language="JavaScript"> 
   function formatNmb(nNmb){ 
    var sRes = ""; 
	var j; 
	var i = nNmb.length - 1;
    for (j = 0; i >= 0; i--, j++) 
     sRes = nNmb.charAt(i) + ((j > 0) && (j % 3 == 0)? ".": "") + sRes; 
    return sRes; 
   } 
</script> 
<div id="menulateral">
	<%if(rol.equals("Admin")){%>
        <ul>
            <li><a href="totales.jsp">Informe General </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=1">Informe por Periodo Lectivo </a></li>
            <li><a  href="graficos.jsp">Informe Grafico - Estadistico </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=3">Abogados en Formacion Asignados </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=4">Abogados en Formacion que Sistematizan </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=5">Abogado en Formacion que Recepciona </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=6">Nuevos Abogados en Formacion Activos y en Reparto </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=7">Formatos - Recepcion de Casos </a></li>
            <li><a class='iframe2' href="carries_forms/form_5.jsp?id=8">Buscar Radicados</a></li>
            <li><a href="periodo.jsp">Periodos</a></li>
          <!--  <li><a href="area.jsp">Areas</a></li> -->
        </ul>
        <ul class="menu2">
            <li><a href="usuarios.jsp">Usuarios</a></li>
            <li><a href="cambiopass.jsp">Cambiar Contrase&ntilde;a</a></li>
            <li><a href="misdatos.jsp">Mis Datos Personales</a></li>
        </ul>
	<%}if(rol.equals("Estudiante")){%>
        <ul>
        	<li><a class='iframe2' href="carries_forms/form_5.jsp?id=7">Formatos - Recepcion de Casos </a></li>
        </ul>
    <%}
%>
</div>
<div class="greyboxcontador" style="background-image:url(images/iconsvisitas.png);">
  <h4>Ingresos al Sistema</h4>
  <div class="framebox">
		  <div id="contadorinterno">
    			<% int cont=rs.getInt("contador");%>
                 <script language="JavaScript"> 
   					 document.writeln(formatNmb("<%=cont%>")); 
 				 </script> 
          </div>
  </div><br/>
  <div class="fechacontador">Desde el 17 de Julio de 2012</div>
</div>
<br/>
<%}catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");		
}%>