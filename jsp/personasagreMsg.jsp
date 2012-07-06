<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
String control2=(String)session.getAttribute("controles2");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));
String area=String.valueOf(request.getParameter("area"));
String buscar=String.valueOf(request.getParameter("buscar"));		
	
if(control2==null || control2.equals("false") || control2.equals("null") || control2.equals("")){	
			response.sendRedirect("caso_asignado.jsp?periodo="+periodo+"");
}else{
Conex con = new Conex();
Conex conn = new Conex();
String control = "1";


int dep;
String auxx=String.valueOf(request.getParameter("dep"));	
if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("select * from asignacion asig, estudiantes es where asig.area='"+area+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"' and es.reparto='SI' order by es.nombre asc");

	
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
<meta http-equiv="content-type" content="text/html; charset="iso-8859-1>
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function asignar(frm){
	if (!chequearOpcion()) {	
		alert("Debe seleccionar un Estudiante para asignar.");
	}else{
		<%session.setAttribute("controles",control);%>		
		frm.action="caso_asignado.jsp";
		frm.submit();
	}
		
}
function volver(frm){
		frm.action="casos.jsp";
		frm.submit();		
}
function modificar2(frm){	
		frm.action="personasagreMsg.jsp";
		frm.submit();		
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="personasagreMsg.jsp";
		frm.submit();
}
function cargarmun(frm){
		frm.action="personasagreMsg.jsp";
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
</script>
</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>','<% out.print(dep);%>');">
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
  <h1> Nuevo Radicado - Asignar Estudiante / Periodo: <%=periodo%></h1>
  <p></p><br/>
     <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Puede buscar un estudiante por numero de cedula, nombres y apellidos. <br/>
                    Por Favor asigne el abogado en Formacion para el radicado que esta cargando</div>
				</div>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:576px">
     <div align="left">
<strong class="text_negro">BUSCAR AGODADO PARA ASIGNAR: </strong> 
<input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                  <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/>
                  </div>
                  <br/>
 <input name="" type="button" class="botones" value=" Volver al Listado " onclick="javascript:volver(document.forms['form1']);"><input name="" type="button" class="botones" value=" Asginar " onclick="javascript:asignar(document.forms['form1']);"></div>  
  <table width="550" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="4" align="center" class="text_blanco">Radicado N&deg;:  <%=codigo%>
                            <input name="periodo"  type="hidden"  value="<%=periodo%>" >
                            <input name="area"  type="hidden"  value="<%=area%>" >
                            <input name="codigo"  type="hidden"  value="<%=codigo%>" ></td>
                          <td height="20" colspan="3" align="center" class="text_blanco"><div>  <%
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
                        <tr  class="fondo_celda_5">
                          <td height="20" align="center" class="text_negro" colspan="7"><div align="center"><img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Asigne el Abogado en formaci&oacute;n elegido para llevar el caso . </div></td>
                        </tr>
                        <tr class="fondo_celda_1">
                          <td width="4%" height="20" align="center" class="text_blanco">&nbsp;</td>
                          <td width="15%" align="center" class="text_blanco">Cedula</td>
                          <td height="20" align="center" class="text_blanco">Nombres y Apellidos</td>
                          <td height="20" colspan="2" align="center" class="text_blanco">Area</td>
                          <td height="20" align="center" class="text_blanco">Casos</td>
                        </tr>
						<% boolean aux=true;
						String consulta = null; 
						 if(buscar=="null" || buscar==""){ 
				consulta="select * from asignacion asig, estudiantes es where asig.area='"+area+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"' and es.reparto='SI' order by es.nombre asc limit 20 offset "+dep+"";	
					}else{		 
				consulta="select * from asignacion asig, estudiantes es where (asig.area='"+area+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"' and es.reparto='SI'  and  upper(es.nombre) like '%"+buscar+"%' ) OR (asig.area='"+area+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"'  and es.reparto='SI'  and  upper(es.apellido) like '%"+buscar+"%' ) OR (asig.area='"+area+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"'  and es.reparto='SI'  and CAST(es.identificacion AS TEXT)  like '%"+buscar+"%') order by es.nombre asc";	
						}
													
							ResultSet  rs=con.consultar(consulta);
							int cont = con.contar(rs);
							String[][] opes = new String[cont][8];
							rs.beforeFirst();
							if(cont!=0){ 
								rs.next();
								for(int ii=0;ii<cont;ii++){
									opes[ii][5]=rs.getString("codigo");
									opes[ii][0]=rs.getString("estuid");
									opes[ii][1]=rs.getString("identificacion");
									opes[ii][2]=rs.getString("nombre");
									opes[ii][3]=rs.getString("apellido");
									opes[ii][4]=rs.getString("area");								
									opes[ii][6]=rs.getString("casos");
									rs.next();
									//i=cont;
								}
						     	int color = 1;
							    String fondo = null;
							    for(int ii=0;ii<cont;ii++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                       
                        <tr class="<%= fondo %>">
                          <td height="20" align="center" class="text_negro"><input  type="radio" name="estudiante" value="<%=opes[ii][0]%>"/></td>
                          <td height="20" align="center" class="text_negro"><input type="hidden" name="codigoasig" value="<%=opes[ii][5]%>"/>
                            <%= opes[ii][1] %></td>
           <td height="20" class="text_negro">&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %>   <%= opes[ii][3] %></td>
           <td width="21%" height="20" colspan="2" align="center" class="text_negro"><%= opes[ii][4] %></td>
           <td width="9%" height="20" align="center" class="text_negro"><%=opes[ii][6] %></td>
                        </tr>
							<% //i=cont;
							}	
							}else{
							aux=false;		
							 %>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="10">No se encontraron registros de estudiantes.</td>
                        </tr>
                       <%	}%>
                    </table></td>
                  </tr>
                </table>
  <p>&nbsp;</p>
</form>				

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
<%}
} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>