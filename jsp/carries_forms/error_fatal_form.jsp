<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
String error=(String)session.getAttribute("error");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}

String w=String.valueOf(request.getParameter("w"));
%>

<link href="../css/estilo.css" rel="stylesheet" type="text/css"></head>
<body>
<div id="content">
<%if(w.equals("null")){%>
<br/><br/><br/>
<table width="400" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >
     <table width="400" border="0" cellpadding="1" cellspacing="0" >
  <tr class="fondo_celda_1">
    <td colspan="2" class="text_blanco"   height="20" align="center">Mensaje de Error !!!</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td width="107"><img src="../img/warning.png" width="60" height="50" /></td>
    <td width="339" class="text_negro" align="left"> <br/>Se ha generado una excepci&oacute;n no controlada durante la ejecuci&oacute;n de la solicitud web actual <br/><br/><%  out.print("Error:  "+error+"<br/>");  %><br/></td>
  </tr>
</table> </td> 
	 </tr>
     </table>  
  <%}else{%>
  <table width="150" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >
     <table width="150" border="0" cellpadding="1" cellspacing="0" >
  <tr class="fondo_celda_1">
    <td width="107"   height="20" align="center" class="text_blanco"><img src="../img/warning.png" width="20" height="20" /></td>
    <td width="339"   height="20" align="center" class="text_blanco">Mensaje de Error</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td colspan="2" class="text_negro"> <br/>
     <%  out.print("Error:  "+error+"<br/>");  %><br/></td>
    </tr>
</table> </td> 
	 </tr>
     </table> 
  <%}%> 
</div>
</body>
</html>