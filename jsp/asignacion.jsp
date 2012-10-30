<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>

<body>
<%
try{
Conex con = new Conex();

String periodo=String.valueOf(request.getParameter("periodo"));

Conex asignacion=new Conex();
ResultSet  asignacionrs = asignacion.consultar("select  count(*) as numero from asignacion where periodo='"+periodo+"' ");	
asignacionrs.next();
int cantidadasig=Integer.valueOf(asignacionrs.getString("numero")).intValue();
String insertar1=null;
String insertar2=null;
String insertar3=null;
String insertar4=null;
if(cantidadasig==0){
	ResultSet  rs = con.consultar("select * from estudiantes where perid='"+periodo+"' ");
	int cont = con.contar(rs);
	String[][] opes = new String[cont][2];
	rs.beforeFirst();
	if(cont!=0){ 
		rs.next();
		for(int ii=0;ii<cont;ii++){ 
			opes[ii][0]=rs.getString("estuid");
			rs.next();	
		}
		for(int ii=0;ii<cont;ii++){ 
			insertar1 = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('serie'), '"+opes[ii][0]+"', 'PUBLICA', '"+periodo+"')";
			con.actualizar(insertar1);
			insertar2 = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('serie'), '"+opes[ii][0]+"', 'PRIVADA', '"+periodo+"')";
			con.actualizar(insertar2);
			insertar3 = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('serie'), '"+opes[ii][0]+"', 'LABORAL', '"+periodo+"')";
			con.actualizar(insertar3);
			insertar4 = "insert into asignacion (codigo, estudiante, area, periodo) values(nextval('serie'), '"+opes[ii][0]+"', 'PENAL', '"+periodo+"')";
			con.actualizar(insertar4);
		}
	}	
	response.sendRedirect("abogadoasig.jsp?exito=1&periodo="+periodo); 
}

%>
</body>
</html>
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