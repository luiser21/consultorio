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
String ac=String.valueOf(request.getParameter("ac"));
String periodo=String.valueOf(request.getParameter("periodo"));

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
}
if(ac.equals("cargar")){	
	if(buscar==1){
		response.sendRedirect("municipio_grafico.jsp?periodo="+periodo+"");
	}if(buscar==2){
		response.sendRedirect("embarazada_grafico.jsp?periodo="+periodo+"");
	}if(buscar==3){
		response.sendRedirect("desplazado_grafico.jsp?periodo="+periodo+"");
	}if(buscar==4){
		response.sendRedirect("sexo_grafico.jsp?periodo="+periodo+"");
	}if(buscar==5){
		response.sendRedirect("edad_grafico.jsp?periodo="+periodo+"");
	}if(buscar==6){
		response.sendRedirect("discapacitado_grafico.jsp?periodo="+periodo+"");
	}if(buscar==7){
		response.sendRedirect("nacionalidad_grafico.jsp?periodo="+periodo+"");
	}if(buscar==8){
		response.sendRedirect("etnico_grafico.jsp?periodo="+periodo+"");
	}if(buscar==9){	
		response.sendRedirect("areas_grafico.jsp?periodo="+periodo+"");
	}if(buscar==11){
		response.sendRedirect("periodos_grafico.jsp?periodo="+periodo+"");
	}       
}
%>
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
			}else{
				frm.action="graficos.jsp?ac=cargar";
				frm.submit();
			}	
		}else{
				frm.action="graficos.jsp?ac=cargar";
				frm.submit();
		}
}
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
<form name="form1" method="post" >
  <div><br/>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="129">Generar Graficos Por:</td>
    <td width="194" align="left">      
      <select name="buscar" class="combos"  onChange="javascript:cargarmun(document.forms['form1']);">
           <%switch(buscar){ 
	case 0:%>	
        <option value="">Seleccione...</option>
        <%
	break;
	case 1: %> 
        <option value="1" >Municipio</option>
        <% break;
    case 2: %>	
        <option value="2">Embarazada</option>
        <% break;
    case 3: %>	
        <option value="3">Desplazados</option>
        <% break;
    case 4: %>	
        <option value="4"  >Sexo</option>
        <% break;
    case 5: %>
        <option value="5" >Edades</option>
        <% break;
    case 6: %>
        <option value="6">Discapacitados</option>
        <% break;
    case 7: %>
        <option value="7" >Nacionalidad</option>
        <% break;
    case 8: %>
        <option value="8">Grupo Etnico Afrodescendiente</option>
        <%break; 
	 case 9: %>
         <option value="9">Areas</option>
        <%break; 
	 case 11: %>
         <option value="11" >Periodos</option>       
        <%break; 
default:
}; %>
         
        <option value="9">Areas</option>
        <option value="3">Desplazados</option>
        <option value="6">Discapacitados</option>
        <option value="5" >Edades</option>
        <option value="2">Embarazada</option>
        <option value="8">Grupo Etnico Afrodescendiente</option>
        <option value="7" >Nacionalidad</option>
        <option value="1" >Municipio</option>
        <option value="11" >Periodos</option>
        <option value="4"  >Sexo</option>
        
      </select></td>
    <td width="49" align="left"><%if(buscar>0 && buscar<11){%>	Periodo: <%}%></td>
    <td width="125" align="left">
    <%if(buscar>0 && buscar<11){%>	
    <select name="periodo" class="combos">
      <option value="0" selected="selected">Global</option>
			<%for(int i=0;i<cont;i++){%>
     <option value="<%=opes[i][0]%>"><%=opes[i][1]%> Semestre del a&ntilde;o <%=opes[i][2]%> </option> 
            <%}%>    
    </select>
    <%}%>
    </td>
    <td width="103"  align="right"><span style=" width:600px; padding-bottom:1px;">
      <input name="input" type="button"  onclick="javascript:generar(this.form)" class="botones" value="Procesar" />
    </span></td>
    </tr>  
  </table>            
  </div>
   <br/>  <div  align="right" style=" width:600px; padding-bottom:1px;"></div>
  </form>	
 <hr />
 		 <jsp:include page="ejemplo.jsp" />
  
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