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
boolean flag=false;

String periodo=String.valueOf(request.getParameter("periodo"));
String codigo=String.valueOf(request.getParameter("codigo"));
String fecha=String.valueOf(request.getParameter("fecha"));
String apellido=String.valueOf(request.getParameter("apellido"));
String nombre=String.valueOf(request.getParameter("nombre"));
String sexo=String.valueOf(request.getParameter("sexo"));
String edad=String.valueOf(request.getParameter("edad"));
String rango=String.valueOf(request.getParameter("rango"));
String nacionalidad=String.valueOf(request.getParameter("nacionalidad"));
String documento=String.valueOf(request.getParameter("documento"));
String tipodocumento=String.valueOf(request.getParameter("tipodocumento"));
String lugarexpedicion=String.valueOf(request.getParameter("lugarexpedicion"));
String libreta=String.valueOf(request.getParameter("libreta"));
String numeroli=String.valueOf(request.getParameter("numeroli"));
String dismil=String.valueOf(request.getParameter("dismil"));
String direccion=String.valueOf(request.getParameter("direccion"));
String telefono=String.valueOf(request.getParameter("telefono"));
String email=String.valueOf(request.getParameter("email"));
String sisben=String.valueOf(request.getParameter("sisben"));
String numerosisben=String.valueOf(request.getParameter("numerosisben"));
String discapacidad=String.valueOf(request.getParameter("discapacidad"));
String tipodis=String.valueOf(request.getParameter("tipodis"));
String grupoet=String.valueOf(request.getParameter("grupoet"));
String etnico=String.valueOf(request.getParameter("etnico"));
String nivelesco=String.valueOf(request.getParameter("nivelesco"));
String otro=String.valueOf(request.getParameter("otro"));
String tipofamil=String.valueOf(request.getParameter("tipofamil"));
String modofamil=String.valueOf(request.getParameter("modofamil"));
String personasgrupo=String.valueOf(request.getParameter("personasgrupo"));
String estado=String.valueOf(request.getParameter("estado"));
String conyuge=String.valueOf(request.getParameter("conyuge"));
String allegado=String.valueOf(request.getParameter("allegado"));
String telefonofijo=String.valueOf(request.getParameter("telefonofijo"));
String direccionalle=String.valueOf(request.getParameter("direccionalle"));
String telefonocel=String.valueOf(request.getParameter("telefonocel"));
String autoridad=String.valueOf(request.getParameter("autoridad"));
String sanciona=String.valueOf(request.getParameter("sanciona"));
String aporte=String.valueOf(request.getParameter("aporte"));
String conflictos=String.valueOf(request.getParameter("conflictos"));
String factor=String.valueOf(request.getParameter("factor"));
String autor=String.valueOf(request.getParameter("autor"));
String vivienda=String.valueOf(request.getParameter("vivienda"));
String tenencia=String.valueOf(request.getParameter("tenencia"));
String agua=String.valueOf(request.getParameter("agua"));
String luz=String.valueOf(request.getParameter("luz"));
String alcantarillado=String.valueOf(request.getParameter("alcantarillado"));
String alumbrado=String.valueOf(request.getParameter("alumbrado"));
String telefonos=String.valueOf(request.getParameter("telefonos"));
String aseo=String.valueOf(request.getParameter("aseo"));
String ocupacion=String.valueOf(request.getParameter("ocupacion"));
String labora=String.valueOf(request.getParameter("labora"));
String salario=String.valueOf(request.getParameter("salario"));
String tipotra=String.valueOf(request.getParameter("tipotra"));
String empresa=String.valueOf(request.getParameter("empresa"));
String clase=String.valueOf(request.getParameter("clase"));
String salud=String.valueOf(request.getParameter("salud"));
String pension=String.valueOf(request.getParameter("pension"));
String arp=String.valueOf(request.getParameter("arp"));
String otrosalud=String.valueOf(request.getParameter("otrosalud"));
String ocupaconyu=String.valueOf(request.getParameter("ocupaconyu"));
String desplazado=String.valueOf(request.getParameter("desplazado"));
String lugardes=String.valueOf(request.getParameter("lugardes"));
String fechades=String.valueOf(request.getParameter("fechades"));
String motivo=String.valueOf(request.getParameter("motivo"));
String armado=String.valueOf(request.getParameter("armado"));
String grupo=String.valueOf(request.getParameter("grupo"));
String rupd=String.valueOf(request.getParameter("rupd"));
String relacion=String.valueOf(request.getParameter("relacion"));
String juridica=String.valueOf(request.getParameter("juridica"));
String cuales=String.valueOf(request.getParameter("cuales"));
String modalidad=String.valueOf(request.getParameter("modalidad"));
String caso=String.valueOf(request.getParameter("caso"));
String asesoria=String.valueOf(request.getParameter("asesoria"));
String exposicion=String.valueOf(request.getParameter("exposicion"));
String area=String.valueOf(request.getParameter("area"));
String observaciones=String.valueOf(request.getParameter("observaciones"));
String docucopias=String.valueOf(request.getParameter("docucopias"));
String abogado=String.valueOf(request.getParameter("abogado"));
String apeabog=String.valueOf(request.getParameter("apeabog"));
String docu=String.valueOf(request.getParameter("docu"));
String abogado3=String.valueOf(request.getParameter("abogado3"));
String apeabog3=String.valueOf(request.getParameter("apeabog3"));
String docu3=String.valueOf(request.getParameter("docu3"));
String recibido=String.valueOf(request.getParameter("recibido"));
String municipio=String.valueOf(request.getParameter("municipio"));
String embarazada=String.valueOf(request.getParameter("embarazada"));
String codigo_real=String.valueOf(request.getParameter("codigo_real"));
String control2="1";
int contador=0;
if(!codigo.equals("null"))
{
	
	if(!codigo_real.equals(codigo)){
		String consulta = "select * from personacaso where perradicado='"+codigo+"'";		
		ResultSet rs = con.consultar(consulta);
		contador=con.contar(rs);
	}
	if(!(contador>0)){
		
		String actualiza = "update personacaso set perradicado='"+codigo+"', perfecha='"+fecha+"', pernombre='"+nombre+"', perapellido='"+apellido+"', persexo='"+sexo+"', peredad='"+edad+"', pernacionalidad='"+nacionalidad+"', perdocumento='"+documento+"', pertipodocumento='"+tipodocumento+"', perlugarexpedicion='"+lugarexpedicion+"', perlibretamilitar='"+libreta+"', pernumerolibreta='"+numeroli+"', perdistritomilitar='"+dismil+"', perdireccion='"+direccion+"', pertelefono='"+telefono+"', peremail='"+email+"', persisben='"+sisben+"', pernumero='"+numerosisben+"', perdiscapacidad='"+discapacidad+"', pertipodisca='"+tipodis+"', pergrupoetnico='"+grupoet+"', percualetnico='"+etnico+"', pernivelescola='"+nivelesco+"', percualnivel='"+otro+"', pertipofamilia='"+tipofamil+"', permodofamil='"+modofamil+"', pernumfamilia='"+personasgrupo+"', perestadocivil='"+estado+"', perconyuge='"+conyuge+"', perallegado='"+allegado+"', perfijo='"+telefonofijo+"', perdireccionalle='"+direccionalle+"', percelular='"+telefonocel+"', perautoridad='"+autoridad+"', persanciona='"+sanciona+"', peraporte='"+aporte+"', perconflictos='"+conflictos+"', perfactor='"+factor+"', parautor='"+autor+"', pervivienda='"+vivienda+"', pertenencia='"+tenencia+"', peragua='"+agua+"', perluz='"+luz+"', peralcantarillado='"+alcantarillado+"', paralumbrado='"+alumbrado+"', pertelefonos='"+telefonos+"', peraseo='"+aseo+"', perocupacion='"+ocupacion+"', perlabora='"+labora+"', persalario='"+salario+"', pertipotra='"+tipotra+"', perempresa='"+empresa+"', perclase='"+clase+"', persalud='"+salud+"', perpension='"+pension+"', perarp='"+arp+"', perotro='"+otrosalud+"', perocupaconyu='"+ocupaconyu+"', perdesplazado='"+desplazado+"', perlugardes='"+lugardes+"', perfechades='"+fechades+"', permotivo='"+motivo+"', perarmado='"+armado+"', pergrupo='"+grupo+"', perrupd='"+rupd+"', perrelacion='"+relacion+"', perjuridica='"+juridica+"', percuales='"+cuales+"', permodalidad='"+modalidad+"', percaso='"+caso+"', perasesoria='"+asesoria+"', perexposicion='"+exposicion+"', perobservaciones='"+observaciones+"', perdocumentos='"+docucopias+"', perabogado='"+abogado+"', perapeabog='"+apeabog+"', perdocu='"+docu+"', perabogadoss='"+abogado3+"', perapeabogss='"+apeabog3+"', perdocuss='"+docu3+"', perrecibido='"+recibido+"', municipio='"+municipio+"', embarazada='"+embarazada+"', perrango='"+rango+"', perarea='"+area+"', modified=now(), modified_hora=now() where perradicado='"+codigo+"'";
	con.actualizar(actualiza);
		
	}else{
		
		flag=true;
	}
	
}else{
	flag=true;
}%>
    	
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho - Unipamplona</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="images/estilo.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="img/favicon.ico">
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
  <h1>Nuevo Radicado / Periodo: <%=periodo%></h1>
  <p></p>
  <div id="texto_contenido">
 <br/><br/>
