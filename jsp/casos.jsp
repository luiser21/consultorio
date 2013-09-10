<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
try{
int contador;
Conex conn = new Conex();
		Conex con = new Conex();
		Conex con2 = new Conex();
		Conex con3 = new Conex();
		Conex con4 = new Conex();
		Conex con_periodo = new Conex();
int dep;
int no_asignado=0;
String auxx=String.valueOf(request.getParameter("dep"));
String periodo=String.valueOf(request.getParameter("periodo"));
String buscar=String.valueOf(request.getParameter("buscar"));
	
String id=String.valueOf(request.getParameter("id"));
String ac=String.valueOf(request.getParameter("ac"));

String consulta_periodo = "select * from periodo where perid='"+periodo+"'";		
		ResultSet  rs_periodo= con_periodo.consultar(consulta_periodo);
		rs_periodo.next();		


if(!ac.equals("null") && !id.equals("null")){	
	
	if(ac.equals("eliminar")){
		
		String consulta2 = "select * from personacaso where perradicado='"+id+"'";		
		ResultSet  rs2= con2.consultar(consulta2);
		rs2.next();				
		
		if(rs2.getString("estuid")!=null){
			String actualiza2 = "update asignacion set casos=casos-1 where estudiante='"+rs2.getString("estuid")+"' and area='"+rs2.getString("perarea")+"' and periodo='"+periodo+"'";
			con3.actualizar(actualiza2);
		}
		String actualiza = "delete from personacaso where perradicado='"+id+"'";
		con4.actualizar(actualiza);

	}
}


if(auxx.equals("null") || auxx.equals("")) dep=0;
else dep=Integer.valueOf(auxx).intValue();
ResultSet  rss = conn.consultar("select *  from personacaso where perid='"+periodo+"' order by perradicado");	
int contt = conn.contar(rss);
String[][] opes_con = new String[contt][2];
rss.beforeFirst();
if(contt!=0){ 
	rss.next();
	for(int iii=0;iii<contt;iii++){ 
	
		opes_con[iii][0]=rss.getString("estuid");
		if(opes_con[iii][0]==null){
			no_asignado++;
		}
		rss.next();
	}
}
//int contt = conn.contar(rss);
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
<script language="JavaScript" type="text/javascript" src="jScripts/codigo.js"></script>
<script language="JavaScript">
function eliminar(frm){
		var y=0;
		
		for(var i = 0; i < frm.cc.length; i++){		
			if(frm.cc[i].checked)y++;
			
		}
	
		if(y>0 ) {
			if(y>1){
				if(confirm("¿Está seguro de Eliminar los "+y+" Radicados?.")){
					frm.action="eliminar_caso.jsp";
					frm.submit();
				}
			}
			if(y==1){
				if(confirm("¿Está seguro de Eliminar el Radicado?.")){
					frm.action="eliminar_caso.jsp";
					frm.submit();
				}
			}
		}else{
				alert ("Debe seleccionar un Radicado.");
		}
}
function eliminar_radio(frm){
if (!chequearOpcion()) {	
		alert("Debe seleccionar un Radicado.");
	}else if(confirm("¿Está seguro de Eliminar el Radicado?.")){
		frm.action="eliminar_caso.jsp";
		frm.submit();
		}
}
function modificar_radio(frm){
	if (!chequearOpcion()) {	
		alert("Debe seleccionar un Radicado.");
	}else{ 
		frm.action="modificarcaso.jsp";
		frm.submit();
	}
}
function modificar(frm){
		var y=0;		
		for(var i = 0; i < frm.cc.length; i++){		
			if(frm.cc[i].checked)y++;
		}		
		if(y>0 ) {
			if(y>1){
				alert ("Para Modificar solo seleccione un Radicado a la vez.");
			}else{
				frm.action="modificarcaso.jsp";
				frm.submit();
			}
		}else{
				alert ("Debe seleccionar un Radicado.");
		}
}


function agregar(frm){
		frm.action="casos_agre.jsp";
		frm.submit();
}
function cargarmun(frm){
		frm.action="casos.jsp";
		frm.submit();
}
function cargar(frm){
		frm.buscar.value="";
		frm.action="casos.jsp";
		frm.submit();
}
function asignarzona(frm, per,  bus, departamento){
	
	//alert (pago);
if(per=="null")    frm.periodo.value="";
else          	    frm.periodo.value=per;	
if(bus=="null")    frm.buscar.value="";
else          	    frm.buscar.value=bus;	
if(departamento=="null")    frm.dep.value="";
else          	    frm.dep.value=departamento;	
}
function modificar2(frm){
		frm.action="casos.jsp";
		frm.submit();
}
function exportar(frm){
		frm.action="casos_excel.jsp";
		frm.submit();		
}

</script>

<script language="JavaScript"   src="jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
 
	//Checkbox
	$("input[name=checktodos]").change(function(){
		$('input[type=checkbox]').each( function() {			
			if($("input[name=checktodos]:checked").length == 1){
				$("input[name=cc]").prop("checked", true);
				//$("input[name=area2]").checked = true;
			} else {
				$("input[name=cc]").prop("checked", false);
			}
		});
	});
 
});
function actionChange2(actionName, fileID, fileID2)
{
	/*show_div_loader();*/
	window.location = "casos.jsp?dep="+<%=dep%>+"&id=" + fileID + "&periodo=" + fileID2 + "&ac=" + actionName;
}

