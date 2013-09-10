<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='login.jsp';
</script>
<%
}
try{
Conex con = new Conex();
Conex conn = new Conex();
boolean flag=false;
int edad=0;
String periodo=String.valueOf(request.getParameter("periodo"));
String radicado=String.valueOf(request.getParameter("id"));
ResultSet  rs=null;
String consulta = "select * from personacaso where perradicado='"+radicado+"' and perid='"+periodo+"'";		
	 rs = con.consultar(consulta);
	rs.next();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body  style="background-color:#FFFFFF">
<h1 style="font-size:16px" align="center"> Radicado Numero <%=radicado%> del Periodo <%=periodo%></h1><br/>

 
    <table width="100%" border="0">
      <tr>
        <td  align="center"><img src="images/unipamplona.png" width="59" height="74"></td>
        <td style="font-size:12px" align="center">UNIVERSIDAD DE PAMPLONA<br/>
          FACULTAD DE ARTES Y HUMANIDADES<br/>
          PROGRAMA DE DERECHO Y JURISPRUDENCIA<br/>
         CONSULTORIO JURIDICO<br/>
          FORMATO DE ATENCION AL USUARIO<br/><br/></td>
      </tr>
    </table>
  

<table width="100%" border="0" cellpadding="0" cellspacing="1"  class="fondo_tabla">
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="Estilo6 text_negro"><span class="Estilo14 Estilo6"><span class="Estilo6">FORMATO N&deg; 02 </span></span></td>
                              <td height="20" align="center" class="Estilo6 text_negro"><span class="Estilo14 Estilo6"><span class="Estilo6">FECHA: &nbsp;&nbsp;
                            <%=rs.getString("perfecha")%>
                           </span></span></td>
                              <td height="20" align="center" class="Estilo6 text_negro"><span class="Estilo14 Estilo6"><span class="Estilo6">HORA: 
							   
							  </span></span></td>
                              <td width="35%" height="20" colspan="2"  align="center" class="Estilo6 text_negro"><span class="Estilo14 Estilo6"><span class="Estilo6">RADICADO No.</span>  
                               
					             &nbsp;&nbsp;<%=rs.getString("perradicado")%>
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="text_blanco Estilo11 Estilo6"> INFORMACION PERSONAL
                              <input name="periodo"  type="hidden"  value="<%=periodo%>" ></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td width="22%" height="20"  align="center" class="text_negro" > Nombre </td>
                              <td width="27%" height="20"  align="center" class="text_negro" >Apellido</td>
                              <td width="16%"  align="center" class="text_negro" >Sexo</td>
                              <td height="20" colspan="3"  align="center" class="text_negro" >Edad</td>
                            </tr>
                            
                            <tr class="fondo_celda_5">
                              <td height="20"  align="center" class="text_negro" ><%=rs.getString("pernombre")%></td>
                              <td height="20"  align="center" class="text_negro" ><%=rs.getString("perapellido")%></td>
                              <td height="20"  align="center"><span class="text_negro">
                               <%=rs.getString("persexo")%>
                              </span></td>
                              <td height="20" colspan="2"   align="center" class="text_negro"><%=rs.getString("peredad")%>
a&ntilde;os 
                                &nbsp;&nbsp;&nbsp;<%=rs.getString("perrango")%></td>
                            </tr>  
                            <tr class="fondo_celda_2">
                              
                              <td height="20" align="center"class="text_negro">Documento de Identificacion </td>
                              <td height="20" align="center"class="text_negro">Numero de Documento </td>
                              <td width="16%" align="center"class="text_negro">Lugar de Expedicion </td>
                              <td height="20" colspan="2"  align="center"class="text_negro">Nacionalidad</td>
                            </tr>
                            
                            <tr class="fondo_celda_5">
                              
                         <td height="20" align="center" class="text_negro"><%=rs.getString("pertipodocumento")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perdocumento")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perlugarexpedicion")%></td>
                              <td height="20" colspan="2" align="center" class="text_negro"><%=rs.getString("pernacionalidad")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Libreta Militar </td>
                              <td height="20" align="center" class="text_negro">N&ordf; de la Libreta Militar </td>
                              <td height="20" colspan="3" align="center" class="text_negro">Distrito Militar </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perlibretamilitar")%></td>
                              <td height="20" align="center" class="text_negro">
							  <%if(rs.getString("perlibretamilitar").equals("NO POSEE")){
								  out.print("NO POSEE");
							  }else{
							  	out.print(rs.getString("pernumerolibreta"));
								}  %></td>
                              <td height="20" colspan="3" align="center" class="text_negro">
							   <%if(rs.getString("perlibretamilitar").equals("NO POSEE")){
								  out.print("NO POSEE");
							  }else{
							  	out.print(rs.getString("perdistritomilitar"));
								}  %></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Direccion</td>
                              <td height="20" align="center" class="text_negro">Municipio</td>
                              <td height="20" colspan="2"  align="center" class="text_negro">Embarazada</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><%=rs.getString("perdireccion")%></td>
                              <td height="0" align="center" class="text_negro" ><%=rs.getString("municipio")%></td>
                              <td height="0" colspan="2"  align="center" class="text_negro" ><span class=" text_negro"><%=rs.getString("embarazada")%>
                              
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"  align="center" class="text_negro">Telefono: Fijo y Celular </td>
                              <td height="20" align="center" class="text_negro">Correo Electronico </td>
                              <td height="20" colspan="3" align="center" class="text_negro">Sisben</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("pertelefono")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("peremail")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("persisben")%></td>
                              <td height="20" colspan="2" align="center" class="text_negro" >Numero:   &nbsp;&nbsp;&nbsp;<%=rs.getString("pernumero")%>
                        
                       </td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Discapacidad</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20"  align="center" class="text_negro"><span class=" text_negro">
                                <%=rs.getString("perdiscapacidad")%>
                              </span></td>
                              <td height="20" colspan="4" align="center" class="text_negro">Tipo de Discapacidad: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%=rs.getString("pertipodisca")%></td>
                            </tr>
                            <tr class="fondo_celda_2"  >
                              <td height="20" colspan="5"  align="center" class="text_negro">Grupo Etnico o Afrodescendiente </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><span class=" text_negro">
                              <%=rs.getString("pergrupoetnico")%>
                              </span></td>
                              <td height="20" colspan="4" align="center" class=" text_negro"><span class="text_negro">
                                &iquest;Cual?: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%=rs.getString("percualetnico")%>
                              </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Nivel de Escolaridad</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center"  class="text_negro"><%=rs.getString("pernivelescola")%></td>
                              <td height="20" colspan="4" align="center" class="text_negro">Otro: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%=rs.getString("percualnivel")%></td>
                            </tr>
                            
                            <tr class="fondo_celda_1">
                              <td height="25" colspan="5" align="center" class="Estilo6 text_blanco">INFORMACION FAMILIAR </td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Tipo de Familia </td>
                              <td height="20" align="center" class="text_negro">Modo de Familia </td>
                              <td height="20" colspan="3" align="center" class="text_negro">N&ordm; de Personas del Nucleo Familiar </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("pertipofamilia")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("permodofamil")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("pernumfamilia")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Estado Civil </td>
                              <td height="20" colspan="4" align="center" class="text_negro">Nombre del
                                
                              o la Conyuge o del o la Compa&ntilde;ero(a) Permanente </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perestadocivil")%></td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=rs.getString("perconyuge")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Nombre de Familiar Allegado </td>
                              <td height="20" colspan="3" align="center" class="text_negro">N&deg; Telefono Fijo </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><%=rs.getString("perallegado")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("perfijo")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Direccion</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Telefono Celular </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><%=rs.getString("perdireccionalle")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("percelular")%></td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="text_blanco"><span class="Estilo6">RESOLUCION DE CONFLICTOS </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Manejo de Autoridad (Quien toma decisiones en el hogar)</td>
                              <td height="20" align="center" class="text_negro">Quien Sanciona</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Aporte Economico a la Comunidad Familiar</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perautoridad")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("persanciona")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("peraporte")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Frecuencia con que se presentan los conflictos en el hogar</td>
                              <td height="20" align="center" class="text_negro">Factor que ocasiona el conflicto</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Autores del Conflicto</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perconflictos")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perfactor")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("parautor")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Tipo de Vivienda</td>
                              <td height="20" align="center" class="text_negro">Tenencia</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Servicios</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("pervivienda")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("pertenencia")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><table width="339" align="center">
                                <tr class="fondo_celda_5">
                                  <td width="64"><%if(rs.getString("peragua").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("peragua")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("perluz").equals("null")){%>
							  -
							   <%}else{%>
							  <%=rs.getString("perluz")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("pertelefonos").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("pertelefonos")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("peralcantarillado").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("peralcantarillado")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("paralumbrado").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("paralumbrado")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("peraseo").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("peraseo")%>  <%}%><p>
                                </td>
                                </tr>
                              </table>
                            </td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="text_blanco"><span class="Estilo6">INFORMACION LABORAL</span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Ocupacion</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("perocupacion")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Actualmente se encuentra laborando</td>
                              <td height="20" align="center" class="text_negro">Salario Devengado $ </td>
                              <td height="20" colspan="3" align="center" class="text_negro">Tipo de Trabajo</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perlabora")%></td>
                              <td height="20" align="center" class="text_negro"><%=rs.getString("persalario")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("pertipotra")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Empresa donde presta el Servicio</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Clase de Contrato</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><%=rs.getString("perempresa")%></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("perclase")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="2" align="center" class="text_negro">Se encuentra Afiliado a la Seguridad Social</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Ocupacion de Conyuge o Compa&ntilde;ero(a)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><label>
							  <%if(rs.getString("persalud").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("persalud")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("perpension").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("perpension")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("perarp").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("perarp")%>
							  <%}%>
							  &nbsp;&nbsp;&nbsp;
							  <%if(rs.getString("perotro").equals("null")){%>
							  -
							  <%}else{%>
							  <%=rs.getString("perotro")%><%}%></label>
                              <br></td>
                              <td height="20" colspan="3" align="center" class="text_negro"><%=rs.getString("perocupaconyu")%></td>
                            </tr>							
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="text_blanco"><span class="Estilo6">HISTORIAL DE ATENCION</span></td>
                            </tr>
							<%if(rs.getString("perdesplazado").equals("NO")){%>   
							<tr class="fondo_celda_2">
                              <td height="20" align="center" colspan="5" class="text_negro">Se encuentra en situacion de Desplazamiento</td>                              
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" colspan="5" class="text_negro"><%=rs.getString("perdesplazado")%> </td>                              
                            </tr>
							<%}if(rs.getString("perdesplazado").equals("SI")){%>   
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Se encuentra en situacion de Desplazamiento</td>
                              <td height="20" colspan="4" align="center" class="text_negro">Lugar de Desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perdesplazado")%>                            </td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=rs.getString("perlugardes")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" align="center" class="text_negro">Fecha del Desplazamiento</td>
                              <td height="20" colspan="4" align="center" class="text_negro">Motivo del Desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perfechades")%></td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=rs.getString("permotivo")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Actor Armado que produce el desplazamiento</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("perarmado")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Grupo familiar con el que se desplaza</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("pergrupo")%></td>
                            </tr>
							
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Se encuentra incluido dentro del RUPD</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("perrupd")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Relacion de Orientacion o asesorias de publica o privada recibidas</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("perrelacion")%></td>
                            </tr>
							<tr class="fondo_celda_2">							
                              <td height="20" align="center" class="text_negro">Ha iniciado acciones juridicas previas</td>
                              <td height="20" colspan="4" align="center" class="text_negro">Cuales</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" align="center" class="text_negro"><%=rs.getString("perjuridica")%></td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=rs.getString("percuales")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Modalidad de la Atencion</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("permodalidad")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Caso (Exposicion de la ruta de acceso al derecho)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("percaso")%></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20" colspan="5" align="center" class="text_negro">Asesoria: (El derecho a proteger - Ruta de Acceso al Derecho)</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro"><%=rs.getString("perasesoria")%></td>
                            </tr>
							<%}%>
                            <tr class="fondo_celda_1" >
                              <td height="25" colspan="5" align="center" class="text_blanco"><span class="Estilo6">BREVE EXPOSICION DE LA CONSULTA</span></td>
                            </tr>
                            
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro">
							
                  <%=rs.getString("perexposicion")%>
							  </td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="Estilo6 text_blanco">AREA DE CONSULTA </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro">
							  <%=rs.getString("perarea")%>
