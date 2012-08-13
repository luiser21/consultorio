<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
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
<link rel="shortcut icon" href="img/favicon.ico"><link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css"> 
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function cargarmun(frm){
		frm.action="graficos.jsp";
		frm.submit();
}

function asignarzona(frm, bus ){

if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;

}
function generar(frm){
		if(esVacio(frm.buscar.value)){
			alert("Debe seleccionar un opcion.");
			frm.buscar.select();
		}else if(frm.buscar.value!='11'){
			if(esVacio(frm.periodo.value)){
				alert("Debe seleccionar un periodo.");
				frm.periodo.select();
			}
		}
		var y=0;		
		for(var i = 0; i < frm.codigo.length; i++){		
			if(frm.codigo[i].checked)y++;
		}		
		if(y>0 ) {
			if(y>1){
				frm.action="informe_graficado.jsp";
				frm.submit();
				
			}
			if(y==1){
				frm.action="informe_graficado.jsp";
				frm.submit();
				
			}
		}else{
				alert ("Debe seleccionar los tipos de graficos.");
		}
}
</script>
<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
 
	//Checkbox
	$("input[name=checktodos]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos]:checked").length == 1){
				$("input[name=codigo]").prop("checked", true);
				//$("input[name=area2]").checked = true;
			} else {
				$("input[name=codigo]").prop("checked", false);
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
  <div id="texto_contenido"><br/>
 <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Seleccione los tipos de graficos que quiere generar junto con el tipo de informacion </div></div>
<form name="form1" method="post">
  <div><br/>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
  
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
      <option value="0" selected="selected">Global</option>
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
   <br/><br/>	
   <div  style=" width:330px; padding-bottom:1px; float:left" align="center"><img src="img/graphs.jpg" width="151" height="115" />
   
   </div>
  <table width="200" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
    <tr>
                    <td width="100%" height="17" valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" align="center" class="text_blanco"><input name="checktodos"   id="checktodos" type="checkbox"  value="" /></td>
                          <td height="20" align="center" class="text_blanco">Tipos de Graficos</td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="5%" height="20"  align="center" class="text_negro"><input  type="checkbox" name="codigo" value="1"/>
                           </td>
                          <td align="center" class="text_negro">Torta</td>
                          </tr>
                       
                        <tr class="fondo_celda_3">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="codigo" value="2"/>
                           </td>
                          <td align="center" class="text_negro">Barras</td>
                          </tr>
                        
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="codigo" value="3"/>
                            </td>
                          <td align="center" class="text_negro">Lineal</td>
                          </tr>
                        
                        <tr class="fondo_celda_3">
                          <td height="20"  align="center" class="text_negro"><input  type="checkbox" name="codigo" value="4"/>
                           </td>
                          <td align="center" class="text_negro">Area</td>
                          </tr>
                                          
                      </table>						
                  </tr>
              </table><br/><br/><br/>
              <div align="center" style=" width:570px; padding-bottom:1px;"><input name="" type="button"  onClick="javascript:generar(this.form)" class="botones" value="Procesar"></div>
  </form><br/><br/><br/><br/><br/><br/><br/><br/>	  
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