<form name="form1" method="post">

 <input name="periodo"  type="hidden"  value="<%=periodo%>" >
  <div align="right" style="width:479px">
  <%if(flag){%>
 <input name="" type="button" class="botones" value=" Atras " onclick='history.go(-1)'>
   <%}else{%>
   
   <input name="" type="button" class="botones" value=" Volver a La Lista " onclick="window.location='casos.jsp?periodo=<%=periodo%>'">
   <%}%>
   </div><br/>
    <table width="350" border="0" align="center" class="fondo_tabla" cellpadding="0" cellspacing="1">
  <tr>
    <td >    
          <table width="350" border="0" cellpadding="1" cellspacing="0" >
  <tr class="fondo_celda_1">
    <td colspan="2" class="text_blanco"   height="20" align="center">Datos del Radicado</td>
    </tr>
  <tr class="fondo_celda_2" height="20" align="center">
    <td width="107">
    <%if(flag){%>    
    <img src="img/cross_circle.png" width="16" height="16" />
    <%}else{%>
        <img src="img/acs_chk.gif" width="16" height="16" />
    
    <%}%>
    </td>
    <td width="339" class="text_negro"  align="justify" height="20"> 
     <%if(flag){%>  
     <br/>   EL Radicado Ya existe.<br/>  Cambie el Numero del Radicado por otro diferente<br/><br/>  
        <%}else{%>
        EL proceso se realiz&oacute; satisfactoriamente
         <%}%> 
        </td>
  </tr>
</table>    
    </td>
  </tr>
  </table>
  
   &nbsp;</p>
  <p>&nbsp;</p>
</form>				
<p>&nbsp;</p>
  <p>&nbsp;</p>
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