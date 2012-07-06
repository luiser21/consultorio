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
Conex confechas = new Conex();
ResultSet  rsfechas = confechas.consultar("sELECT Min(perfecha) as min, Max(perfechafinal) as max FROM periodo");	
rsfechas.next();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona - Eventos</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">

</head>
<body onload="window.print()" >
<div id="texto_contenido">
<div align="center">
<p class="text_negro">UNIVERSIDAD DE PAMPLONA<br/>
  FACULTAD DE ARTES Y HUMANIDADES<br/>
  PROGRAMA DE DERECHO Y JURISPRUDENCIA<br/>
  CONSULTORIO JURIDICO<br/>
SEDE VILLA DEL ROSARIO
  
</div>
  <p class="text_negro">
    
    <span  style="
	margin:0;
	padding:0;
	font-size:20px;
	color:#036;
	font-weight:normal;
	line-height:normal;
	font-family:"trebuchet MS", tahoma, arial;

	"><span >INFORME GLOBAL </span></span></p>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
             
              <tr> 
                <td height="91"><table width="600" border="0" align="center" cellpadding="1" cellspacing="0"  class="fondo_tabla">
                  <tr>
                    <td valign="top" height="17">
                      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="ffffff">
                        <tr class="fondo_celda_1">
                          <td height="20" colspan="13" align="center" class="text_blanco">Listado de Totales </td>
                        </tr>
                        <tr class="fondo_celda_2">
                          <td height="20" colspan="8"  align="center" class="text_negro">Numero de Casos Recepcionados </td>
                          <td colspan="5" align="center" class="text_negro">Fecha</td>
						  </tr>
                        <% 	
							boolean aux=true;
							Conex con = new Conex();
							ResultSet  rs = con.consultar("select count(perradicado) as total, (select COUNT(persexo) AS m from personacaso where persexo='MASCULINO') AS m, (select COUNT(persexo) AS f from personacaso where persexo='FEMENINO') AS f, (select max(peredad) as m from personacaso) AS maxedad, (select min(peredad) as minedad from personacaso) as minedad, (select count(pertipodocumento) as cedula from personacaso where pertipodocumento='CC') as cedula, (select count(pertipodocumento) as ti from personacaso where pertipodocumento='TI') as ti, (select count(pertipodocumento) as ce from personacaso where pertipodocumento='CE') as ce, (select count(pertipodocumento) as rut from personacaso where pertipodocumento='RUT') as rut, (select count(pertipodocumento) as nit from personacaso where pertipodocumento='NIT') as nit, (select count(pertipodocumento) as pas from personacaso where pertipodocumento='PASAPORTE') as pas, (select count(pernacionalidad) as co from personacaso where pernacionalidad='COLOMBIANA') as co, (select count(pernacionalidad) as ve from personacaso where pernacionalidad='VENEZOLANA') as ve, (select count(pernacionalidad) as ot from personacaso where pernacionalidad='OTRO') as ot, (select((select count(pernumero) as sis from personacaso) - (select count(pernumero) as sis from personacaso where pernumero='NO'))) as to, (select count(perlibretamilitar) as pri from personacaso where perlibretamilitar='PRIMERA') as primera, (select count(perlibretamilitar) as seg from personacaso where perlibretamilitar='SEGUNDA') as seg, (select count(perlibretamilitar) as np from personacaso where perlibretamilitar='NO POSEE') as np, (select count(pernumero) as uno from personacaso where pernumero='UNO') as uno, (select count(pernumero) as dos from personacaso where pernumero='DOS') as dos, (select count(pernumero) as no from personacaso where pernumero='NO') as  no, (select COUNT(perdiscapacidad) AS dis from personacaso where perdiscapacidad='NO') as dis, (select COUNT(perdiscapacidad) AS diss from personacaso where perdiscapacidad='SI') as diss, (select COUNT(pergrupoetnico) as gruno from personacaso where pergrupoetnico='NO') as  gruno, (select COUNT(pergrupoetnico) as grusi from personacaso where pergrupoetnico='SI') as grusi, (select COUNT(pernivelescola) AS pri from personacaso where pernivelescola='PRIMARIA') as pri, (select COUNT(pernivelescola) AS secu from personacaso where pernivelescola='SECUNDARIA') as secu, (select COUNT(pernivelescola)  as tec from personacaso where pernivelescola='TECNICO') as tec, (select COUNT(pernivelescola) as tecno from personacaso where pernivelescola='TECNOLOGO') as tecno, (select COUNT(pernivelescola) as uni from personacaso where pernivelescola='UNIVERSIDAD') as uni, (select COUNT(pernivelescola) as otro from personacaso where pernivelescola='OTRO') as otro, (select COUNT(pernivelescola) as nopo from personacaso where pernivelescola='NO POSEE') as nopo, (select COUNT(pertipofamilia) as  mono  from personacaso where pertipofamilia='MONOPARENTAL') as mono, (select COUNT(pertipofamilia) AS nuclear from personacaso where pertipofamilia='NUCLEAR') as nuclear, (select COUNT(pertipofamilia) as extensa from personacaso where pertipofamilia='EXTENSA') as extensa, (select COUNT(perestadocivil) as sol from personacaso where perestadocivil='SOLTERO') as sol, (select COUNT(perestadocivil) AS cas from personacaso where perestadocivil='CASADO') as cas, (select COUNT(perestadocivil) AS viudo from personacaso where perestadocivil='VIUDO') as viudo, (select COUNT(perestadocivil) as div from personacaso where perestadocivil='DIVORCIADO') as div, (select COUNT(perestadocivil) as libre from personacaso where perestadocivil='UNION LIBRE') as libre, (select COUNT(perestadocivil) as estado from personacaso where perestadocivil='OTRO') as estado, (SELECT COUNT(perpension) as pension from personacaso where perpension!='null') as pension, (SELECT COUNT(persalud) as salud from personacaso where persalud!='null') as salud, (SELECT COUNT(perarp) as arp from personacaso where perarp!='null') as arp, (SELECT COUNT(perotro) as perotro from personacaso where perotro!='null') as perotro, (select COUNT(perlabora) AS labora from personacaso where perlabora='SI') as labora, (select COUNT(perlabora) as laborano from personacaso where perlabora='NO') as laborano, (select COUNT(pertipotra) AS tipo from personacaso where pertipotra='INDEPENDIENTE') as tipo, (select COUNT(pertipotra) as asa from personacaso where pertipotra='ASALARIADO') as asa, (select COUNT(pertipotra) as trabajo from personacaso where pertipotra='NO') as trabajo, (select COUNT(perclase) as fijo from personacaso where perclase='A TERMINO FIJO') as fijo, (select COUNT(perclase) as ops from personacaso where perclase='PRESTACION DE SERVICIOS') as ops, (select COUNT(perclase) as inde from personacaso where perclase='INDEFINIDO') as inde, (select COUNT(perclase) as claseno from personacaso where perclase='NO POSEE') as claseno, (select COUNT(perclase) as claseotro from personacaso where perclase='OTRO') as claseotro, (select COUNT(perconflictos) as diario from personacaso where perconflictos='DIARIO') as diario, (select COUNT(perconflictos) as semanal from personacaso where perconflictos='SEMANAL') as semanal, (select COUNT(perconflictos) as ocasional from personacaso where perconflictos='OCASIONAL') as ocasional, (select COUNT(perconflictos) as anual from personacaso where perconflictos='ANUAL') as anual, (select COUNT(perfactor) as economico from personacaso where perfactor='ECONOMICO') as economico, (select COUNT(perfactor) as escolar from personacaso where perfactor='ESCOLAR') as escolar, (select COUNT(perfactor) as roles from personacaso where perfactor='MANEJO DE ROL') as roles, (select COUNT(perfactor) as autoridad from personacaso where perfactor='MANEJO DE AUTORIDAD') as autoridad, (select COUNT(parautor) as padre from personacaso where parautor='PADRE-MADRE') as padre, (select COUNT(parautor) as hijo from personacaso where parautor='PADRE-HIJOS') as hijo, (select COUNT(parautor) as hermano from personacaso where parautor='HERMANOS') as hermano, (select COUNT(parautor) as otro from personacaso where parautor='OTROS')as perotros, (select COUNT(pervivienda) as casa from personacaso where pervivienda='CASA') as casa,	(select COUNT(pervivienda) as apto from personacaso where pervivienda='APTO') as apto, (select COUNT(pervivienda) as habitacion from personacaso where pervivienda='HABITACION') as habitacion, (select COUNT(pervivienda) as rancho from personacaso where pervivienda='RANCHO') as rancho, (select COUNT(pervivienda) as lote from personacaso where pervivienda='CASA LOTE') as lote, (select COUNT(pervivienda) as otros from personacaso where pervivienda='OTRO') as perviviotros, (select COUNT(pertenencia) as propia from personacaso where pertenencia='PROPIA') as propia, (select COUNT(pertenencia) as arrendada from personacaso where pertenencia='ARRENDADA') as arrendada, (select COUNT(pertenencia) as amortizada from personacaso where pertenencia='AMORTIZADA') as amortizada, (select COUNT(pertenencia) as inquilinato from personacaso where pertenencia='INQUILINATO') as inquilinato, (select COUNT(pertenencia) as sucesion from personacaso where pertenencia='SUCESION') as sucesion, (select COUNT(pertenencia) as otrosvi from personacaso where pertenencia='OTRO') as otrosvi, (select COUNT(pertenencia) as invasion from personacaso where pertenencia='INVASION') as invasion, (select COUNT(pertenencia) as hipoteca from personacaso where pertenencia='HIPOTECA') as hipoteca, (select COUNT(perdesplazado) as si from personacaso where perdesplazado='SI') as si, (select COUNT(perdesplazado) as no from personacaso where perdesplazado='NO') as nodesplazado, (select COUNT(perjuridica) as sii from personacaso where perjuridica='SI') as sii, (select COUNT(perjuridica) as noo from personacaso where perjuridica='NO') as noo, (select COUNT(perarea) AS publica from personacaso where perarea='PUBLICA') as publica, (select COUNT(perarea) AS privada from personacaso where perarea='PRIVADA') as privada, (select COUNT(perarea) AS laboral from personacaso where perarea='LABORAL') as laboral, (select COUNT(perarea) AS penal from personacaso where perarea='PENAL') as penal, (select COUNT(peragua) AS agua from personacaso where peragua='Agua') as agua, (select COUNT(perluz) AS luz from personacaso where perluz='Luz') as luz, (select COUNT(peralcantarillado) AS agua from personacaso where peralcantarillado='Alcantarillado') as alcantarillado, (select COUNT(paralumbrado) AS luz from personacaso where paralumbrado='Alumbrado Publico') as alumbrado, (select COUNT(pertelefonos) AS luz from personacaso where pertelefonos='Telefono') as telefono, (select COUNT(peraseo) AS luz from personacaso where peraseo='Recoleccion de Aseo') as aseo, (SELECT count(perrango) as rango4  FROM personacaso where  perrango='25 - 35 anos') as rango4, (SELECT count(perrango) as rango4  FROM personacaso where  perrango='18 - 25 anos') as rango3, (SELECT count(perrango) as rango4  FROM personacaso where perrango='35 - 50 anos') as rango5, (SELECT count(perrango) as rango4  FROM personacaso where  perrango='mayor 50 anos') as rango6, (SELECT count(perrango) as rango4  FROM personacaso where perrango='0 - 14 anos') as rango1, (SELECT count(perrango) as rango4  FROM personacaso where perrango='14 - 18 anos') as rango2 from personacaso");	
							int cont = con.contar(rs);
							String[][] opes = new String[cont][101];
							rs.beforeFirst();
							if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getString("total");
									opes[i][1]=rs.getString("m");
									opes[i][2]=rs.getString("f");
									opes[i][3]=rs.getString("maxedad");
									opes[i][4]=rs.getString("minedad");
									opes[i][5]=rs.getString("cedula");
									opes[i][6]=rs.getString("ti");
									opes[i][7]=rs.getString("ce");
									opes[i][8]=rs.getString("rut");
									opes[i][9]=rs.getString("nit");
									opes[i][10]=rs.getString("pas");
									opes[i][11]=rs.getString("co");
									opes[i][12]=rs.getString("ve");
									opes[i][13]=rs.getString("ot");
									opes[i][14]=rs.getString("to");
									opes[i][15]=rs.getString("primera");
									opes[i][16]=rs.getString("seg");
									opes[i][17]=rs.getString("np");
									opes[i][18]=rs.getString("uno");
									opes[i][19]=rs.getString("dos");
									opes[i][20]=rs.getString("no");
									opes[i][21]=rs.getString("dis");
									opes[i][22]=rs.getString("diss");
									opes[i][23]=rs.getString("gruno");
									opes[i][24]=rs.getString("grusi");
									opes[i][25]=rs.getString("pri");
									opes[i][26]=rs.getString("secu");
									opes[i][27]=rs.getString("tec");
									opes[i][28]=rs.getString("tecno");
									opes[i][29]=rs.getString("uni");
									opes[i][30]=rs.getString("otro");
									opes[i][31]=rs.getString("nopo");
									opes[i][32]=rs.getString("mono");
									opes[i][33]=rs.getString("nuclear");
									opes[i][34]=rs.getString("extensa");
									opes[i][35]=rs.getString("sol");
									opes[i][36]=rs.getString("cas");
									opes[i][37]=rs.getString("viudo");
									opes[i][38]=rs.getString("div");
									opes[i][39]=rs.getString("libre");
									opes[i][40]=rs.getString("estado");
									opes[i][41]=rs.getString("pension");
									opes[i][42]=rs.getString("salud");
									opes[i][43]=rs.getString("arp");
									opes[i][44]=rs.getString("perotro");
									opes[i][45]=rs.getString("labora");
									opes[i][46]=rs.getString("laborano");
									opes[i][47]=rs.getString("tipo");
									opes[i][48]=rs.getString("asa");
									opes[i][49]=rs.getString("trabajo");
									opes[i][50]=rs.getString("fijo");
									opes[i][51]=rs.getString("ops");
									opes[i][52]=rs.getString("inde");
									opes[i][53]=rs.getString("claseno");
									opes[i][54]=rs.getString("claseotro");
									opes[i][55]=rs.getString("diario");
									opes[i][56]=rs.getString("semanal");
									opes[i][57]=rs.getString("ocasional");
									opes[i][58]=rs.getString("anual");
									opes[i][59]=rs.getString("economico");
									opes[i][60]=rs.getString("escolar");
									opes[i][61]=rs.getString("roles");
									opes[i][62]=rs.getString("autoridad");
									opes[i][63]=rs.getString("padre");
									opes[i][64]=rs.getString("hijo");
									opes[i][65]=rs.getString("hermano");
									opes[i][66]=rs.getString("perotros");
									opes[i][67]=rs.getString("casa");
									opes[i][68]=rs.getString("apto");
									opes[i][69]=rs.getString("habitacion");
									opes[i][70]=rs.getString("rancho");
									opes[i][71]=rs.getString("lote");
									opes[i][72]=rs.getString("perviviotros");
									opes[i][73]=rs.getString("propia");
									opes[i][74]=rs.getString("arrendada");
									opes[i][75]=rs.getString("amortizada");
									opes[i][76]=rs.getString("inquilinato");
									opes[i][77]=rs.getString("sucesion");
									opes[i][78]=rs.getString("otrosvi");
									opes[i][79]=rs.getString("invasion");
									opes[i][80]=rs.getString("hipoteca");
									opes[i][81]=rs.getString("si");
									opes[i][82]=rs.getString("nodesplazado");
									opes[i][83]=rs.getString("sii");
									opes[i][84]=rs.getString("noo");
									opes[i][85]=rs.getString("publica");
									opes[i][86]=rs.getString("privada");
									opes[i][87]=rs.getString("laboral");
									opes[i][88]=rs.getString("penal");
									opes[i][89]=rs.getString("agua");
									opes[i][90]=rs.getString("luz");
									opes[i][91]=rs.getString("alcantarillado");
									opes[i][92]=rs.getString("alumbrado");
									opes[i][93]=rs.getString("telefono");
									opes[i][94]=rs.getString("aseo");																	
									opes[i][95]=rs.getString("rango4");
									opes[i][96]=rs.getString("rango1");
									opes[i][97]=rs.getString("rango2");
									opes[i][98]=rs.getString("rango3");
									opes[i][99]=rs.getString("rango5");
									opes[i][100]=rs.getString("rango6");
									rs.next();
								}								
								 int color = 1;
								 String fondo = null;
								 for(int i=0;i<cont;i++){				    
									  fondo = "fondo_celda_5";
									  if ((color%2)==0)
										fondo = "fondo_celda_5";
									  color += 1;
							%>
                        <tr class="fondo_celda_5">
                          <td height="20" colspan="8" align="center" class="text_negro" ><div align="center"><%= opes[i][0] %></div></td>
                          <td height="20" colspan="5" class="text_negro"><div align="center">Desde el&nbsp;&nbsp;<%					  
						  out.print(rsfechas.getString("min")); %>&nbsp;&nbsp;Hasta el&nbsp;&nbsp;<%=rsfechas.getString("max") %></div></td>
						  </tr>
								
                         <tr class="fondo_celda_1">
                          <td height="20" colspan="5" align="center" class="text_blanco" ><div align="center">Tipo de Genero</div>                            <div align="center"></div></td>
                          <td height="20" colspan="9" align="center" class="text_blanco" >Edades Comprendidas en a&ntilde;os</td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="3" align="center" class="text_negro" >Sexo Masculino </td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Sexo Femenino</td>
                            <td height="20" align="center" class="text_negro" >0 - 14 </td>
                            <td align="center" class="text_negro" >14 - 18 </td>
                            <td align="center" class="text_negro" >18 - 25</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >25 - 35</td>
                            <td height="20" align="center" class="text_negro" >35 - 50</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >mayor a  50 </td>
                            </tr>
                          <tr class="fondo_celda_5">
						  
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][1] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][2] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][96] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][97] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][98] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][95] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][99] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][100] %></td>
                            </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="8" align="center" class="text_blanco" >Tipo de Documento </td>
                            <td height="20" colspan="5" align="center" class="text_blanco" >Nacionalidad</td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td width="27" height="20" align="center" class="text_negro" >CC  </td>
                            <td width="42" align="center" class="text_negro" >TI</td>
                            <td colspan="2" align="center" class="text_negro" >CE </td>
                            <td width="52" align="center" class="text_negro" >RUT </td>
                            <td width="50" align="center" class="text_negro" >NIT </td>
                            <td height="20" colspan="2" align="center" class="text_negro" >PASAPORTE </td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Colombiana</td>
                            <td colspan="2" align="center" class="text_negro" >Venezolana</td>
                            <td width="70" align="center" class="text_negro" >Otros</td>
                          </tr>
                          <tr class="fondo_celda_5">
						    <td height="20" align="center" class="text_negro" ><%= opes[i][5] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][6] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][7] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][8] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][9] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][10] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][11] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][12] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][13] %></td>
                          </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="8" align="center" class="text_blanco" >Hombres con Libreta Militar </td>
                            <td height="20" colspan="5" align="center" class="text_blanco" >Personas que poseen SISBEN = <%= opes[i][14] %></td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="4" align="center" class="text_negro" >Primera</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Segunda</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >No Posee </td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Nivel 1 </td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Nivel 2 </td>
                            <td height="20" align="center" class="text_negro" >No Poseen </td>
                          </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="4" align="center" class="text_negro" ><%= opes[i][15] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][16] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][17] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][18] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][19] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][20] %></td>
                          </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="6" align="center" class="text_blanco" >Personas con Discapacidad </td>
                            <td height="20" colspan="7" align="center" class="text_blanco" >Personas pertenecientes a Grupos Etnicos </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="4" align="center" class="text_negro" >NO</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >SI</td>
                            <td height="20" colspan="4" align="center" class="text_negro" >NO</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >SI</td>
                            </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="4" align="center" class="text_negro" ><%= opes[i][21] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][22] %></td>
                            <td height="20" colspan="4" align="center" class="text_negro" ><%= opes[i][23] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][24] %></td>
                            </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="8" align="center" class="text_blanco" >Personas Con nivel de Escolaridad </td>
                            <td height="20" colspan="5" align="center" class="text_blanco" >Tipo de Familias </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="2" align="center" class="text_negro" >Primaria</td>
                            <td width="46" height="20" align="center" class="text_negro" >Secundaria</td>
                            <td width="41" align="center" class="text_negro" >Tecnico</td>
                            <td height="20" align="center" class="text_negro" >Tecnologo</td>
                            <td height="20" align="center" class="text_negro" >Universidad</td>
                            <td width="46" height="20" align="center" class="text_negro" >Otro</td>
                            <td width="50" align="center" class="text_negro" >No Posee</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Monoparental</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Nuclear</td>
                            <td height="20" align="center" class="text_negro" >Extensa</td>
                          </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][25] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][26] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][27] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][28] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][29] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][30] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][31] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][32] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][33] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][34] %></td>
                          </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" >Estado Civil </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="3" align="center" class="text_negro" >Soltero</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Casado</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Viudo</td>
                            <td height="20" align="center" class="text_negro" >Divorciado</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Union Libre</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Otro</td>
                            </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][35] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][36] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][37] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][38] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][39] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][40] %></td>
                            </tr>
							<tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" >Informacion Laboral </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="3" align="center" class="text_negro" >Personas que Laboran </td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Tipos de Trabajo </td>
                            <td height="20" colspan="7" align="center" class="text_negro" >Clase de Contrato </td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20" colspan="2" align="center" class="text_negro" >SI</td>
                            <td height="20" align="center" class="text_negro" >NO</td>
                            <td width="41" height="20" align="center" class="text_negro" >INDP.</td>
                            <td height="20" align="center" class="text_negro" >ASAL.</td>
                            <td height="20" align="center" class="text_negro" >NO</td>
                            <td width="46" height="20" align="center" class="text_negro" >OPS</td>
                            <td width="50" align="center" class="text_negro" >INDEF</td>
                            <td height="20"   colspan="2" align="center" class="text_negro" >FIJO</td>
                            <td width="77" align="center" class="text_negro" >OTRO</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >NO </td>
                          </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][45] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][46] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][47] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][48] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][49] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][51] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][52] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%=opes[i][50] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][54] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][53] %></td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="13" align="center" class="text_negro" >Se encuentra afiliado a la Seguridad Social </td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20" colspan="4" align="center" class="text_negro" >Salud</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Pensi&oacute;n</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >ARP</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Otro</td>
                            </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="4" align="center" class="text_negro" ><%= opes[i][42]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][41]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][43]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][44]%></td>
                            </tr>
							<tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" >Resoluci&oacute;n de Conflictos </td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="6" align="center" class="text_negro" >Frecuencia en que se presentan los Conflictos en el Hogar </td>
                            <td height="20" colspan="7" align="center" class="text_negro" >Factor que ocasiona el conflicto </td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td width="27"  colspan="2" height="20" align="center" class="text_negro" > Diario</td>
                            <td width="46"  colspan="2" height="20" align="center" class="text_negro" >Semanal</td>
                            <td width="52" height="20" align="center" class="text_negro" >Ocasional</td>
                            <td height="20" align="center"  colspan="2" class="text_negro" >Anual</td>
                            <td width="50" height="20" align="center"  colspan="1" class="text_negro" >Escolar</td>
                            <td height="20" align="center"   colspan="1" class="text_negro" >Economico</td>
                            <td height="20" align="center" colspan="2" class="text_negro" >Manejo de Roles </td>
                            <td height="20" align="center" colspan="2" class="text_negro" >Manejo de Autoridad</td>
                            </tr>
                          <tr class="fondo_celda_5">
	  						
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][55] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][56] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][57] %></td>
                            <td height="20" align="center"  colspan="2" class="text_negro" ><%= opes[i][58] %></td>
                            <td height="20" align="center"  colspan="1" class="text_negro" ><%= opes[i][60] %></td>
                            <td height="20" align="center"  colspan="1" class="text_negro" ><%= opes[i][59] %></td>
                            <td height="20" align="center"  colspan="2" class="text_negro" ><%= opes[i][61] %></td>
                            <td height="20" align="center"  colspan="2" class="text_negro" ><%= opes[i][62] %></td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="6" align="center" class="text_negro" >Autores del Conflicto </td>
                            <td height="20" colspan="7" align="center" class="text_negro" >Tipo de Vivienda </td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20"  colspan="2" align="center" class="text_negro" >Padre-Madre</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Padre-Hijos</td>
                            <td height="20"  colspan="1" align="center" class="text_negro" >Hermanos</td>
                            <td height="20" align="center" class="text_negro" >Otros</td>
                            <td height="20" align="center" class="text_negro" >Casa</td>
                            <td height="20" align="center" class="text_negro" >Apto</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Habitacion</td>
                            <td width="77" height="20" align="center" class="text_negro" >Rancho</td>
                            <td width="26" height="20" align="center" class="text_negro" >Lote</td>
                            <td width="70" height="20" align="center" class="text_negro" >Otro</td>
                          </tr>
                          <tr class="fondo_celda_5">
                            <td height="20"   colspan="2" align="center" class="text_negro" ><%= opes[i][63] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][64] %></td>
                            <td height="20"  colspan="1" align="center" class="text_negro" ><%= opes[i][65] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][66] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][67] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][68] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][69] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][70] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][71]%></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][72] %></td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="13" align="center" class="text_negro" >Tenencia</td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20" colspan="2" align="center" class="text_negro" >Propia</td>
                            <td height="20"  colspan="1" align="center" class="text_negro" >Arrendada</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Amortizada</td>
                            <td height="20"  colspan="1" align="center" class="text_negro" >Hipoteca</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Inquilinato</td>
                            <td height="20" align="center" class="text_negro" >Sucesion</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Invasion</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Otro</td>
                            </tr>
                          <tr class="fondo_celda_5">
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][73] %></td>
                            <td height="20"   colspan="1" align="center" class="text_negro" ><%= opes[i][74] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][75] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][80] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][76] %></td>
                            <td height="20" align="center" class="text_negro" ><%= opes[i][77] %></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][79] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][78] %></td>
                          </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="13" align="center" class="text_negro" >Servicios</td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20"  colspan="2" align="center" class="text_negro" >Agua</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Luz</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Alcantarillado</td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Alumbrado P&uacute;blico </td>
                            <td height="20"  colspan="2" align="center" class="text_negro" >Tel&eacute;fono</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Recoleccion de Aseo </td>
                          </tr>
                          <tr class="fondo_celda_5">
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][89]%></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][90]%></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][91]%></td>
                            <td height="20"   colspan="2" align="center" class="text_negro" ><%= opes[i][92]%></td>
                            <td height="20"  colspan="2" align="center" class="text_negro" ><%= opes[i][93]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][94]%></td>
                            </tr>
                           <tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" >Historial de Atenci&oacute;n </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="7" align="center" class="text_negro" >Se encuentra en situaci&oacute;n de Desplazamiento </td>
                            <td height="20" colspan="6" align="center" class="text_negro" >Ha iniciado acciones juridicas previas </td>
                            </tr>
                          <tr class="fondo_celda_4">
                            <td height="20" colspan="4" align="center" class="text_negro" >SI</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >NO</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >SI</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >NO</td>
                            </tr>
                          <tr class="fondo_celda_5">
                            <td height="20" colspan="4" align="center" class="text_negro" ><%= opes[i][81]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][82]%></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][83] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][84] %></td>
                            </tr>
                          <tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" > Area de Consulta </td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" colspan="5" align="center" class="text_negro" >Publica</td>
                            <td height="20" colspan="2" align="center" class="text_negro" >Privada</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Laboral</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Penal </td>
                            </tr>
                          <tr class="fondo_celda_5">
						    <td height="20" colspan="5" align="center" class="text_negro" ><%= opes[i][85] %></td>
                            <td height="20" colspan="2" align="center" class="text_negro" ><%= opes[i][86] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][87] %></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><%= opes[i][88] %></td>
                            </tr>
							<%}
							}else{
							aux=false; }%>
                            <tr class="fondo_celda_1">
                            <td height="20" colspan="13" align="center" class="text_blanco" >Casos Por Municipio (Norte de Santander - Venezuela)</td>
                            </tr>
                          <tr class="fondo_celda_2">
                            <td height="20" align="center" class="text_negro" ><img src="img/colombia.jpg" width="30" height="30" border="0"></td>
                            <td height="20" colspan="9" align="center" class="text_negro" >Colombia - Departamento Norte de Santander</td>
                            <td height="20" colspan="3" align="center" class="text_negro" >Total</td>
                          </tr>
                            <% 	
							boolean auxmun=true;
							
							Conex mun = new Conex();
							
							Conex munve = new Conex();
							int y=0;
							ResultSet  rsmuni = mun.consultar("(SELECT municipio, count(municipio) as total FROM personacaso group by municipio order by municipio asc) EXCEPT (SELECT municipio, count(municipio) as total FROM personacaso where municipio='SAN ANTONIO DEL TACHIRA' group by municipio order by municipio asc)");	
							
							ResultSet  rsmunive = munve.consultar("SELECT municipio, count(municipio) as total FROM personacaso where municipio='SAN ANTONIO DEL TACHIRA' group by municipio order by municipio asc");	
							int contmunive = munve.contar(rsmunive);
							int contmuni = mun.contar(rsmuni);
							String[][] opesmun = new String[contmuni][3];
							String[][] opesmunve = new String[contmunive][3];
							
							rsmuni.beforeFirst();
							if(contmuni!=0){ 
							rsmuni.next();
								for(int i=0;i<contmuni;i++)
								{
									opesmun[i][0]=rsmuni.getString("municipio");
									opesmun[i][1]=rsmuni.getString("total");
									rsmuni.next();
								}							
							  int color = 1;
							  String fondo = null;
							 for(int i=0;i<contmuni;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							if(opesmun[i][0]!=null){%>                          
                          <tr class="<%= fondo %>">
                            <td height="20" colspan="10" align="center" class="text_negro" ><div align="center"><%= opesmun[i][0] %> </div></td><%
							int dep=Integer.valueOf(opesmun[i][1]).intValue();
							y=y+dep;
							%>
                            <td height="20" colspan="3" align="center" class="text_negro" ><div align="center"><%= opesmun[i][1] %> </div></td>                            
                          </tr>
                          <%}}
					}else{
					auxmun=false;
				 %><tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="13">No se encontraron registros.</td>                        </tr>   <%}%>               
                                     
                          
						   <tr class="fondo_celda_2"> 
                                 <td height="20" align="center" class="text_negro" ><img src="img/venezuela.jpg" width="30" height="30" border="0"></td>                        
                            <td height="20" colspan="9" align="center" class="text_negro" ><div align="center">Venezuela - Estado Tachira</div></td>
                            <td height="20" colspan="3" align="center" class="text_negro" ><div align="center">Total</div></td>                            
                          </tr><% int j=0;
                          	boolean auxmunve=true;
                          rsmunive.beforeFirst();
							if(contmunive!=0){ 
							rsmunive.next();
								for(int i=0;i<contmunive;i++)
								{
									opesmunve[i][0]=rsmunive.getString("municipio");
									opesmunve[i][1]=rsmunive.getString("total");
									rsmuni.next();
								}							
							  int color = 1;
							  String fondo = null;
							 for(int i=0;i<contmunive;i++){				    
								  fondo = "fondo_celda_3";
								  if ((color%2)==0)
									fondo = "fondo_celda_4";
								  color += 1;
							%>                          
                          <tr class="<%= fondo %>">
                       
                            <td height="20" colspan="10" align="center" class="text_negro" ><div align="center"><%= opesmunve[i][0] %> </div></td><%
                            int dep=Integer.valueOf(opesmunve[i][1]).intValue();
							j=j+dep;%>
                            <td height="20" colspan="3" align="center" class="text_negro" ><div align="center"><%= opesmunve[i][1] %> </div></td>
                        </tr>
						  <%}
					}else{
					auxmunve=false;
				 %><tr align="center" class="fondo_celda_5">
                          <td height="20" class="text_negro" colspan="13">No se encontraron registros.</td>                        </tr><%}%>
						  <tr align="center" class="fondo_celda_2">
						    <td height="20" colspan="10" class="text_negro" align="right">Total SUM:</td>
						    <td height="20" colspan="3" class="text_negro"><%=y+j%></td>
						    </tr>   
                    </table></td>
                  </tr>
                <%    confechas.close();
						  con.close();
							mun.close();
							munve.close();%>
                    </table> 
                  </td>
              </tr>
            </table>
</div>
<p>&nbsp;</p>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>