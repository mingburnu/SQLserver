package com.lcpan;

import java.sql.*;

// Query all employees using PrepareStatement
public class QueryDemo3 {
	public static void main(String[] args) {
		Connection conn = null;
		try {     
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			
			PreparedStatement pstmt = conn.prepareStatement("SELECT empname, salary FROM employee");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("name = " + rs.getString("empname"));
				System.out.println("salary = " + rs.getDouble("salary"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch(Exception e) { 
					e.printStackTrace();
				}
		}
	}// end of main()
}// end of class QueryDemo3