function OcultarFilas(Fila, Fila2) {
    var elementos = document.getElementsByName(Fila);
	var elementos2 = document.getElementsByName(Fila2);
    for (k = 0; k< elementos.length; k++) {
               elementos[k].style.display = "none";
    }
	for (kk = 0; kk< elementos2.length; kk++) {
               elementos2[kk].style.display ="inline";
    }
	
}
function MostrarFilas(Fila, Fila2) {
var elementos = document.getElementsByName(Fila);
    for (i = 0; i< elementos.length; i++) {
        if(navigator.appName.indexOf("Microsoft") > -1){
               var visible = 'block'
        } else {
               var visible = 'table-row';
        }
	elementos[i].style.display = visible;
        }
		
var elementos2 = document.getElementsByName(Fila2);
    for (ii = 0; ii< elementos2.length; ii++) {
        if(navigator.appName.indexOf("Microsoft") > -1){
               var visible = 'block'
        } else {
               var visible = 'table-row';
        }
	elementos2[ii].style.display = "none";
        }
}

</script>
<script>
	$(document).ready(function(){
			$(".iframeradi").colorbox({iframe:true, width:"780px", height:"480px"});	
					
		});	
</script>
<script>
	$(document).ready(function(){
			$(".iframeestu").colorbox({iframe:true, width:"580px", height:"380px"});	
					
		});	
</script>
<script>
	$(document).ready(function(){
			$(".iframe_radi").colorbox({iframe:true, width:"350px", height:"250px"});	
					
		});	
</script>
<script>
	$(document).ready(function(){
			$(".iframe_fal_estu").colorbox({iframe:true, width:"350px", height:"250px"});	
					
		});	
</script>
<%if(no_asignado!=0){%>
<style>
.notification div {
                line-height: 1.7em;
				padding: 3px 10px 0 36px;
				
}
.information2 {
              
                border-color: #a2b4ee;
				background-color:#dbe3ff;
                color: #585b66;
}
</style>
<%}else{%>
<style>
.information2 {
              
                border-color: #a2b4ee;
				background-color:#dbe3ff;
                color: #585b66;
}
.notification div {
                line-height: 1.5em;
				padding: 3px 10px 0 36px;
				
}
</style>
<%}%>

