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
		
}