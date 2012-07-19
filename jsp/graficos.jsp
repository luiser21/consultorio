<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}else{ 
	if(!rol.equals("Admin")){
		 response.sendRedirect("ilegal.jsp");
	}
}

try{
int buscar;
String auxx=String.valueOf(request.getParameter("buscar"));
if(auxx.equals("null") || auxx.equals("") ){ buscar=0;}
	else{ buscar=Integer.valueOf(auxx).intValue();}
	
boolean aux=true;							
Conex con= new Conex();							
ResultSet  rs = con.consultar("select * from periodo order by perfecha desc");						
int cont = con.contar(rs);
String[][] opes = new String[cont][4];
rs.beforeFirst();
if(cont!=0){ 
	rs.next();
	for(int i=0;i<cont;i++){
		opes[i][0]=rs.getString("perid");
		opes[i][1]=rs.getString("persemestre");
		opes[i][2]=rs.getString("perano");
		rs.next();
	}
}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function generar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Grafico por lo menos.");
	}else{
		frm.action="";
		frm.submit();
		}
}
function cargarmun(frm){
		frm.action="graficos.jsp";
		frm.submit();
}

function asignarzona(frm, bus ){

if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;

}

</script>
<script type="text/javascript">
$(document).ready(function(){ 
	//Checkbox
	$("input[name=checktodos]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos]:checked").length == 1){
				$("input[name=torta]").prop("checked", true);
				//$("input[name=barra]").prop("checked", true);
				//$("input[name=lineal]").prop("checked", true);
				//$("input[name=area]").prop("checked", true);
				//$("input[name=area2]").checked = true;
			} else {
				$("input[name=torta]").prop("checked", false);
				//$("input[name=barra]").prop("checked", false);
				//$("input[name=lineal]").prop("checked", false);
				//$("input[name=area]").prop("checked", false);
			}
		});
	});
 
});
</script>
</head>
<body  onload="javascript:asignarzona(document.forms['form1'],'<% out.print(buscar);%>');">
<div id="content">

<table summary="Universidad de Pamplona" border="0" cellpadding="0" cellspacing="0" width="960" align="center">
			<tbody><tr> 
 <td > <jsp:include page="header.jsp" />

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
  <h1>Informe Estadistico</h1>
  <p></p>
  <div id="texto_contenido">
 
<form name="form1" method="post">
  <div  >
  <table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="178">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="24" rowspan="4" align="right">
    
    
    
    </td>
    <td width="67" align="right"></td>
    <td width="144" align="right"></td>
    <td width="4" align="right"></td>
    <td width="3" rowspan="4" align="right"></td>
    </tr>
  <tr>
    <td>Generar Graficos Por:</td>
    <td align="left">
      
      <select name="buscar" class="combos"  onChange="javascript:cargarmun(document.forms['form1']);">
        <option selected="selected" value="">Seleccione...</option>      
        <option value="9">Areas</option>
        <option value="3">Desplazados</option>
        <option value="6">Discapacitados</option>
        <option value="5" >Edades</option>
        <option value="2">Embarazada</option>
        <option value="8">Grupo Etnico Afrodescendiente</option>
        <option value="7" >Nacionalidad</option>
        <option value="1" >Municipio</option>
        <option value="11" >Periodos</option>
        <option value="10" >Radicados</option>
        <option value="4"  >Sexo</option>
        
      </select></td>
    <td width="67" align="left"><%if(buscar>0 && buscar<11){%>	Periodo: <%}%></td>
    <td width="144" align="left">
    <%if(buscar>0 && buscar<11){%>	
    <select name="periodo" class="combos">
    
      <option >Seleccione...</option>
	  <option value="0">Global</option>
			<%for(int i=0;i<cont;i++){%>
     <option value="<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
            <%}%>    
    </select>
    <%}%>
    </td>
    <td width="4" align="left">&nbsp;</td>
    </tr>  
  </table>            
  </div>
   <br/>	<div align="right" style=" padding-bottom:1px;"><input name="" type="button"  onClick="javascript:generar(this.form)" class="botones" value="Procesar"></div>
  <table width="600" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
    <tr>
                    <td width="600" height="17" valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" align="center" class="text_blanco"><span class="text_negro">
              <input name="checktodos"   id="checktodos" type="checkbox"  value="" /> 
                          </span></td>
                          <td height="20" align="center" class="text_blanco">Tipos de Graficos</td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="5%" height="20"  align="center" class="text_negro"><input  type="checkbox" name="torta" id="torta"  />
                           </td>
                          <td align="center" class="text_negro">Torta</td>
                          </tr>
                        
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="2"><img src="img/torta.jpg" width="121" height="107" /></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="barra" id="barra"  />
                           </td>
                          <td align="center" class="text_negro">Barras</td>
                        </tr>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="2"><img src="img/barras.jpg" width="417" height="86" /></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="lineal" id="lineal"  />
                            </td>
                          <td align="center" class="text_negro">Lineal</td>
                        </tr>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="2"><img src="img/lineal.jpg" width="426" height="91" /></td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="area" id="area" />
                           </td>
                          <td align="center" class="text_negro">Area</td>
                        </tr>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="2"><img src="img/area.jpg" width="410" height="89" /></td>
                        </tr>                     
                      </table>						
                  </tr>
              </table>
  </form><br/>			  
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