</head>
<body onload="javascript:asignarzona(document.forms['form1'],'<% out.print(periodo);%>','<% out.print(buscar);%>','<% out.print(dep);%>');">
<div id="content">
<%						boolean aux=true;
						String consulta = null;
						if(buscar=="null" || buscar==""){
							consulta ="select *  from personacaso where perid='"+periodo+"' order by perradicado limit 20 offset "+dep+"";
						}else{
							consulta ="select *  from personacaso where (perid='"+periodo+"' and CAST(perradicado AS TEXT) like ('"+buscar+"%')) or  (perid='"+periodo+"' and upper(pernombre) like '%"+buscar+"%') OR (perid='"+periodo+"' and upper(perapellido) like '%"+buscar+"%') order by perradicado ";	
						}	
						ResultSet  rs=con.consultar(consulta);
						int cont = con.contar(rs);
						String[][] opes = new String[cont][7];%>
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
<%if(contt!=0){%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/tests-icon.png" width="100" height="100" />
<%}%>
</td><td bgcolor="#ffffff" valign="top" width="687" align="left"> 

 <div id="pagina_contenido">
  <div class="actualizacion">Administrador - Consultorio</div>
  <h1 >Listado de Radicados / Periodo: <%=periodo%></h1>
  <p></p><br/>
     <%if(rol.equals("Estudiante")){		
			if(rs_periodo.getString("activo").equals("1")){%>
                 <div id="msgBox_info2" class="notification_3 information_3 png_bg" >
                                <div>
                                El Periodo se encuentra desactivado. Solo puede ver los Radicados</div>
                    </div>
     <%		}
	 }else{
     	if(rs_periodo.getString("activo").equals("1")){%>
                 <div id="msgBox_info2" class="notification_3 information_3 png_bg" >
                                <div>
                                El Periodo se encuentra desactivado. Los Estudiantes solo pueden ver los Radicados</div>
                            </div>     
	<% }
	}%>          
  <div id="msgBox_info" class="notification information2 ">
					<div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="4%"><img src="img/information.png" width="16" height="16" /></td>
                        <td width="96%">- Puede Buscar por N° de Radicado y por los nombres de los demandantes. </td>
                      </tr>
                     
                    <%if(!periodo.equals("22010") && no_asignado!=0){%>
                      <tr>
                        <td>
                        <a class='iframe_fal_estu' href="carries_forms/form_9.jsp?periodo=<%=periodo%>"><img src="img/x-office-spreadsheet.png" width="16" height="16"  style="cursor:pointer"/></a></td>
                        <td>- Los Radicados que se encuentran en Rojo les falta Asignar Abogado en Formacion y son un total de <%=no_asignado%>, haga click en el icono de la izquierda para ver esos radicados</td>
                      </tr>
                       <%}%>
                      <tr>
                        <td> <a class='iframe_radi' href="carries_forms/form_8.jsp?periodo=<%=periodo%>"><img src="img/system-search.png" style="cursor:pointer" width="16" height="16" /></a></td>
                        <td>- Radicados Faltantes por Cargar, haga click en la lupita para ver cuales faltan </td>
                      </tr>
                    </table>
                    
                    </div>
				</div>
  <div id="texto_contenido"> 
<form name="form1" method="post">
<input  type="hidden" name="periodo" value="<%=periodo%>">
    <div>
<strong class="text_negro">BUSCAR RADICADO: </strong> 
<input name="buscar"  type="text"  class="text_file" size="30" onChange="javascript:while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);this.value=this.value.toUpperCase();" value="<%if(buscar=="null" || buscar==""){}else{ out.print(buscar);}%>">
                  <input name="Input3" type="button" onClick="javascript:modificar2(document.forms['form1'])" class="botones" value="  Buscar  " size="100">
                  <input name="submit2" type="reset" class="botones" value=" Limpiar " onClick="javascript:cargar(document.forms['form1']);"/>
                  </div><br/>
                
                
                  	<div align="right"  style=" padding-bottom:1px;"> 		
