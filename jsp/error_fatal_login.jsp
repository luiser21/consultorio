<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*"  import="javax.servlet.*" import="javax.servlet.http.*" import="java.util.*" errorPage="" pageEncoding="UTF-8"%>
<%
String error=(String)session.getAttribute("error");
Calendar ahoraCal = Calendar.getInstance();
int d=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho</title>
<link rel="shortcut icon" href="img/favicon.ico">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  <link href="css/logeo.css" media="screen" rel="stylesheet" type="text/css" />

<style>	
.box #container {
    background: none repeat scroll 0 0 #FFFFFF;
    box-shadow: 0 0 50px #BBBBBB;
    margin:0px auto;
    max-width: 650px;    
}
#containerss { 
    margin: 100px auto;	
    max-width: 650px;   
	margin-top:0px;   
}
</style>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
</head>
<% 
if(((ahoraCal.get(Calendar.MONTH) == Calendar.NOVEMBER) && (ahoraCal.get(Calendar.DATE) >= 15)) ||  ((ahoraCal.get(Calendar.MONTH) == Calendar.DECEMBER) && (ahoraCal.get(Calendar.DATE) <= 31))){
d=1;
}
if(d==1){%>
<body class="box" style="background-image:url(images/navidad.png); background-repeat:repeat-x;" id="Bodycontent">	
<%}else{%>
<body class="box" style="background-color:#f0f0f0;" id="Bodycontent">
<%}%>
<div id="container" style=" width:650px;">
  <table  width="649" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="306" align="center"><div align="center" style="position:relative;"><img src="images/block.JPG" width="257" height="270" />
  
     <div id="registrationLink" style="border:0px solid ref; height:30px; width:96px; position:absolute; top:114px; left:207px;">
Version 4.1
</div>
    </div></td>     
    <td width="248"><div  > 
      <div id="header" class="group">
        <h2 id="logo" style="color:#FFFFFF; padding:5px" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left"><span style="color:#FFFFFF; padding:5px"></span></td>
            <td align="center" style="color:#FFFFFF">Consultorio Juridico </td>
            <td align="right"><img src="images/derechounipamplona.png" width="30" height="30" /></td>
            </tr>
        </table></h2>
        </div>     
      
      <div id="content" align="right"> &nbsp;<input  class="botones" name="commit" type="button" value="Volver"  onclick="javascript:window.location='login.jsp'" /><br/><br/>
     <table width="100%" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >
     <table width="100%" border="0" cellpadding="1" cellspacing="0" align="center" >
  <tr class="fondo_celda_1">
    <td colspan="2" class="text_blanco"   height="20" align="center">Mensaje de Error !!!</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td width="107"><img src="img/warning.png" width="40" height="30" /></td>
    <td width="339" class="text_negro" align="left"> <br/>Se ha generado una excepci&oacute;n no controlada<br/><br/><%  out.print("Error:  "+error+"<br/>");  %><br/></td>
  </tr>
</table> </td> 
	 </tr>
     </table> <br/>
        </div>
    </div></td>
  </tr> 
</table>   
 </div>
</body><br/><div id="containerss" style="position:relative" >
 <jsp:include page="botoom_login.jsp" />
</div>
</html>
