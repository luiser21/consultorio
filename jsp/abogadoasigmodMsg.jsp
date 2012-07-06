<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,db.*" errorPage="" %>
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
Conex con = new Conex();
Conex conarea = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));
String nombre=String.valueOf(request.getParameter("nombre"));
String apellido=String.valueOf(request.getParameter("apellido"));
String identificacion=String.valueOf(request.getParameter("identificacion"));
String activo=String.valueOf(request.getParameter("activo"));
String observacion=String.valueOf(request.getParameter("observacion"));
String reparto=String.valueOf(request.getParameter("reparto"));
String[] area = request.getParameterValues("area"); 
String[] area2 = request.getParameterValues("area2"); 
String codigoarea=String.valueOf(request.getParameter("codigoarea"));
String repar=reparto;
String control="-";
String control2="-";
String controles="";
int ecepcion2=0;
int seq=0;
int seq1=0;
int seq2=0;
int seq3=0;
int contador=Integer.parseInt(codigoarea);
boolean flag=false;
boolean flag2=false;
try{
	if(!codigo.equals("null"))
	{
		String consulta = "select identificacion from estudiantes where estuid='"+codigo+"'";	
		ResultSet rs = con.consultar(consulta);	
		rs.next();
		String ide=rs.getString("identificacion");
		rs=null;
		if(identificacion.equals(ide)){
			String actualiza = "update estudiantes set nombre='"+nombre+"', apellido='"+apellido+"', activo='"+activo+"', observacion='"+observacion+"', reparto='"+reparto+"'  where estuid='"+codigo+"'";
			con.actualizar(actualiza);
			seq=1;
			if(repar.equals("SI")){				
						for (int i = 1; i < area.length;i++) {			
							String insertar = "insert into asignacion (codigo, estudiante, area, periodo) values('"+contador+"', '"+codigo+"', '"+area[i]+"', '"+periodo+"')";				
							conarea.actualizar(insertar);
							 contador=contador+1;
							 seq1=1;
						}
			}	
			consulta="SELECT perradicado, perarea, estuid, perid FROM personacaso where estuid='"+codigo+"' and perid='"+periodo+"' order by perarea asc";
			rs = con.consultar(consulta);	
			int cont = con.contar(rs);
			String[][] opes = new String[cont][5];
			rs.beforeFirst();
			if(cont!=0){ 
				rs.next();
				for(int ii=0;ii<cont;ii++){
					opes[ii][0]=rs.getString("perradicado");
					opes[ii][1]=rs.getString("perarea");
					opes[ii][2]=rs.getString("estuid");
					opes[ii][3]=rs.getString("perid");
		
					rs.next();
				}
				rs=null;
				for (int i = 1; i < area2.length;i++) {			
						int sum=0;
						for(int ii=0;ii<cont;ii++){						
							if(area2[i].equals(opes[ii][1])){
								sum=sum+1;	
								controles=controles+area2[i]+" Radicado: "+opes[ii][0]+" <br/>";
							}
						}
						if(sum==0){
							consulta="delete from asignacion where estudiante='"+codigo+"' and periodo='"+periodo+"' and area='"+area2[i]+"'";
							con.actualizar(consulta);
							seq2=1;
							control2=control2+area2[i]+"-";
						}if(sum>0){					
							control=control+area2[i]+"-";
							seq3=2;
							flag2=true;
						}
				}			
			}else{
				for (int i = 1; i < area2.length;i++) {			
					consulta="delete from asignacion where estudiante='"+codigo+"' and periodo='"+periodo+"' and area='"+area2[i]+"'";
					con.actualizar(consulta);	
					seq2=1;
					control2=control2+area2[i]+"-";
				}
			}
			
				
		}
		rs=null;
		if(!identificacion.equals(ide)){	
			consulta = "select * from estudiantes where identificacion='"+identificacion+"' and perid='"+periodo+"'";		
			rs = con.consultar(consulta);
				
			if(!(con.contar(rs)>0)){			
				String actualiza = "update estudiantes set identificacion='"+identificacion+"', nombre='"+nombre+"', apellido='"+apellido+"', activo='"+activo+"', observacion='"+observacion+"', reparto='"+reparto+"'  where estuid='"+codigo+"'";
				con.actualizar(actualiza);
				seq=1;
				if(repar.equals("SI")){				
							for (int i = 1; i < area.length;i++) {			
								String insertar = "insert into asignacion (codigo, estudiante, area, periodo) values('"+contador+"', '"+codigo+"', '"+area[i]+"', '"+periodo+"')";				
								conarea.actualizar(insertar);
								 contador=contador+1;
								 seq1=1;
							}
				}
				consulta="SELECT perradicado, perarea, estuid, perid FROM personacaso where estuid='"+codigo+"' and perid='"+periodo+"' order by perarea asc";
				rs = con.consultar(consulta);	
				int cont = con.contar(rs);
				String[][] opes = new String[cont][5];
				rs.beforeFirst();
				if(cont!=0){ 
					rs.next();
					for(int ii=0;ii<cont;ii++){
						opes[ii][0]=rs.getString("perradicado");
						opes[ii][1]=rs.getString("perarea");
						opes[ii][2]=rs.getString("estuid");
						opes[ii][3]=rs.getString("perid");
			
						rs.next();
					}
					rs=null;
					for (int i = 1; i < area2.length;i++) {			
							int sum=0;
							for(int ii=0;ii<cont;ii++){						
								if(area2[i].equals(opes[ii][1])){
									sum=sum+1;	
									controles=controles+area2[i]+" Radicado: "+opes[ii][0]+" <br/>";
								}
							}
							if(sum==0){
								consulta="delete from asignacion where estudiante='"+codigo+"' and periodo='"+periodo+"' and area='"+area2[i]+"'";
								con.actualizar(consulta);
								seq2=1;
								control2=control2+area2[i]+"-";
							}if(sum>0){					
								control=control+area2[i]+"-";
								seq3=2;
								flag2=true;
							}
					}			
				}else{
					for (int i = 1; i < area2.length;i++) {			
						consulta="delete from asignacion where estudiante='"+codigo+"' and periodo='"+periodo+"' and area='"+area2[i]+"'";
						con.actualizar(consulta);	
						seq2=1;
						control2=control2+area2[i]+"-";
					}
				}	
			}else{
				seq=2;
				flag=true;
			}	
			con.close();
			conarea.close();	
		}
	}
} catch(Exception e){
       ecepcion2=1;
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
function volver(frm){
		frm.action="abogadoasig.jsp";
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
  <h1>Agregar Nuevo Abogado en Formacion / Periodo: <%=periodo%></h1>
  <p></p><br/><br/>
  <div id="texto_contenido"> 
<form name="form1" method="post">
  <div align="right" style="width:477px">
 <input name="" type="button" class="botones" value=" Atras " onclick="javascript:volver(document.forms['form1']);"></div>
  
  <table width="350" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr><input name="periodo"  type="hidden"  value="<%=periodo%>" >
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="6" align="center" class="text_blanco">Datos del Estudiante</td>
                        </tr>
                        <tr class="fondo_celda_5">
                          <td width="100%" height="20" align="center" class="text_negro" colspan="2"><br/><div align="center">                 
				<% if(ecepcion2==0){ 
						if(seq==1 && seq1==1 && seq2==1 && seq3==0){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se asignaron las areas satisfactoriamente. <br/> 
						    <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se eliminaron las areas:&nbsp;<%=control2%>  asignadas satisfactoriamente. <br/> 
						 <%}if(seq==1 && seq1==1 && seq2==1 && seq3==2){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
                            <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se asignaron las areas satisfactoriamente. <br/>
                            <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se eliminaron las areas:&nbsp;<%=control2%>  asignadas satisfactoriamente. <br/> 
                         	<img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo eliminar el area: <br/> <br/><%=controles%> <br/> Se encuentra asignado en casos por favor cambie el estudiante de esos casos para poder eliminar la asignacion o simplemente desactivelo de reparto
                         <%}if(seq==1 && seq1==1 && seq2==0 && seq3==0){%>
						  <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/>                          
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se asignaron las areas satisfactoriamente. <br/> 
                         <%}if(seq==1 && seq1==1 && seq2==0 && seq3==2){%>
						  <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/>                           
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se asignaron las areas satisfactoriamente. <br/> 
                          <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo eliminar el area: <br/> <br/><%=controles%> <br/> Se encuentra asignado en casos por favor cambie el estudiante de esos casos para poder eliminar la asignacion o simplemente desactivelo de reparto                         
                         <%}if(seq==1 && seq1==0 && seq2==1 && seq3==0){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se eliminaron las areas:&nbsp;<%=control2%>  asignadas satisfactoriamente. <br/> 
						 <%}if(seq==1 && seq1==0 && seq2==1 && seq3==2){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;Se eliminaron las areas:&nbsp;<%=control2%>  asignadas satisfactoriamente. <br/> 
                           <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo eliminar el area: <br/> <br/><%=controles%> <br/> Se encuentra asignado en casos por favor cambie el estudiante de esos casos para poder eliminar la asignacion o simplemente desactivelo de reparto    
                        <%}if(seq==1 && seq1==0 && seq2==0 && seq3==0){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
						<%}if(seq==1 && seq1==0 && seq2==0 && seq3==2){%>
						   <img src="img/acs_chk.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;El Estudiante se actualizo satisfactoriamente. <br/> 
						   <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo eliminar el area: <br/> <br/><%=controles%> <br/> Se encuentra asignado en casos por favor cambie el estudiante de esos casos para poder eliminar la asignacion o simplemente desactivelo de reparto     
                        <%}if(seq==2){%>
						   <img src="img/error.gif" width="14" height="14" align="absmiddle"> &nbsp;&nbsp;&nbsp;No se pudo realizar el proceso. La Identificacion del estudiante ya se encuentra registrado <br/> 
                       <%}
						}else{ %>
						<img src="img/error.gif" width="14" height="14" align="absmiddle">&nbsp;&nbsp;&nbsp; Error: Ya se actualizaron los Datos del Estudiante 
					<%}%>
                         </div><br/></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>&nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>  <p>&nbsp;</p>   
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