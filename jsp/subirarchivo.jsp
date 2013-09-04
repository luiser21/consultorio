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
/*String array[][]=con.readExcel("c://libro.xls");
int contador=0;

for(int ii=1;ii<array.length;ii++){ 
	if(!array[ii][0].equals("") && !array[ii][1].equals("") && !array[ii][2].equals("")){
		if(array[ii][2].matches("[0-9]*") && !array[ii][1].matches("[0-9]*") && !array[ii][0].matches("[0-9]*")){
			contador++;
			//out.println(array[ii][0]+" "+array[ii][1]+" "+array[ii][2]+"<br/>");	
			String actualiza = "insert into estudiantes_temp_excel ( cedula, nombre, apellido, perid) values(trim('"+array[ii][2]+"'),trim('"+array[ii][0]+"'),trim('"+array[ii][1]+"'),'"+periodo+"')";
			//con.actualizar(actualiza);
		}
	}
		
}	
int invalidos=(array.length-1)-contador;
*/
%>

<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function eliminar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Area.");
	}else if(confirm("¿Está  seguro de Eliminar el Area?.")){
		frm.action="areaelim.jsp";
		frm.submit();
		}
}
function modificar(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Area.");
	}else{
		frm.action="areamod.jsp";
		frm.submit();
		}
}
function agregar(frm){
		frm.action="areaagre.jsp";
		frm.submit();
}

</script>


  <div id="texto_contenido">
 
<form name="form2" method="post" action=""  enctype="multipart/form-data" >
  
 
  
  <table width="550" border="0" align="center" cellpadding="1" cellspacing="0" class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="7" align="center" class="text_blanco">Subir Archivo Excel </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" align="center" class="text_negro"><strong>Descargar Ejemplo</strong></td>
                          <td height="20" align="center" class="text_negro"><strong>Campos</strong></td>
                          <td height="20" colspan="5" align="center" class="text_blanco">&nbsp;</td>
                        </tr>
                       
                       
                        <tr class="" align="left">
                          <td width="12%" height="20" align="center" class="text_negro"><a href="ejemplo.xls"  style="color:#000"><img src="img/excelFile.png" width="40" height="40"  style="cursor:pointer"/></a> </td>
                          <td width="17%" height="20" align="left" class="text_negro fondo_celda_4"> <strong><br/> 
                            &nbsp; &nbsp;  - Nombres<br/>
                           &nbsp; &nbsp;  - Apellidos<br/>
                           &nbsp; &nbsp;  - Identificacion<br/>
                          <br/></strong></td>    
						  <input  type="hidden" name="periodo" value="<%=periodo%>" />                      
                          <td width="71%" align="center" class="text_negro"><input  class="combos" type="file" name="archivo"  id="archivo" size="50" /></td>
                        </tr>
                    </table></td>
                  </tr>
                 
                
				  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3">  <input name="guardar" type="button" class="bottom" id="guardar" onclick="validar()" value="Subir" /> </td>
					
                  </tr>
                </table>

  
 
</form>				

  
</div>
 
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