</p>						      </td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="5" align="center" class="text_blanco"><span class="Estilo6">OBERVACIONES</span></td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="5" align="center" class="text_negro">
						<%=rs.getString("perobservaciones")%>
							  </td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="20" colspan="2" align="center" class="text_blanco"><span class="Estilo6">RELACION DE DOCUMENTOS RECIBIDOS </span></td>
                              <td height="20" colspan="3" align="center" class="text_blanco"><span class="Estilo6">RECIBIDO</span></td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20" colspan="2" align="center" class="text_negro"><span class="text_negro">
                           <%=rs.getString("perdocumentos")%>
                              
                               
                              </span></td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=rs.getString("perrecibido")%></td>
                            </tr>
                            <tr class="fondo_celda_1">
                              <td height="25" colspan="5" align="center" class="text_blanco"><span class="Estilo6">ABOGADO EN FORMACION QUE RECEPCIONA </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"align="center" class="text_negro">Nombres</td>
                              <td align="center" class="text_negro">Apellidos</td>
                              <td height="20"  colspan="4" align="center" class="text_negro">Documento de Indentificacion </td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20"align="center" class="text_negro"><%=rs.getString("perabogado")%>
                              </td>
                              <td align="center" class="text_negro"><%=rs.getString("perapeabog")%></td>
                              <td height="20"  colspan="4" align="center" class="text_negro"><%=rs.getString("perdocu")%></td>
                            </tr>
                             <tr class="fondo_celda_1">
                              <td height="20"  colspan="6"align="center" class="text_negro"><span class="text_blanco">ABOGADO EN FORMACION ASIGNADO</span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"align="center" class="text_negro">Nombre</td>
                              <td align="center" class="text_negro">Apellido</td>
                              <td height="20" colspan="3" align="center" class="text_negro">Documento de Identificacion</td>
                            </tr>
                            <%String es=rs.getString("estuid");							
							if(es==null){%>							
							 <tr class="fondo_celda_5">
                             <td height="20" colspan="6"align="center" class="text_negro">No posee Abogado Asignado</td>
                            </tr>
							<%}	if(es!=null){
									Conex con3 = new Conex();
									String consultas = "select * from estudiantes where estuid='"+es+"'";		
									ResultSet  ress=con3.consultar(consultas);
									ress.next();%>	
                            <tr class="fondo_celda_5" >
                              <td height="20"align="center" class="text_negro"><%=ress.getString("nombre")%></td>
                              <td align="center" class="text_negro"><%=ress.getString("apellido")%></td>
                              <td height="20" colspan="4" align="center" class="text_negro"><%=ress.getString("identificacion")%></td>
                            </tr><%}%>
                            
                            <tr class="fondo_celda_1">
                              <td height="23" colspan="5"align="center" class="text_blanco"><span class="Estilo6">ABOGADO EN FORMACION QUE SISTEMATIZA </span></td>
                            </tr>
                            <tr class="fondo_celda_2">
                              <td height="20"align="center" class="text_negro">Nombre</td>
                              <td align="center" class="text_negro">Apellido</td>
                              <td height="20"  colspan="4" align="center" class="text_negro">Documento de Identidad</td>
                            </tr>
                            <tr class="fondo_celda_5">
                              <td height="20"align="center" class="text_negro"><%=rs.getString("perabogadoss")%></td>
                              <td align="center" class="text_negro"><%=rs.getString("perapeabogss")%></td>
                              <td height="20"  colspan="4" align="center" class="text_negro"><%=rs.getString("perdocuss")%></td>
                            </tr>
                        </table>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp");
}%>
