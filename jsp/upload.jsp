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




String periodo=String.valueOf(request.getParameter("periodo"));
int contador;
Conex conn = new Conex();
Conex conact = new Conex();
int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("SELECT * FROM file_upload where periodo='"+periodo+"'");	


int contt = conn.contar(rss);
int ntuplas=8;
int x=contt/ntuplas;
int y=contt%ntuplas;
if(y!=0){
x=x+1;
}
int i=0;

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
<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script language="JavaScript" type="text/javascript" src="jScripts/codigo.js"></script>
<script language="JavaScript">

function cargarmun(frm){
		frm.action="upload.jsp";
		frm.submit();
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="upload.jsp";
		frm.submit();
}
function asignarzona(frm, per, departamento){
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	

if(departamento=="null")    frm.dep.value="";
else    frm.dep.value=departamento;	
}
function actionChange(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "abogadoasig.jsp?periodo="+<%=periodo%>+"&dep="+<%=dep%>+"&id=" + fileID + "&ac=" + actionName;
}
function actionChange2(actionName, fileID)
{
	/*show_div_loader();*/
	window.location = "abogadoasig.jsp?periodo="+<%=periodo%>+"&dep="+<%=dep%>+"&id2=" + fileID + "&ac2=" + actionName;
}
function validar(){	
    if(document.getElementById('archivo').value == ""){
	    alert("Ingrese el archivo del documento")
		document.getElementById('archivo').focus();
		return false;
	}
	
   document.form2.action="subir.jsp?periodo=<%=periodo%>";
   document.form2.submit();    
}
</script>

</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(dep);%>');">
<div id="content">
<%
						boolean aux=true;
						String consulta = null;  
						String comparar=null;
						String comparar2=null;		
								
						consulta = "SELECT * FROM file_upload where periodo='"+periodo+"' limit 8 offset "+dep+"";	
					
						 ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][10];
%>
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
  <h1>Subir Archivo Excel Estudiantes Nuevos </h1>
  <p></p><br/>
 		
   <div id="msgBox_info" class="notification information png_bg">
					<div>
                         ------------  </div>
				</div>
				

 
<form name="form1" method="post">

 	 <input name="periodo"  type="hidden"  value="<%=periodo%>" />
    
  
<input name="input" type="button" class="botones"  onclick="javascript:llamadasin('subirarchivo.jsp?periodo=<%=periodo%>', 'contenido')"  value="Subir Excel"/>





<table width="100%" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
   				  <tr>				  
                    <td valign="top" height="17" >
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="5" align="center" class="text_blanco">Listado de Archivos Excel Subidos </td>
                          <td height="20" colspan="6" align="center"  > <div>  <%					   
						  if(contt>0){%>
                            <select name="dep" style="font-size:10px; font-family:Arial, Helvetica, sans-serif" onchange="javascript:cargarmun(document.forms['form1']);" >
                              <%if(dep!=0){%>
                              <option  value="<%=dep%>"><%=(dep+1)%> - <%=(dep+20)%> de <%=contt%></option>                              
                              <%}%>
                              <%while(i<x){ %>							  
                              <option value="<%=i*ntuplas%>" ><%=(i*ntuplas+1)%> - <%=((i+1)*ntuplas)%> de <%=contt%></option>
                              <%i++;%>							  
                              <%}%>
                              </select>  
                            <%}%></div></td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="47%" height="20"  align="center" class="text_negro"><span class="text_blanco">
                          </span>Nombre Archivo Excel </td>
                          <td width="9%" align="center" class="text_negro">Fecha Subido </td>
                          <td width="8%" align="center" class="text_negro">Subido </td>
                          <td width="13%" align="center" class="text_negro">Transferir Datos </td>
                          <td width="8%" align="center" class="text_negro">Invalidar  </td>
                          <td width="6%" align="center" class="text_negro">Datos Validos </td>
                          <td width="9%" align="center" class="text_negro">Datos Invalidos </td>
                        </tr>
                        <% 						
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("id_file");
									opes[ii][1]=rs.getString("nombre");
									opes[ii][2]=rs.getString("fecha");
									opes[ii][3]=rs.getString("subido");
									opes[ii][4]=rs.getString("transfer");
									opes[ii][5]=rs.getString("invalido");
									opes[ii][6]=rs.getString("datosvalidos");
									opes[ii][7]=rs.getString("datosinvalidos");
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
                        <tr class="<%= fondo %>" align="center">
                          <td height="20" align="left">                           
                            <input  type="hidden" name="codigo" value="<%= opes[ii][0] %>"/><%=opes[ii][1] %></td>
                          <td width="9%" height="20" class="text_negro"><div align="center"><%=opes[ii][2] %> </div></td>
                          <td width="8%" height="20" class="text_negro">
					<%	int subido=Integer.valueOf(opes[ii][3]).intValue(); 
					int transfer=Integer.valueOf(opes[ii][4]).intValue(); 
					
						if(subido==1){ %>
						
						  <img src="img/acs_chk.gif" width="14" height="14"  border="0" />
						<%}if(subido==0){%>
						 <img src="img/error.gif" width="14" height="14"  border="0" />
						<%}%>  
						  </td>
                          <td height="20" class="text_negro"><div id="transferir<%=opes[ii][0]%>">
						  <% if(subido==1){
						  		 if(transfer==0){ %>
						  <img src="img/check_purple.gif" width="14" height="14" title="Transferir Datos" border="0" onclick="javascript:llamadasin('transferir.jsp?idfile=<%=opes[ii][0]%>&periodo=<%=periodo%>', 'transferir<%=opes[ii][0]%>')" style='cursor:pointer;' />
						  		<% }else{ %>
						  	<img src="img/acs_chk.gif" width="14" height="14" title="Datos Transferidos" border="0" />
						  	<%}}if(subido==0){%>
						 <img src="img/error.gif" width="14" height="14"  border="0" />
						<%}%>  </div>
						  </td>
                          <td height="20" class="text_negro">
						    <% if(subido==1 && transfer==0){ %>
						  <img src="img/error.gif" width="14" title="Invalidar Excel" height="14" border="0" onclick='javascript:actionChange(&quot;activar&quot;, <%= opes[ii][0]%>)' style='cursor:pointer;' />
						  	<%}if(subido==0 || transfer==1){%>
						 <img src="img/error.gif" width="14" height="14"  border="0" />
						<%}%>  
						  </td>
                          <td width="6%" height="20" class="text_negro"><%=opes[ii][6]%></td>
                          <td width="9%" height="20" class="text_negro" align="center"><%=opes[ii][7]%></td>
                        </tr>
                        <%
							dep++;
							}
					}else{
					aux=false;
				 %>    <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="11">No se encontraron registros.</td>
                        </tr>
                        <%}%>
                    </table>
                    </td>
                  </tr>                
                </table>
</form>	
<br/><br/>
<div id="contenido">
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