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
	
	Conex con = new Conex();
	String busca="TRUNCATE TABLE estu_recep_temp";
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
	consulta="select  perdocu, count(perdocu) as casos from personacaso where perid='"+periodo+"' group by perdocu order by casos";	
	ResultSet  rs=con.consultar(consulta);			
	int cont = con.contar(rs);
	String[][] opes = new String[cont][9];
	rs.beforeFirst();
	if(cont!=0){ 
		rs.next();
		for(int i=0;i<cont;i++){
			opes[i][0]=rs.getString("perdocu");
			opes[i][7]=rs.getString("casos");
			ResultSet  contarmesas = con5.consultar("select * from personacaso where perid='"+periodo+"' and perdocu='"+opes[i][0]+"'");		
			contarmesas.next();
			opes[i][1]=contarmesas.getString("perabogado");	
			opes[i][2]=contarmesas.getString("perapeabog");	
			opes[i][3]="0";	
			opes[i][4]="0";	
			opes[i][5]="0";	
			opes[i][6]="0";		
			ResultSet  ress = con55.consultar("select perarea, count(perarea) as casos from personacaso where perid='"+periodo+"' and perdocu='"+opes[i][0]+"'  group by perarea order by perarea");		
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
			String actualiza = "insert into estu_recep_temp (perdocu, perabogado, perapeabog, laboral, penal, privada, publica, casos, periodo) values('"+opes[i][0]+"', '"+opes[i][1]+"', '"+opes[i][2]+"', '"+opes[i][3]+"', '"+opes[i][4]+"', '"+opes[i][5]+"', '"+opes[i][6]+"', '"+opes[i][7]+"','"+periodo+"')";
			con.actualizar(actualiza);
		}	
		con55.close();
		con5.close();
		con2.close();
		con.close();
		 response.sendRedirect("abogrecepciona.jsp?periodo="+periodo+"");
	}else{
		con55.close();
		con5.close();
		con2.close();
		con.close();
		response.sendRedirect("abogrecepciona.jsp?periodo="+periodo+"");
	}

} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal.jsp");
}%>