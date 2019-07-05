/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbms;
import java.sql.*;
import javax.swing.*;
/**
 *
 * @author Asus
 */
public class Driver {
    	private static final String username = "root";
	private static final String password = "pv013";
	private static final String conn_string = "jdbc:mysql://localhost:3306/library";
	Driver(){
		Connection conn = null;
		try
		{
			conn = DriverManager.getConnection(conn_string,username,password);
			System.out.println("connected");
		}
		catch(SQLException e)
		{
			System.err.println(e);
		}
		
	}
	

	public static void main(String[] args) {
		Driver driver = new Driver();

	}
    
}
