<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");

if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='../login.jsp';
</script>
<%
} 
try{
Conex con = new Conex();
Conex conn = new Conex();
Conex con3 = new Conex();
Conex con2 = new Conex();
Conex con4 = new Conex();
Conex con5 = new Conex();
String dep=String.valueOf(request.getParameter("dep"));
String periodo=String.valueOf(request.getParameter("periodo"));
String id=String.valueOf(request.getParameter("id")); ///codigo
String buscar=String.valueOf(request.getParameter("buscar"));
ResultSet  rss=null;
String consulta = "select * from personacaso where perradicado='"+id+"'";		
	 rss = con.consultar(consulta);
	rss.next();
	
String cambiar=String.valueOf(request.getParameter("cambiar"));	
	String asig_abog=null;
if(cambiar.equals("modificar")){
	asig_abog=null;
}else{
	asig_abog=rss.getString("estuid");
}
	

String estu_asig_radi=String.valueOf(request.getParameter("estu_asig_radi"));
String es=String.valueOf(request.getParameter("es"));
if(es.equals("asignar")){	
		String area=String.valueOf(request.getParameter("area"));
		String codigoasig=String.valueOf(request.getParameter("codigoasig"));		
		if(estu_asig_radi!=null && !estu_asig_radi.equals("null") ){			
			String actualiza3 = "update asignacion set casos=casos-1 where area='"+area+"' and estudiante='"+estu_asig_radi+"' and periodo='"+periodo+"'";
			con5.actualizar(actualiza3);
			con5.close();
		}	
		
		ResultSet  rs2=null;
		String consulta2 = "select * from asignacion where codigo='"+codigoasig+"'";		
			 rs2 = con4.consultar(consulta2);
			rs2.next();	
			String estudiante=rs2.getString("estudiante");
			
		
		String actualiza2 = "update asignacion set casos=casos+1 where codigo='"+codigoasig+"' and estudiante='"+estudiante+"'";
			con3.actualizar(actualiza2);
			con3.close();
		
		String actualiza = "update personacaso set estuid='"+estudiante+"', perrecibido='SI', modified=now(), modified_hora=now() where perradicado='"+id+"'";
			con2.actualizar(actualiza);	
			con2.close();
			con4.close();%>
			<script>
window.parent.location='../casos.jsp?periodo=<%=periodo%>&dep=<%=dep%>';
			</script>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
<link href="../images/estilo.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="../jScripts/validaciones.js"></script>
<script language="JavaScript">
function cargar(frm){
		frm.buscar.value="";
		frm.action="form_7.jsp";
		frm.submit();
}
function asignar(frm){
	if (!chequearOpcion()) {	
		alert("Debe seleccionar un Estudiante para asignar.");
	}else{		
		frm.action="form_7.jsp?es=asignar";
		frm.submit();
	}
		
}
function modificar2(frm){
		frm.action="form_7.jsp";
		frm.submit();
}
function modificar_abogado(frm){		
		frm.action="form_7.jsp?cambiar=modificar";
		frm.submit();
}
function asignarzona(frm, per, bus, radicado ){
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	
if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;	
if(radicado=="null")    frm.id.value="";
else          	    frm.id.value=radicado;	

}
</script>
<style>
.notification div {
                line-height: 1.5em;
				
}
</style>
<body  style="background-color:#FFFFFF" onLoad="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>', '<% out.print(id);%>');">
<div  id="pagina_contenido" >
<h1 style="font-size:16px" align="center"> Radicado Numero <%=id%> del Periodo <%=periodo%></h1>
<h1 style="font-size:16px" align="center">Asignar Abogado en Formacion al Radicado</h1>
<h1 style="font-size:16px" align="center">del Area: <%=rss.getString("perarea")%>
</h1><br/>

<form name="form1" method="post" >
<%if(asig_abog!=null){
	Conex con_estu = new Conex();
	ResultSet  rs_est=null;
String consulta_estu = "select * from estudiantes where estuid='"+asig_abog+"' and perid='"+periodo+"'";		
	 rs_est = con_estu.consultar(consulta_estu);
	rs_est.next();
	
	%>
 <input name="periodo"  type="hidden"  value="<%=periodo%>" />
 <input name="id"  type="hidden"  value="<%=id%>" />
 <input name="dep"  type="hidden"  value="<%=dep%>" />
 <input name="area"  type="hidden"  value="<%=rss.getString("perarea")%>"/>
    <div id="msgBox_info" class="notification information png_bg">
					<div>
                    Se ha detectado que este Radicado N&deg; <%=id%> ya posee Abogado Asignado. Si desea modificarlo presione continuar</div>
				</div>
 <table width="100%" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="1" cellspacing="0" >
                        <tr class="fondo_celda_1">
                          <td height="20" align="center" class="text_blanco">Cedula</td>
                          <td height="20" align="center" class="text_blanco">Nombre</td>
                          <td height="20" align="center" class="text_blanco">Apellido</td>
                        </tr>
						
                       
      <tr  class="fondo_celda_2">
     <td height="20"  class="text_negro">
       <input type="hidden" name="estu_asig_radi" value="<%=asig_abog%>"/>
      &nbsp;&nbsp; <%=rs_est.getString("identificacion") %></td>
     <td width="29%" height="20"  class="text_negro">&nbsp;&nbsp;<%=rs_est.getString("nombre") %></td>
     <td height="20" class="text_negro">&nbsp;&nbsp;<%=rs_est.getString("apellido") %></td>
     </tr>				
  </table>
    
    </td>
  </tr>
</table>

<br/>
 <div align="right">   <input name="submit4"  type="button" class="botones"   onClick="javascript:modificar_abogado(document.forms['form1']);" value="Continuar">
 </div>
 <%
 con_estu.close();
 }else{
		if(!es.equals("asignar")){%>
  <strong class="text_negro">BUSCAR ESTUDIANTE: </strong> 
  <input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                  <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/>

<div align="right"  style=" padding-bottom:1px;"><br/>
  <input name="submit3"  type="button" class="botones"   onClick="javascript:asignar(document.forms['form1']);" value="Asignar"></div>
  
   <input name="periodo"  type="hidden"  value="<%=periodo%>" />
    <input name="id"  type="hidden"  value="<%=id%>" />
    <input name="dep"  type="hidden"  value="<%=dep%>" />
   <input name="area"  type="hidden"  value="<%=rss.getString("perarea")%>" />
   <input name="estu_asig_radi"   type="hidden"  value="<%=estu_asig_radi%>" />   
   <table width="100%" border="0" cellspacing="1" cellpadding="0" class="fondo_tabla">
  <tr>
    <td>
    
    <table width="100%" border="0" cellpadding="1" cellspacing="0" >
                        <tr class="fondo_celda_1">
                          <td width="4%" height="20" align="center" class="text_blanco">&nbsp;</td>
                          <td width="17%" align="center" class="text_blanco">Cedula</td>
                          <td height="20" align="center" class="text_blanco">Nombre</td>
                          <td width="40%" height="20" align="center" class="text_blanco">Apellido</td>
                          <td height="20" align="center" class="text_blanco">Casos</td>
                        </tr>
						<% boolean aux=true;
						
			 if(buscar=="null" || buscar==""){ 			
						consulta = "select * from asignacion asig, estudiantes es where asig.area='"+rss.getString("perarea")+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"' and es.reparto='SI' order by nombre asc";	
						}else{
						consulta = "select * from (select * from asignacion asig, estudiantes es where asig.area='"+rss.getString("perarea")+"' and asig.estudiante=es.estuid  and asig.periodo='"+periodo+"' and es.reparto='SI') as estudiantes where upper(nombre) like '%"+buscar+"%' OR upper(apellido) like '%"+buscar+"%' or upper(identificacion) like '%"+buscar+"%' order by nombre asc ";	
					
						 	}							
							ResultSet  rs=conn.consultar(consulta);
							int cont = conn.contar(rs);
							String[][] opes = new String[cont][8];
							rs.beforeFirst();
							if(cont!=0){ 
								rs.next();
								for(int i=0;i<cont;i++){					
									
										opes[i][0]=rs.getString("estuid");
										opes[i][1]=rs.getString("identificacion");
										opes[i][2]=rs.getString("nombre");
										opes[i][3]=rs.getString("apellido");
										opes[i][4]=rs.getString("area");
										opes[i][5]=rs.getString("codigo");
										opes[i][6]=rs.getString("casos");									
									rs.next();									
								}
						     	int color = 1;
							    String fondo = null;
							    for(int i=0;i<cont;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                       
                        <tr class="<%= fondo %>">
                      <%  if(!opes[i][0].equals(estu_asig_radi)){ %>
                          <td height="20"  class="text_negro"><input type="radio" name="codigoasig" value="<%=opes[i][5]%>"/></td>
                          <td height="20"  class="text_negro">&nbsp;&nbsp;<%= opes[i][1] %></td>
           <td width="29%" height="20"  class="text_negro">&nbsp;&nbsp;<%= opes[i][2] %></td>
           <td height="20" class="text_negro">&nbsp;&nbsp;<%= opes[i][3] %></td>
           <td width="10%" height="20" align="center" class="text_negro"><%=opes[i][6] %></td>
                        </tr>
							<%}	}
							}else{
							aux=false;		
							 %>
                        <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="9">No se encontraron registros de estudiantes.</td>
                        </tr>
                       <%	}%>
                    </table>
    
    </td>
  </tr>
</table>
  

                    <%}%>
         <%}%>
      
</form>
</div>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp");
}%>
