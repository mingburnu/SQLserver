package com.lcpan;

import java.sql.*;

public class SQLExceptionDemo {
	public static void main(String[] args) {
		Connection conn = null;
		try {     
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			
			String qryStmt = "SELECT * FROM employe"; // error here
			PreparedStatement stmt = conn.prepareStatement(qryStmt); 
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("name = " + rs.getString("empname"));
				System.out.println("salary =" + rs.getDouble("salary"));
			}
		} catch (SQLException e) {
			System.out.println("Message : " + e.getMessage());
			System.out.println("Vendor code : " + e.getErrorCode());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch(Exception e) { e.printStackTrace(); }
		}
	}// end of main()
}// end of class SQLExceptionDemo 
