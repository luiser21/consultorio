<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

<%
String nomc=(String)session.getAttribute("nomadmin");
String sesion=(String)session.getAttribute("admin");
String rol=(String)session.getAttribute("roles");
if(sesion==null || sesion.equals("false")){
   response.sendRedirect("login.jsp");
}
int contador=0;
		int invalidos=0;
		String periodo=String.valueOf(request.getParameter("periodo"));

	   	/*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();

		/*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
		/*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
		String archivo="";
        for(int i=0;i<items.size();i++){
			/*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
			/*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
				/*cual sera la ruta al archivo en el servidor*/
				File archivo_server = new File("c:/Tomcat/webapps/consultorio/upload/"+item.getName());
				/*y lo escribimos en el servido*/
				archivo=item.getName();					
				item.write(archivo_server);
				//String archivo=item.getName() ;
              //  out.print("Nombre --> " + item.getName() );
               // out.print("<br> Tipo --> " + item.getContentType());
               // out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
			//	out.print("<br>");
				break;
            }
        }

		Conex con = new Conex();
		
		ResultSet  rs_contar=null;						  
		String consulta_contar = "select max(id_file)+1 as archivo from file_upload";
		rs_contar = con.consultar(consulta_contar);
		rs_contar.next();	
		String id=rs_contar.getString("archivo");			
		if(id==null){	
			id="1";
		}	
		int numero_id=Integer.parseInt(id);		
		try{
		//String periodo="12013";
		String carpeta="c://Tomcat/webapps/consultorio/upload/"+archivo;
	
		String array[][]=con.readExcel(carpeta);
	
		
		for(int ii=1;ii<array.length;ii++){ 
			if(!array[ii][0].equals("") && !array[ii][1].equals("") && !array[ii][2].equals("")){
				if(array[ii][2].matches("[0-9]*") && !array[ii][1].matches("[0-9]*") && !array[ii][0].matches("[0-9]*")){
					contador++;					
					String actualiza = "insert into estudiantes_temp_excel ( cedula, nombre, apellido, perid, id_file) values(trim('"+array[ii][2]+"'),trim('"+array[ii][0]+"'),trim('"+array[ii][1]+"'),'"+periodo+"', '"+numero_id+"')";
					con.actualizar(actualiza);
				}
			}
				
		}	
		invalidos=(array.length-1)-contador;	
						  	
		String actualiza2 = "insert into file_upload (id_file, nombre, subido, transfer, invalido, datosvalidos, datosinvalidos, periodo) values('"+id+"','"+archivo+"','1','0','0','"+contador+"','"+invalidos+"','"+periodo+"')";
		con.actualizar(actualiza2);
		
		response.sendRedirect("upload.jsp?periodo="+periodo+"");
	
		}catch(Exception e){
			String actualiza2 = "insert into file_upload (nombre, subido, transfer, invalido, datosvalidos, datosinvalidos, periodo) values('"+archivo+"','0','0','0','"+contador+"','"+invalidos+"','"+periodo+"')";
		con.actualizar(actualiza2);
			String error=e.toString(); 
			session.setAttribute("error",error);
			if(session.getAttribute("roles")!=null){			
				if(!rol.equals("Admin")){
					 response.sendRedirect("ilegal.jsp");
				}else{
					response.sendRedirect("upload.jsp?periodo="+periodo);
				}
			}				
}
		
%>