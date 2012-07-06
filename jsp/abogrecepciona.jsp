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
int pu=0;
int pr=0;
int pe=0;
int la=0;
int total=0;
Conex con = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String buscar=String.valueOf(request.getParameter("buscar"));	

Conex conn = new Conex();
Conex conact = new Conex();
int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("select  * from estu_recep_temp where periodo='"+periodo+"' order by perabogado");

	
int contt =conn.contar(rss);
int ntuplas=20;
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

<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script> 

<script language="JavaScript">
function volver(frm){

		frm.action="abogadorecepcionador.jsp";
		frm.submit();
		
}
function modificar2(frm){	
		frm.action="abogrecepciona.jsp";
		frm.submit();		
}
function cargarmun(frm){
		frm.action="abogrecepciona.jsp";
		frm.submit();
}
function asignarzona(frm, per, bus, departamento){
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	
if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;	
if(departamento=="null")    frm.dep.value="";
else    frm.dep.value=departamento;	
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="abogrecepciona.jsp";
		frm.submit();
}
function exportar(frm){
		frm.action="abogrecepciona_excel.jsp";
		frm.submit();		
}
</script>
<script>
	$(document).ready(function(){
			$(".iframe_ver").colorbox({iframe:true, width:"500px", height:"300px"});	
					
		});	
</script>
</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>','<% out.print(dep);%>');">
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
<%if(contt!=0){%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/distributor_report_98371.jpg" width="100" height="100" />
<%}%>
 </td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 

 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1>Abogados en Formacion que Recepcionan   / Periodo:  <%=periodo%></h1>
  <p></p><BR/>
     <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Puede buscar un estudiante por numero de cedula, nombres y apellidos </div>
				</div> 
  <div id="texto_contenido">
<form name="form1" method="post">

<input name="periodo"  type="hidden"  value="<%=periodo%>" >
  <div><strong class="text_negro">BUSCAR ESTUDIANTE: </strong> <input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();"  value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                 
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                    <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/> </div>  
  <br/>
		<div align="right" > 		 <%if(contt!=0){%>
				  <input name="input" type="button" class="botones" onClick="javascript:exportar(document.forms['form1'])"  value=" Exportar a Excel " />
                  <%}%>
                  </div>
     <table width="600" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td width="600" height="17" valign="top">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Listado de Abogados </td>
                          <td height="20" colspan="7" align="center" class="text_blanco"><div>  <%
						 if(buscar=="null" || buscar==""){  
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
                            <%}}%></div></td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td height="20"  align="center" class="text_negro"></td>
                          <td align="center" class="text_negro">N&ordm;</td>
                          <td align="center" class="text_negro">Codigo</td>
                          <td width="42%" align="center" class="text_negro">Nombres y Apellidos</td>
                          <td colspan="5" align="center" class="text_negro">Casos Recepcionados </td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" colspan="4"  align="center" class="text_negro">Casos Recepcionados  Por Area </td>
                          <td width="9%" align="center" class="text_negro">Laboral</td>
                          <td width="7%" align="center" class="text_negro">Penal</td>
                          <td width="7%" align="center" class="text_negro">Privada</td>
                          <td width="7%" align="center" class="text_negro">Publica</td>
                          <td width="7%" align="center" class="text_negro">Total</td>
                        </tr>
                        <% 	
						
						boolean aux=true;String consulta = null;  
						 if(buscar=="null" || buscar==""){
									 consulta="select  * from estu_recep_temp where periodo='"+periodo+"' order by perabogado limit 20 offset "+dep+"";	
							}else{		 
									  consulta="select  * from estu_recep_temp where (periodo='"+periodo+"' and upper(perdocu) like '%"+buscar+"%') OR (periodo='"+periodo+"' and upper(perabogado) like '%"+buscar+"%')  or (periodo='"+periodo+"' and upper(perapeabog) like '%"+buscar+"%') order by perabogado ";	
						}
								 ResultSet  rs=con.consultar(consulta);
int cont = con.contar(rs);String[][] opes = new String[cont][9];
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perdocu");
									opes[ii][1]=rs.getString("perabogado");
									opes[ii][2]=rs.getString("perapeabog");
									opes[ii][3]=rs.getString("laboral");
									opes[ii][4]=rs.getString("penal");
									opes[ii][5]=rs.getString("privada");
									opes[ii][6]=rs.getString("publica");
									opes[ii][7]=rs.getString("casos");
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
                          <td width="5%" height="20" align="center"><span class="text_negro">
                          
 <a href="carries_forms/form_4.jsp?codigo=<%=opes[ii][0]%>&periodo=<%=periodo%>" class='iframe_ver'>
 <img src="img/system-search.png"  width="16" height="16"  title="Ver Radicado" style="cursor:pointer"/>
 </a>
 </span></td>
                          <td width="3%" height="20" class="text_negro" align="center"><%=dep%></td>
                          <td width="13%" height="20" class="text_negro"><div align="left">&nbsp; &nbsp;<%= opes[ii][0] %> </div></td>
                          <td height="20" class="text_negro"><div align="left">&nbsp; &nbsp;&nbsp;<%= opes[ii][1] %>  &nbsp; &nbsp;<%= opes[ii][2] %> 
						  <input type="hidden" name="nombreape" value="<%= opes[ii][1] %>  <%= opes[ii][2] %> "/> 
						  						  </div></td>
						  <% 	int contar;
								int contar2;
								int contar3;
								int contar4;
								String ca=opes[ii][7];
								int contar5=Integer.parseInt(ca);
							    total=total+contar5;
								contar=Integer.parseInt(opes[ii][3]);
								la=la+contar;
								contar2=Integer.parseInt(opes[ii][4]);
								pe=pe+contar2;
								contar3=Integer.parseInt(opes[ii][5]);
								pr=pr+contar3;
								contar4=Integer.parseInt(opes[ii][6]);
								pu=pu+contar4;  %>
                          <td height="20" class="text_negro" align="center"><%= opes[ii][3] %></td>
                          <td height="20" class="text_negro" align="center"><%= opes[ii][4] %></td>
                          <td height="20" class="text_negro" align="center"><%= opes[ii][5] %></td>
                          <td height="20" class="text_negro" align="center"><%= opes[ii][6] %></td>
                          <td height="20" class="text_negro"><div align="center">&nbsp; &nbsp;<%= opes[ii][7] %> </div></td>
                        </tr>
                         <%
							dep++;
							}
					}else{
					aux=false;
				 %>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="13">No se encontraron registros.</td>
                        </tr>                      
                        <%}%>
						  <tr  class="fondo_celda_2">
                          <td height="20" colspan="4" class="text_negro" align="right">Total: </td>
                          <td height="20" class="text_negro" align="center"><%=la%></td>
                          <td height="20" class="text_negro" align="center"><%=pe%></td>
                          <td height="20" class="text_negro" align="center"><%=pr%></td>
                          <td height="20" class="text_negro" align="center"><%=pu%></td>
                          <td height="20" colspan="5" class="text_negro" align="center"><%=total%></td>
                          </tr>
                    </table></td>
                  </tr>
                  <%if(aux){%>
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">&nbsp;</td>
                  </tr>
                  <%}else{%>
				  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3"><a href="javascript:agregar(document.forms['form1']);"></a> </td>
                  </tr>
				  <%}%>
                </table>
      
  </form>				<p>&nbsp;</p>
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
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>