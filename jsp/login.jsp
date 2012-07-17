<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*"  import="javax.servlet.*" import="javax.servlet.http.*" import="java.util.*" errorPage="" pageEncoding="UTF-8"%>
<%
try{
String usu = String.valueOf(request.getParameter("usuario"));
String pass = String.valueOf(request.getParameter("password"));

String nom = String.valueOf(request.getParameter("nombres_ope"));
Conex con = new Conex();
Conex conac = new Conex();
int cont=0;
String e = String.valueOf(request.getParameter("e"));
ResultSet rs1=null;
String [] rol = new String[5];
if(!usu.equals("null") && !pass.equals("null"))
{
	
	String consulta1 = "select * from rolxusuario rx, usuario u, rol r where rx.perid=u.perid and rx.rolid=r.rolid and u.usulogin='"+usu+"' and u.usupassword='"+pass+"' and u.usuestado='1'";	
	rs1 = con.consultar(consulta1);	
	
	if(rs1.next()){
		cont = con.contar(rs1);
		rs1.beforeFirst();
		
		String actualiza = "update usuario set contador=contador+1 where usulogin='"+usu+"'";
	    conac.actualizar(actualiza);
		
		
		for(int i=0;i<cont;i++){rs1.next();rol[i]=rs1.getString("rolnombre");}
			int total1 = con.contar(rs1);
			if(total1!=0){			
				session.setAttribute("admin",usu);				
				Conex con2 = new Conex();
				ResultSet res2=con2.consultar("select * from usuario u, persona p where u.perid=p.perid and u.usulogin='"+usu+"'");
				if(res2.next()){				
					String nomc=""+res2.getString("pernombre")+" "+res2.getString("perapellido")+".";
					session.setAttribute("nomadmin",nomc);
				}
			}else{
			response.sendRedirect("login.jsp?e=1");
			}
	}else{
		response.sendRedirect("login.jsp?e=1");
	}
}
Calendar ahoraCal = Calendar.getInstance();
int d=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<title>Jurisprudencia y Derecho</title>
<link rel="shortcut icon" href="img/favicon.ico">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  <link href="css/logeo.css" media="screen" rel="stylesheet" type="text/css" />
  <script src="css/logeo.js" type="text/javascript"></script>
	<style>
	
	
.box #container {
    background: none repeat scroll 0 0 #FFFFFF;
    box-shadow: 0 0 50px #BBBBBB;
    margin:0px auto;
    max-width: 650px;    
}
#containerss { 
    margin: 100px auto;	
    max-width: 650px;   
	margin-top:0px;   
}
.notification {
                position: relative;
                margin: 0 0 15px 0;
                padding: 0;
                border: 1px solid;
                background-position: 10px 11px !important;
                background-repeat: no-repeat !important;
                font-size: 12px;
                width: 100%;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
				border-radius: 6px;                
}
.information {
                background: #dbe3ff url('img/information.png');
                border-color: #a2b4ee;
                color: #585b66;
}
.notification div {
                display:block;
                font-style:normal;
                padding: 3px 10px 5px 36px;
                line-height: 1.5em;
}
</style>
<script language="JavaScript" src="jScripts/retrocesoSinObjetos.js"></script>
<script language="JavaScript" src="jScripts/validaciones.js"></script>
<script language="JavaScript">
function validar(frm){
	if(esVacio(frm.usuario.value)){	
		alert("Digite nombre de usuario.");
		frm.usuario.focus();
	}else if(esVacio(frm.password.value)){	
		alert("Digite password.");
		frm.password.focus();
	}else{
		frm.action="login.jsp"
		frm.submit();
	}
}
function continuar(frm){
	frm.action="rol.jsp"
	frm.submit();	
}
</script>
</head>
<% 
if(((ahoraCal.get(Calendar.MONTH) == Calendar.NOVEMBER) && (ahoraCal.get(Calendar.DATE) >= 15)) ||  ((ahoraCal.get(Calendar.MONTH) == Calendar.DECEMBER) && (ahoraCal.get(Calendar.DATE) <= 31))){
d=1;
}
if(d==1){%>
<body class="box" style="background-image:url(images/navidad.png); background-repeat:repeat-x;" id="Bodycontent">	
<%}else{%>
<body class="box" style="background-color:#f0f0f0;" id="Bodycontent">
<%}%>
<div id="container" style=" width:650px;">
  <table  width="649" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="306" align="center"><div align="center" style="position:relative;"><img src="images/block.JPG" width="257" height="270" />
  
     <div id="registrationLink" style="border:0px solid ref; height:30px; width:96px; position:absolute; top:114px; left:207px;">
Version 4.1
</div>
    </div></td>     
    <td width="248"><div  > 
      <div id="header" class="group">
        <h2 id="logo" style="color:#FFFFFF; padding:5px" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left"><span style="color:#FFFFFF; padding:5px"></span></td>
            <td align="center" style="color:#FFFFFF">Consultorio Juridico </td>
            <td align="right"><img src="images/derechounipamplona.png" width="30" height="30" /></td>
            </tr>
        </table></h2>
        </div>     
      
      <div id="content">
        <%if(!e.equals("null")){%>
		
			  <div id="msgBox_info" class="notification information png_bg">
					<div>Su usuario y / o contraseña no son válidos. Intente de nuevo</div>
				</div>
		<%	}%>
        <form method="post" name="form1" id="form1" >
          <%if(usu.equals("null") && pass.equals("null") ){%>
          <div class="field text-field">
            <label for="user_session_login">Usuario</label>
            <br />
            <input class="text-field"  name="usuario" size="20" type="text" />
            </div>
          <div class="field text-field">
            <label for="user_session_password">Contrase&ntilde;a</label>
            <br />
            <input class="text-field"  name="password" size="20" type="password" />
            </div>     <style>
		   .button{font-size:12px;color:#fff;background:#005889;padding:.5em .7em;border:0;cursor:pointer;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px}
		   </style>
          <div class="actions">
            <p align="right">
              <input class="button" name="commit" type="button" value="Ingresar"  onclick="javascript:validar(document.forms['form1'])" />
              </p>
            </div>
         				 <%}else{  if(cont>1){%>
                         
          <div >
            <h4 style="color: #666; font-size:14px">Seleccione su Perfil</h4><p>&nbsp;</p>
                <div id="msgBox_info" class="notification information png_bg">
					<div>Hemos detectado que tiene varios perfiles, seleccione un perfil único</div>
				</div><br />
           Haga su Selecc&oacute;n&nbsp;   <select name="rol">
			<%for(int i=0;i<cont;i++){%>               
            	<option value="<%=rol[i]%>"><%=rol[i]%></option>                
                <%}%>
                </select>
          </div><br/>
           <p align="right">
           <style>
		   .button2{font-size:12px;color:#fff;background:#005889;padding:.3em .7em;border:0;cursor:pointer;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px}
		   </style>
           <input class="button2" name="commit" type="button" value="Continuar"  onclick="javascript:continuar(document.forms['form1'])" /></p>
         <br /><%}if(cont==1){
			 	for(int i=0;i<1;i++){ response.sendRedirect("rol.jsp?rol="+rol[i]+"");}  }}%>
	        </form>
        </div>
    </div></td>
  </tr> 
</table>   
 </div>
</body><br/><div id="containerss" style="position:relative" >
 <jsp:include page="botoom_login.jsp" />
</div>
</html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_login.jsp");
}%>