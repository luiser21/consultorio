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
		String busca="TRUNCATE TABLE estu_asig_temp";
		con.actualizar(busca);
		
		String periodo=String.valueOf(request.getParameter("periodo"));
		String laboral="0";
		String penal="0";
		String privada="0";
		String publica="0";	
		Conex con2 = new Conex();
		Conex con5 = new Conex();
		Conex con55 = new Conex();
		String consulta = null;			
		consulta="SELECT personacaso.estuid as estuid, Count(personacaso.estuid) AS casos, estudiantes.identificacion as identificacion, estudiantes.nombre as nombre, estudiantes.apellido as apellido FROM personacaso Inner Join estudiantes ON personacaso.estuid =estudiantes.estuid WHERE personacaso.perid = '"+periodo+"' GROUP BY personacaso.estuid, estudiantes.identificacion, estudiantes.nombre, estudiantes.apellido order by estudiantes.nombre";	
		ResultSet  rs=con.consultar(consulta);			
		int cont = con.contar(rs);
		String[][] opes = new String[cont][9];
		rs.beforeFirst();
		if(cont!=0){ 
			rs.next();
			for(int i=0;i<cont;i++){
				opes[i][0]=rs.getString("identificacion");		
				opes[i][8]=rs.getString("estuid");		
				opes[i][7]=rs.getString("casos");
				opes[i][1]=rs.getString("nombre");	
				opes[i][2]=rs.getString("apellido");	
				opes[i][3]="0";	
				opes[i][4]="0";	
				opes[i][5]="0";	
				opes[i][6]="0";		
				ResultSet  ress = con55.consultar("select perarea, estuid, count(perarea) as casos from personacaso where perid='"+periodo+"' and estuid='"+opes[i][8]+"' group by estuid, perarea order by perarea");		
				ress.beforeFirst();
				while(ress.next()){
					if(ress.getString("perarea").equals("LABORAL")){
						laboral=ress.getString("casos");
						opes[i][3]=laboral;	
						}
					if(ress.getString("perarea").equals("PENAL")){
						penal=ress.getString("casos");
						opes[i][4]=penal;	
						}
					if(ress.getString("perarea").equals("PRIVADA")){
						privada=ress.getString("casos");
						opes[i][5]=privada;	
						}
					if(ress.getString("perarea").equals("PUBLICA")){
						publica=ress.getString("casos");	
						opes[i][6]=publica;	
						}
				} 			
				rs.next();
			}	
			
			for(int i=0;i<cont;i++){		
				String actualiza = "insert into estu_asig_temp (estuid, identificacion, nombre, apellido, laboral, penal, privada, publica, casos, periodo) values('"+opes[i][8]+"','"+opes[i][0]+"', '"+opes[i][1]+"', '"+opes[i][2]+"', '"+opes[i][3]+"', '"+opes[i][4]+"', '"+opes[i][5]+"', '"+opes[i][6]+"', '"+opes[i][7]+"','"+periodo+"')";
				con.actualizar(actualiza);
			}	
			con55.close();
			con5.close();
			con2.close();
			con.close();
			 response.sendRedirect("abogasignado.jsp?periodo="+periodo+"");
		}else{
			con55.close();
			con5.close();
			con2.close();
			con.close();
			response.sendRedirect("abogasignado.jsp?periodo="+periodo+"");
		}
}catch(Exception e){
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