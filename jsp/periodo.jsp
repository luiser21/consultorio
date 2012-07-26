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
int contador;
	Conex conn = new Conex();
	int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
	
//String auxx =dep;
if(auxx.equals("null")) dep=0;
	else dep=Integer.valueOf(auxx).intValue();
	
ResultSet  rss = conn.consultar("select * from periodo order by perid");	
int contt = conn.contar(rss);
int ntuplas=20;
int x=contt/ntuplas;
int y=contt%ntuplas;
if(y!=0){
x=x+1;
}

int i=0;
Conex conact = new Conex();
String id=String.valueOf(request.getParameter("id"));
String ac=String.valueOf(request.getParameter("ac"));
if(!ac.equals("null") && !id.equals("null")){	
	if(ac.equals("desactivar")){		
		String actualiza = "update periodo set activo='1' where perid='"+id+"'";
		conact.actualizar(actualiza);
	}
	if(ac.equals("activar")){
		String actualiza = "update periodo set activo='0' where perid='"+id+"'";
		conact.actualizar(actualiza);
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">

<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function eliminar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Periodo Semestral.");
	}else if(confirm("¿Está seguro de Eliminar el Periodo Semestral?.")){
		frm.action="periodoeliminar.jsp";
		frm.submit();
		}
}
function modificar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Periodo Semestral.");
	}else{
		frm.action="periodomod.jsp";
		frm.submit();
		}
}
function ver(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Periodo Semestral.");
	}else{
		frm.action="amd_Acabado_ver.jsp";
		frm.submit();
		}
}
function continuar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Periodo Semestral para continuar.");
	}else{
		frm.action="personas.jsp";
		frm.submit();
		}
}
function agregar(frm){
		frm.action="periodoagre.jsp";
		frm.submit();
}


function cargarmun(frm){
		frm.action="periodo.jsp";
		frm.submit();
}
function asignarzona(frm, departamento){

if(departamento=="null")    frm.dep.value="";
else    frm.dep.value=departamento;	
}
function actionChange(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "periodo.jsp?dep="+<%=dep%>+"&id=" + fileID + "&ac=" + actionName;
}
</script>

</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(dep);%>');">
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
  <h1>Periodos </h1>
  <p></p></br>
  <div id="texto_contenido">
 
<form name="form1" method="post">
  <table width="500" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="5" align="center" class="text_blanco">Listado de Periodos </td>
                          <td height="20" colspan="6" align="center" class="text_blanco"><%if(contt>0){%>
                                <select name="dep" class="combos" onchange="javascript:cargarmun(document.forms['form1']);" >
                                   <%if(dep!=0){%>
                             <option  value="<%=dep%>"><%=(dep+1)%> - <%=(dep+20)%> de <%=contt%></option>
                                   <%}%>
                                  <%while(i<x){ %>							  
   <option value="<%=i*ntuplas%>" ><%=(i*ntuplas+1)%> - <%=((i+1)*ntuplas)%> de <%=contt%></option>
                                  <%i++;%>							  
  <%}%>
                                              </select>  
                                <%}%></td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="4%" height="20"  align="center" class="text_negro"></td>
                          <td width="13%" align="center" class="text_negro">Codigo</td>                          
                          <td width="22%" align="center" class="text_negro">Periodo Semestral</td>
                          <td width="17%" align="center" class="text_negro">A&ntilde;o</td>
                          <td width="16%" align="center" class="text_negro">Fecha Inicio </td>
                          <td width="16%" align="center" class="text_negro">Fecha Culminacion </td>
                          <td width="12%" align="center" class="text_negro">Activo</td>
                        </tr>
                        <% boolean aux=true;						 
						String consulta = null;	 
						consulta ="select * from periodo order by perano desc, persemestre desc limit 20 offset "+dep+"";
						ResultSet  rs=con.consultar(consulta);
int cont = con.contar(rs);String[][] opes = new String[cont][7];
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perid");
									opes[ii][1]=rs.getString("persemestre");
									opes[ii][2]=rs.getString("perano");
									opes[ii][3]=rs.getString("perfecha");
									opes[ii][4]=rs.getString("perfechafinal");
									opes[ii][5]=rs.getString("activo");
									rs.next();
							}	
							
							 int color = 1;
							  String fondo = null;
							  dep=dep+1;
							 for(int ii=0;ii<cont;ii++){
							 				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>">
                          <td width="4%" height="20" align="center">
                            <input type="radio" name="periodo" value="<%= opes[ii][0] %>"/>                          </td>
                          <td width="13%" height="20" class="text_negro"> <div align="center"><%= opes[ii][0] %> </div></td>                          
                          <td width="22%" height="20" class="text_negro"><div align="center"><%= opes[ii][1] %> </div></td>
                          <td width="17%" height="20" class="text_negro"><div align="center"><%= opes[ii][2] %> </div></td>
                          <td height="20" class="text_negro"><div align="center"><%= opes[ii][3] %> </div></td>
                          <td height="20" class="text_negro"><div align="center"><%if (opes[ii][4]==null){ %> No ha cerrado 
						  <%}else{ %><%=opes[ii][4]%>
						  <%}%>
						  
						  </div></td>
                          <td height="20" class="text_negro" align="center"><%
						String mm=opes[ii][5];
						String pid=opes[ii][0];
						 int nm=Integer.parseInt(mm);
						  if(nm==0){%>
<img src="img/acs_chk.gif" width="14" title="Desactivar Periodo" height="14" hspace="5"  onclick='javascript:actionChange("desactivar","<%= opes[ii][0]%>")' style='cursor:pointer;' border="0" >
						  <%}if(nm==1){%>
<img src="img/error.gif" width="14"  title="Activar Periodo" height="14" hspace="5" onclick='javascript:actionChange("activar",<%=pid%>)' style='cursor:pointer;'  border="0" >
							 <%}%></td>
                        </tr>
                       <%
							dep++;
							}
					}else{
					aux=false;
				 %>     <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="11">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table></td>
                  </tr>
                  <%if(aux){%>
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3"><input name="" type="button"  onClick="javascript:modificar(document.forms['form1'])" class="botones" value="Modificar Periodo">
					<input name="" type="button"  onClick="javascript:eliminar(document.forms['form1'])" class="botones" value="Eliminar Periodo">
					<input name="" type="button"  onClick="javascript:agregar(document.forms['form1'])" class="botones" value="Agregar Nuevo"></td>
					
                  </tr>
                  <%}else{%>
				  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3"><input name="" type="button"  onClick="javascript:agregar(document.forms['form1'])" class="botones" value="Agregar Nuevo"></td>
					
                  </tr>
				  <%}%>
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
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
