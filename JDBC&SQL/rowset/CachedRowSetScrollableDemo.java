package com.lcpan;

import java.sql.*;
import javax.sql.rowset.*;
import com.sun.rowset.*;

// Scrollable
public class CachedRowSetScrollableDemo {
	public static void main(String[] args) throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
		Connection conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
		String qryStmt = "SELECT * FROM Stock";
		PreparedStatement stmt = conn.prepareStatement(qryStmt);
		ResultSet rs = stmt.executeQuery();
		CachedRowSet crs = new CachedRowSetImpl();
		crs.populate(rs);
		conn.close();
		
		ResultSetMetaData rsmd = crs.getMetaData();
		int numberOfColumns = rsmd.getColumnCount();

		for (int i = 1; i <= numberOfColumns; i++)
			System.out.printf("%10s", rsmd.getColumnName(i));
		System.out.printf("%n");
		System.out.println("========================");
     	
		while (crs.next()) {
			for (int i = 1; i <= numberOfColumns; i++) 
				System.out.printf("%10s",crs.getString(i));
			System.out.printf("%n");
		}
		System.out.println("--------------------------------------");
		
		// crs.afterLast();
		while (crs.previous()) {
			for (int i = 1; i <= numberOfColumns; i++)
				System.out.printf("%10s",crs.getString(i));
			System.out.printf("%n"); 
		}
		crs.close();
	}// end of main()
}// end of class CachedRowSetScrollableDemo
