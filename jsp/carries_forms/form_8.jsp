<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
if(sesion==null || sesion.equals("false")){%>
<script>
	window.parent.location='../login.jsp';
</script>
<%
} 
try{
Conex con = new Conex();

Conex conn = new Conex();

Conex connn = new Conex();
Conex connb = new Conex();
Conex connbu = new Conex();
Conex connt = new Conex();
Conex conntt = new Conex();
Conex connp = new Conex();
String periodo=String.valueOf(request.getParameter("periodo"));
String perid=null;
ResultSet  rsss = connn.consultar("select * from periodo where perid='"+periodo+"' ");
rsss.next();
int semestre=rsss.getInt("persemestre");
int ano=rsss.getInt("perano");
int variable=0;
int max=0;
int u=1;
int uu=1;
int uuu=1;
int min=0;
connn.close();
ResultSet  rssp = connp.consultar("select count(perradicado) as c from personacaso where perid='"+periodo+"' ");
rssp.next();
uu=rssp.getInt("c");
connp.close();
if(uu==0){
}else{	
	ResultSet  rss = conn.consultar("select min(perradicado) as min from personacaso where perid='"+periodo+"' ");
	rss.next();
	min=rss.getInt("min");
}


//int max=rss.getInt("max");
if(semestre==2){
	variable=semestre-1;
	ResultSet  rssnu = connbu.consultar("select count(perid) as num from periodo where persemestre='"+variable+"' and perano='"+ano+"' ");
	rssnu.next(); 
    u=rssnu.getInt("num");
	connbu.close();
	if(u==0){	
		
	}else{
		ResultSet  rssn = connb.consultar("select *  from periodo where persemestre='"+variable+"' and perano='"+ano+"' ");
		rssn.next(); 
		perid=rssn.getString("perid");
		connb.close();
		
		ResultSet  rsst = connt.consultar("select count(perradicado) as xxxx from personacaso where perid='"+perid+"' ");
		rsst.next();
		uuu=rsst.getInt("xxxx");
		connt.close();
		if(uuu==0){
			
			
		}else{
			ResultSet  rsstt = conntt.consultar("select max(perradicado) as radi from personacaso where perid='"+perid+"' ");
			rsstt.next();
			max=rsstt.getInt("radi");
			conntt.close();
		}
		
	}

}
if(semestre==1){
	variable=semestre+1;
	ano=ano-1;
	ResultSet  rssnu = connbu.consultar("select count(perid) as num from periodo where persemestre='"+variable+"' and perano='"+ano+"' ");
	rssnu.next(); 
    u=rssnu.getInt("num");
	connbu.close();
	if(u==0){	
		
	}else{
		ResultSet  rssn = connb.consultar("select *  from periodo where persemestre='"+variable+"' and perano='"+ano+"' ");
		rssn.next(); 
		perid=rssn.getString("perid");
		connb.close();
		
		ResultSet  rsst = connt.consultar("select count(perradicado) as xxxx from personacaso where perid='"+perid+"' ");
		rsst.next();
		uuu=rsst.getInt("xxxx");
		connt.close();
		if(uuu==0){
			
			
		}else{
			ResultSet  rsstt = conntt.consultar("select max(perradicado) as radi from personacaso where perid='"+perid+"' ");
			rsstt.next();
			max=rsstt.getInt("radi");
			conntt.close();
		}
		
	}

}
//sacar maximo del periodo anterior




//var2=min-max;



//Consulto los radicados del periodo
boolean aux=true;
ResultSet  rs = con.consultar("select perradicado  from personacaso where perid='"+periodo+"' order by perradicado");	
int cont = con.contar(rs);
int var2=0;


int[][] opes = new int[cont][1];
rs.beforeFirst();
						if(cont!=0){ 
							rs.next();
								for(int i=0;i<cont;i++)
								{
									opes[i][0]=rs.getInt("perradicado");
									rs.next();
								}
						}else{
							aux=false;
						}
						
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>
<link href="../css/estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div align="center"><br/>
    <table border="0" align="center" cellpadding="2" cellspacing="0" class="fondo_tabla" width="248">
					<form name="form1" method="post">
					  <tr>  
						<td width="244" height="17" valign="top"> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<tr class="fondo_celda_1"> 
							  <td height="20" class="text_blanco" align="center"> Radicados que Faltan por Sistematizar </td>
							</tr>
							<tr> 
							  <td height="27" align="center" valign="top"> 
								<table width="100%" border="0" cellspacing="1" cellpadding="2">
						
								   <tr align="center" valign="middle"> 
									 <td width="100%" height="20" class="text_negro"> 
									   <%int y=0;

						if(max==0 || min==0){
								var2=min-max;
								if(var2==1){
								}if(var2>1){
									for(int s=1;s<var2;s++){
										max=max+1;
									%>
										<%=max%> -										
								  <%y=y+1;}
									
								}
						}if(max!=0 && min!=0){		
								var2=min-max;
								if(var2==1){}
								if(var2>1){
									for(int s=1;s<var2;s++){
											max=max+1;%>									
											<%=max%> -										
									<% 		y=y+1;
									}
							   }
						}	   
									   
									   
									   
						 int k; 						if(aux){
						    for(int ii=0;ii<cont;ii++){
								if(min==opes[ii][0]){
									 min=min+1;
							    }else{
								    k=opes[ii][0]-min;
									if(k==1){%>
										<%=min%> -

										<% min=min+2;
										y=y+1;
									}if(k>1){									   
									   for(int x=min; x<opes[ii][0];x++){
									   y=y+1; %>
												 <%=x%> -  
									<%}
									   min=min+k+1;
									   //y=y+1;
								    }
								}
							
							}
							if(y==0){%>
								Los Radicados Estan Completos
						  <%}
						
						}else{%>
								No hay registros del Periodo
					  <%}%></td>
								   </tr>
							Total:  <%=y%> <hr />
							  </table></td>
							</tr><%
							con.close();
							conn.close();
							%>
					    </table></td>
					  </tr>
    </form>
  </table>


  </div>
</body></html>
<%} catch(Exception e){
		String error=e.toString(); 
		session.setAttribute("error",error);
		response.sendRedirect("error_fatal_form.jsp?w=1");
}%>