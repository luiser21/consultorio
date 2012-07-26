<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
String codigo=String.valueOf(request.getParameter("periodo"));

ResultSet  rs=null;

if(!codigo.equals("null")){

Conex con2 = new Conex();

	String consulta = "select * from periodo where perid='"+codigo+"'";		
	 rs = con2.consultar(consulta);
	rs.next();
}
String fecha2="";
String fecha=rs.getString("perfechafinal");

  if(fecha==null){
		fecha2="";
		}else{
		fecha2=fecha;
			}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
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
	if(esVacio(frm.fecha.value)){
		alert("Debe ingresar la fecha de apertura.");
		frm.fecha.focus();
	}else if(esVacio(frm.fechacierre.value)){
		alert("Debe ingresar la fecha de cierre.");
		frm.fechacierre.focus();
	}else if(frm.fechacierre.value < frm.fecha.value ){
		alert("La fecha debe ser Mayor a la de apertura.");
		frm.fechacierre.focus();
	esFechaMayor	
	}else{
		frm.action="periodomodMsg.jsp";
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
  <h1>Modificar Periodo</h1>
  <p></p>
  <div id="texto_contenido">
 
<form name="form1" method="post">
  <div align="right" style="width:502px">
 <input name="" type="button" class="botones" value=" Atras " onclick="javascript:volver(document.forms['form1']);"></div>
  
  <table width="400" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="8" align="center" class="text_blanco">Datos Periodo Semestral </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro" >Periodo</td>
                          <td height="20" colspan="2"  align="center" class="text_negro" > Periodo Semestral </td>
                          <td width="28%"  align="center" class="text_negro" >A&ntilde;o en Curso</td>
                          </tr>
                     
                        <tr class="fondo_celda_5">
                          <td width="16%" height="20"  align="center">
						  <input  type="hidden" name="codigo" size="10" value="<%=rs.getString("perid")%>" ><%=rs.getString("perid")%>
                          </td>
                          <td height="20" colspan="2"  align="center">
                           
                       
                        <%if(rs.getString("persemestre").equals("1")){%>
                           1 Semestre
                         
                           <%}if(rs.getString("persemestre").equals("2")){%>
                           2 Semestre
                           <%}%>
                     </td>
                          <td height="20"  align="center"><%=rs.getString("perano")%>
                           </td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" colspan="2"  align="center"><span class="text_negro">Fecha Apertura</span></td>
                          <td width="37%" height="20"  align="center"><span class="text_negro">Fecha Cierre</span></td>
                          <td height="20"  align="center"><span class="text_negro">Activo</span></td>
                          </tr>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="2"  align="center"><input  name="fecha" type="text" id="cal-field-2"  size="10" maxlength="10"  value="<%=rs.getString("perfecha")%>" class="text_file" % />
                            <img src="img/calendario.gif" width="15" height="16" hspace="5" align="absmiddle" border="0" id="cal-button-2" /></td>
                          <td height="20"  align="center"><input  name="fechacierre" type="text" id="cal-field-2_cierre"  size="10" maxlength="10"   class="text_file" value="<%=fecha2 %>" />
                            <img src="img/calendario.gif" width="15" height="16" hspace="5" align="absmiddle" border="0" id="cal-button-2_cierre" /></td>
                          <td height="20"  align="center"><%  int n=rs.getInt("activo");
						
						  if(n==0){%>
                            <input type="radio" name="activo"  checked="checked" value="<%=n%>" />
                            SI
                            <input type="radio" name="activo" value="1" />
                            NO
                            <%}if(n==1){%>
                            <input type="radio" name="activo" value="0" />
                            SI
                            <input type="radio" name="activo"  checked="checked" value="<%=n%>" />
                            NO
                            <%}%></td>
                          </tr>
                      </table>
					</td>
                  </tr>
                
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">
                     <input name="" type="button" class="botones" value=" Modificar " onclick="javascript:registrar(document.forms['form1']);;">
                    </td>
                  </tr>              
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  
  
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
<script type="text/javascript">
            Calendar.setup({
              inputField: 	"cal-field-2",
			  ifFormat: 	"%Y-%m-%d",
			  weekNumbers:	false,			  
			  button:		"cal-button-2"
            });
			Calendar.setup({
              inputField: 	"cal-field-2_cierre",
			  ifFormat: 	"%Y-%m-%d",
			  weekNumbers:	false,			  
			  button:		"cal-button-2_cierre"
            });
          </script>

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