<%if(contt!=0){%>
		<%if(!periodo.equals("22010")){%>
		 <input name="input" type="button" class="botones" onClick="javascript:exportar(document.forms['form1'])"  value=" Exportar a Excel " />
        <%}%>
		<%if(rol.equals("Estudiante")){		
			if(rs_periodo.getString("activo").equals("0")){%>
				  <%if(cont>1){%>
                        <input name="" type="button"  onClick="javascript:modificar(document.forms['form1'])" class="botones" value="Modificar">
                            <%if(rol.equals("Admin")){%>
                                <input name="" type="button"  onClick="javascript:eliminar(this.form)" class="botones" value="Eliminar">
                            <%}%>
                  <%}if(cont==1){%>
                        <input name="" type="button"  onClick="javascript:modificar_radio(document.forms['form1'])" class="botones" value="Modificar">
                            <%if(rol.equals("Admin")){%>                  
                               <input name=""  type="button" onClick="javascript:eliminar_radio(this.form)" class="botones" value="Eliminar">
                            <%}%>
                 <%}%>
       		<input name="" type="button"  onClick="javascript:agregar(document.forms['form1'])" class="botones" value="Agregar Nuevo">
       <%	}
		}else{%>
	  		  <%if(cont>1){%>
                        <input name="" type="button"  onClick="javascript:modificar(document.forms['form1'])" class="botones" value="Modificar">
                            <%if(rol.equals("Admin")){%>
                                <input name="" type="button"  onClick="javascript:eliminar(this.form)" class="botones" value="Eliminar">
                            <%}%>
                  <%}if(cont==1){%>
                        <input name="" type="button"  onClick="javascript:modificar_radio(document.forms['form1'])" class="botones" value="Modificar">
                            <%if(rol.equals("Admin")){%>                  
                               <input name=""  type="button" onClick="javascript:eliminar_radio(this.form)" class="botones" value="Eliminar">
                            <%}%>
                 <%}%>
       		<input name="" type="button"  onClick="javascript:agregar(document.forms['form1'])" class="botones" value="Agregar Nuevo">
	  <%}
}%></div>
  <table width="600" border="0" align="center" cellpadding="2" cellspacing="0" class="fondo_tabla">
    
    <tr>
                    <td  height="17" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="8"  align="center" class="text_blanco">Listado de Casos                     </td>
                          <td height="20" colspan="3"  align="center" class="text_blanco"><%
						 if(buscar=="null" || buscar==""){ 
						  if(contt>0){%>
                            <select name="dep"  style="font-size:10px; font-family:Arial, Helvetica, sans-serif" onchange="javascript:cargarmun(document.forms['form1']);" ><%if(dep!=0){%>
       <option  value="<%=dep%>"><%=(dep+1)%> - <%=(dep+20)%> de <%=contt%></option><%}while(i<x){%>
       <option value="<%=i*ntuplas%>" onclick="javascript:cargarmun(document.forms['form1']);"><%=(i*ntuplas+1)%> - <%=((i+1)*ntuplas)%> de <%=contt%></option><%i++;}%></select>
                            <%}}%></td>
                          </tr>
                        <tr class="fondo_celda_2">
                          <td width="4%"  align="center" class="text_negro">Ver</td>
                          <td width="4%" height="20"  align="center" class="text_negro"><%if(cont>1){%>
                            <input name="checktodos"   id="checktodos" type="checkbox"  value="" />
                            <%}%>                    </td>
                          <td width="4%" align="center" class="text_negro" colspan="1">N&ordm;</td>
                          <td width="8%" align="center" class="text_negro">Radicado N&ordm; </td>
                          <td width="37%" align="center" class="text_negro" colspan="1">Nombres y Apellidos </td>
                          <td width="10%" align="center" class="text_negro" colspan="1">Fecha</td>
                          <td width="10%" align="center" class="text_negro">Hora</td>
                          <td width="7%" align="center" class="text_negro">Recibido</td>
                          <td width="10%" align="center" class="text_negro">Asignar Estudiante</td>
                        <!--  <td width="5%" align="center" class="text_negro">Ver Radicado</td> -->
                          <%if(rol.equals("Admin")){%>
                          <td width="5%" align="center" class="text_negro">Eliminar Radicado</td>
                          <%}%>
                        </tr>
                        <% 	
						
						rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
							for(int ii=0;ii<cont;ii++)
								{ 
									opes[ii][0]=rs.getString("perradicado");
									opes[ii][1]=rs.getString("pernombre");
									opes[ii][2]=rs.getString("perapellido");
									opes[ii][3]=rs.getString("perfecha");
									opes[ii][4]=rs.getString("perhora");
									opes[ii][5]=rs.getString("perrecibido");
									opes[ii][6]=rs.getString("estuid");
									rs.next();
							}	
							
							 int color = 1;
							  String fondo = null;
							  y=dep+1;
							 for(int ii=0;ii<cont;ii++){
							 				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>
                        <tr class="<%= fondo %>">
						 <%if(!periodo.equals("22010") && opes[ii][6]==null){ %>   
                          <td width="4%" align="center" class="text_negro" style=" background-color:#FF8080">
<img src="img/list-add.png" onclick="javascript:MostrarFilas('ajax_<%=opes[ii][0]%>','Op2_<%=opes[ii][0]%>'),llamadasin('carries_forms/form_11.jsp?id=<%= opes[ii][0] %>&periodo=<%=periodo%>&m=<%=Math.random()%>', 'contenido_<%=opes[ii][0]%>')" id="Op2_<%=opes[ii][0]%>" name="Op2_<%=opes[ii][0]%>" title="Ver Radicado" style="cursor:pointer;"/>
<img src="img/list-remove.png" onclick="javascript:OcultarFilas('ajax_<%=opes[ii][0]%>','Op2_<%=opes[ii][0]%>')" id="ajax_<%=opes[ii][0]%>" name="ajax_<%=opes[ii][0]%>" style="display:none" title="Ocultar" style="cursor:pointer;"/>
	 </td>                       
                          <td width="4%" height="20" align="center" class="text_negro" style=" background-color:#FF8080">
                          <%if(cont>1){%>
                          <input type="checkbox" name="cc" value="<%= opes[ii][0] %>"/>      
                          <%}if(cont==1){%>
                          <input  type="radio" name="cc" value="<%= opes[ii][0] %>"/>  
						  <%}%>                                 
						 					   </td>
                          
                          <td height="20" class="text_negro" style=" background-color: #FF8080"><div align="center"> <%=y%></div></td>
                          <td height="20" class="text_negro" style=" background-color:#FF8080"><div align="center"> <%= opes[ii][0] %></div></td>                  
                        
                          <td height="20" class="text_negro" style=" background-color:#FF8080" colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                         
                          <td height="20" class="text_negro" style=" background-color:#FF8080" colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                          <td height="20" class="text_negro" style=" background-color:#FF8080"><div align="center"><%= opes[ii][4] %></div></td>
                          <td height="20" align="center" class="text_negro" style=" background-color:#FF8080"><%=opes[ii][5]%>                              </td>
                          <td height="20" align="center" class="text_negro" style=" background-color:#FF8080">
                           <%if(rol.equals("Estudiante")){		
								if(rs_periodo.getString("activo").equals("0")){%>
                                       <a class='iframeestu' href="carries_forms/form_7.jsp?id=<%=opes[ii][0] %>&periodo=<%=periodo%>&dep=<%=dep%>">
                                      <img src="img/executive.png"  title="Asignar Estudiante" width="16" height="16" />                                      </a>
                           <%	}else{%>
                           			 <img src="img/executive2.png"  title="Asignar Estudiante" width="16" height="16" />
						   <%	}
						   }else{%>
                           		 <a class='iframeestu' href="carries_forms/form_7.jsp?id=<%=opes[ii][0] %>&periodo=<%=periodo%>&dep=<%=dep%>">
                                      <img src="img/executive.png"  title="Asignar Estudiante" width="16" height="16" />                                    </a>
                         <%}%>                          </td>
                         <!-- <td height="20" align="center" class="text_rojo">
                           <a class='iframeradi' href="carries_forms/form_6.jsp?id=<%= opes[ii][0] %>&periodo=<%=periodo%>">
                          <img src="img/edit-find.png" width="16"  title="Ver Radicado" height="16" />                          </a>                          </td> -->
                          <%if(rol.equals("Admin")){%>
                          <td height="20" align="center" class="text_negro" style=" background-color:#FF8080"><img src="img/user-trash-full.png" width="14"  title="Eliminar Radicado" height="14" onclick='javascript:actionChange2("eliminar", "<%= opes[ii][0]%>", "<%=periodo%>")' style="cursor:pointer"/></td>
                          <%}}else{%>
						   <td width="4%" align="center">
<img src="img/list-add.png" onclick="javascript:MostrarFilas('ajax_<%=opes[ii][0]%>','Op2_<%=opes[ii][0]%>'),llamadasin('carries_forms/form_11.jsp?id=<%= opes[ii][0] %>&periodo=<%=periodo%>&m=<%=Math.random()%>', 'contenido_<%=opes[ii][0]%>')" id="Op2_<%=opes[ii][0]%>" name="Op2_<%=opes[ii][0]%>" title="Ver Radicado" style="cursor:pointer;"/>
<img src="img/list-remove.png" onclick="javascript:OcultarFilas('ajax_<%=opes[ii][0]%>','Op2_<%=opes[ii][0]%>')" id="ajax_<%=opes[ii][0]%>" name="ajax_<%=opes[ii][0]%>" style="display:none" title="Ocultar" style="cursor:pointer;"/>
	 </td>                
   							  <td width="4%" height="20" align="center">
                          <%if(cont>1){%>
                          <input type="checkbox" name="cc" value="<%= opes[ii][0] %>"/>      
                          <%}if(cont==1){%>
                          <input  type="radio" name="cc" value="<%= opes[ii][0] %>"/>  
						  <%}%>                                 
						 					   </td>
                          <td height="20" class="text_negro"><div align="center"> <%=y%></div></td>
                          <td height="20" class="text_negro"><div align="center"> <%= opes[ii][0] %></div></td>                  
                        
                          <td height="20" class="text_negro" colspan="1"><div align="left"><%= opes[ii][1] %>&nbsp;&nbsp;&nbsp;<%= opes[ii][2] %></div></td>
                         
                          <td height="20" class="text_negro" colspan="1"><div align="center"><%= opes[ii][3] %></div></td>
                          <td height="20" class="text_negro"><div align="center"><%= opes[ii][4] %></div></td>
                          <td height="20" align="center" class="text_negro"><%=opes[ii][5]%>                              </td>
                          <td height="20" align="center" class="text_negro">
                          <%if(rol.equals("Estudiante")){		
								if(rs_periodo.getString("activo").equals("0")){%>
                                       <a class='iframeestu' href="carries_forms/form_7.jsp?id=<%=opes[ii][0] %>&periodo=<%=periodo%>&dep=<%=dep%>">
                                      <img src="img/executive.png" width="16" height="16"  title="Asignar Estudiante"/>                                      </a>
                            <%	}else{%>
                           			 <img src="img/executive2.png"  title="Asignar Estudiante" width="16" height="16" />
						   <%	}
						   }else{%>
                           		  <a class='iframeestu' href="carries_forms/form_7.jsp?id=<%=opes[ii][0] %>&periodo=<%=periodo%>&dep=<%=dep%>">
                                      <img src="img/executive.png" width="16" height="16"  title="Asignar Estudiante"/>                                    </a>
                         <%}%>                          </td>
                        <!--  <td height="20" align="center" class="text_negro">
                           <a class='iframeradi' href="carries_forms/form_6.jsp?id=<%= opes[ii][0] %>&periodo=<%=periodo%>">
                          <img src="img/edit-find.png" width="16" height="16"  title="Ver Radicado"/>                          </a>                          </td> -->
                          <%if(rol.equals("Admin")){%>
                            <td height="20" align="center" class="text_rojo"><img src="img/user-trash-full.png" width="14"  title="Eliminar Radicado" height="14" onclick='javascript:actionChange2("eliminar", "<%= opes[ii][0]%>", "<%=periodo%>")' style="cursor:pointer"/></td>
                           <%}}%>
                        </tr>
                         <tr align="center" class="fondo_celda_5" style="display:none" id="ajax_<%=opes[ii][0]%>" name="ajax_<%=opes[ii][0]%>">
                              <td height="20" class="text_negro" colspan="11"> <br/>
							  		<div style="height:415px; overflow:scroll;" id="contenido_<%=opes[ii][0]%>">
									</div> <br/>
								</td>
                            </tr>
                       	    <%
							y++;
							}
					}else{
					aux=false;
				 %>
                            
                            <tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="11">No se encontraron registros.</td>
                        </tr>
                       
                        <%}%>
                    </table></td>
                  </tr>
                  <%if(aux){%>                  
                  <%}else{%>
                  <tr>
                    <td height="17" align="right" valign="top" class="fondo_celda_3"><input name="" type="button"  onClick="javascript:agregar(document.forms['form1'])" class="botones" value="Agregar Nuevo"> </td>
                  </tr>
                  <%}
				
			 con.close();
			 %>         
              </table>
                   &nbsp;</p>

</form>				
<br/><br/><br/>
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