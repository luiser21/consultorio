<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
java.util.Calendar fecha = java.util.Calendar.getInstance();
Conex con = new Conex();
boolean flag=false;


ResultSet  rs = con.consultar("SELECT count(*) as p FROM periodo where (periodo.activo='0' and periodo.perfechafinal is null) or (periodo.activo='0' and periodo.perfechafinal is not  null) or (periodo.activo='1' and periodo.perfechafinal is  null)");		
rs.next();
int per=Integer.parseInt(rs.getString("p"));



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<style type="text/css"> @import url("css/calendar-win2k-cold-1.css"); </style>
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript" src="jScripts/calendario.js"></script>
<script type="text/javascript" src="jScripts/calendar.js"></script>
<script type="text/javascript" src="jScripts/calendar-setup.js"></script>
<script type="text/javascript" src="jScripts/calendar-es.js"></script>
<script language="JavaScript">
function registrar(frm){
	if(esVacio(frm.semestre.value)){
		alert("Debe seleccionar el periodo semestral.");
		frm.semestre.select();
	}else if(esVacio(frm.ano.value)){
		alert("Debe seleccionar el Año del Periodo.");
		frm.ano.select();	
	}else if(esVacio(frm.fecha.value)){
		alert("Debe ingresar la fecha.");
		frm.fecha.focus();	
	}else{
		frm.action="periodoagreMsg.jsp";
		frm.submit();
	}
}
function volver(frm){

		frm.action="periodo.jsp";
		frm.submit();
		
}
</script>

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
  <h1>Nuevo Periodo</h1>
  <p></p><br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:477px">
 <input name="" type="button" class="botones" value=" Atras " onclick="javascript:volver(document.forms['form1']);"></div>
 <%if(per>0){%>  
 <table width="350" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Alerta del Periodo</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td width="10%" height="20"  align="center" class="text_negro" ><img src="img/error.gif" width="21" height="21" /></td>
                          <td width="90%"  align="center" class="text_negro" >Debe Cerrar el periodo que se encuentra activo. Dirijase a Modificar Periodo para Inactivarlo</td>
                          </tr>
                    </table>
					</td>
                  </tr>                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">&nbsp;</td>
                  </tr>              
                </table>
                
     <%}else{%>           
  <table width="350" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="7" align="center" class="text_blanco">Datos Periodo Semestral </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td width="38%" height="20"  align="center" class="text_negro" >Nuevo Periodo Semestral </td>
                          <td width="27%"  align="center" class="text_negro" >A&ntilde;o en Curso </td>
                          <td width="35%"  align="center" class="text_negro" >Fecha</td>
                        </tr>                     
                        <tr class="fondo_celda_5">
                          <td height="20"  align="center">
                                   <select name="semestre" class="combos">
                            <option value="1">1 Semestre</option>
                            <option value="2">2 Semestre</option>
                            </select>
                          </td>
                          <td height="20"  align="center">                          
                           <% int f=-20;	  %>
                           <select name="ano" class="combos">
						   <option value="">Seleccione....</option>
						   <% for(int i=4;i>=f;i--){
                           	     if((fecha.get(java.util.Calendar.YEAR)+i)==(fecha.get(java.util.Calendar.YEAR)))   {             %>  
                                       <option value="<%out.print(fecha.get(java.util.Calendar.YEAR));%>" ><%out.print(fecha.get(java.util.Calendar.YEAR));%></option>
                                  <%}else{%>
                        	    	<option value="<%out.print(fecha.get(java.util.Calendar.YEAR)+i);%>"><%out.print(fecha.get(java.util.Calendar.YEAR)+i);%></option>
                            <%}}%>
                            </select> 
                              </td>
                          <td height="20"  align="center"><input  name="fecha" type="text" id="cal-field-2"  size="10" maxlength="10" class="text_file" %>
                            <img src="img/calendario.gif" width="15" height="16" hspace="5" align="absmiddle" border="0" id="cal-button-2"></td>
                        </tr>
                    </table>
					</td>
                  </tr>                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">
                     <input name="" type="button" class="botones" value=" Registrar " onclick="javascript:registrar(document.forms['form1']);">
                     </td>
                  </tr>              
                </table>
                <%}%>
                
                &nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>   <p>&nbsp;</p>   <p>&nbsp;</p> 
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
<%if(per==0){%>
<script type="text/javascript">
            Calendar.setup({
              inputField: 	"cal-field-2",
			  ifFormat: 	"%Y-%m-%d",
			  weekNumbers:	false,			  
			  button:		"cal-button-2"
            });
          </script>
<%}%>
<jsp:include page="botoom.jsp" />
</body></html>
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