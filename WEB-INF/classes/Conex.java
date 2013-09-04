package db;

import java.sql.*;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.jar.*;
import java.util.zip.*;
import java.util.*;
import java.io.File;
import java.io.IOException;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.WorkbookSettings;


public class Conex
{
	Connection conexion;
	Statement sentencia;
	

	public Conex()throws SQLException, ClassNotFoundException
	{
		Class.forName("org.postgresql.Driver");
		this.conexion=DriverManager.getConnection("jdbc:postgresql://localhost:5432/consultorio","postgres","301-mami");
		this.sentencia=this.conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	}	
	

	public void actualizar(String actualiza)throws SQLException
	{
		this.sentencia.executeUpdate(actualiza);
	}
	
	public ResultSet consultar(String consulta)throws SQLException
	{
		return (this.sentencia.executeQuery(consulta));
	}	
	
	
	public int contar(ResultSet rS)throws SQLException
	{
		int cont=0;
		rS.beforeFirst();
		while(rS.next()) cont++;
		return (cont);
	}
	
	public Connection getConexion() throws SQLException{
	    return this.conexion;
	}
	
	public void close() throws SQLException{
		this.conexion.close();
		this.sentencia.close();
	}
	public String[][] readExcel(String excel_file) throws SQLException, IOException, BiffException{
		
	//	excel_file = "c://libro.xls";
            
        WorkbookSettings wbs= new WorkbookSettings();
       // wbs.setEncoding("UTF-8");
        
        Workbook workbook = Workbook.getWorkbook(new File(excel_file), wbs); //Creamos un Workbook para cargar el XLS en memoria

 
        //ruta de la hoja del calculo 
        //Workbook workbook = Workbook.getWorkbook(new File("c://libro.xls"));
       
        Sheet sheet = workbook.getSheet(0);//Elegimos la primera hoja
       
        Cell celdaCurso = null;//inicializo el objeto que leerá el valor de la celda
       
        String valorCeldaNombre=null;
        
        String valorCeldaApellido=null;
        String valorCeldaIdentificacion=null;
        
        String  nombre_array[][];
        
        
        //Incialiar array/////////////////////////////////////////////////////////////////////////////
        
        int y=1;        
        boolean aux=true;
        do{
	        
	       try{
		        celdaCurso= sheet.getCell(1,y);//celda de la columna 7 y fila 1
		        valorCeldaNombre= celdaCurso.getContents();//obteniendo valor		       
		      
	        }catch (Exception e) {
				aux=false;
			} 
			y++;     
       }while(aux);
       
       	nombre_array = new String[y-1][3];
       	
       	
       	
       	 //Nombre/////////////////////////////////////////////////////////////////////////////
        
        int i=0;        
        aux=true;
        do{
	        i++;
	       try{
		        celdaCurso= sheet.getCell(0,i);//celda de la columna 7 y fila 1
		        valorCeldaNombre= celdaCurso.getContents();//obteniendo valor		       
		      	nombre_array[i][0]=valorCeldaNombre;
	        }catch (Exception e) {
				aux=false;
			} 
			     
       }while(aux);
       
       ///Apellidos ////////////////////////////////////////////////////////////////////////////
       
       i=0;        
        aux=true;
        do{
	        i++;
	       try{
		        celdaCurso= sheet.getCell(1,i);//celda de la columna 7 y fila 1
		        valorCeldaApellido= celdaCurso.getContents();//obteniendo valor		       
		     	nombre_array[i][1]=valorCeldaApellido;
	        }catch (Exception e) {
				aux=false;
			}      
       }while(aux);
       
       //Identificacion//////////////////////////////////////////////////////////////////////////
       
       i=0;        
        aux=true;
        do{
	        i++;
	       try{
		        celdaCurso= sheet.getCell(2,i);//celda de la columna 7 y fila 1
		        valorCeldaIdentificacion= celdaCurso.getContents();//obteniendo valor		       
		        nombre_array[i][2]=valorCeldaIdentificacion;
	        }catch (Exception e) {
				aux=false;
			}      
       }while(aux);
            
        workbook.close();
       
		
		return (nombre_array);
	}
	public boolean isNumeric(String cadena){
	    try {
		    Integer.parseInt(cadena);
		    return true;
	    } catch (NumberFormatException nfe){
	   		return false;
	    }
    }
	
		
}