package com.lcpan;

import java.sql.*;
import javax.sql.rowset.*;
import com.sun.rowset.*;

//將己存在的ResultSet封裝成CachedRowSet
public class CachedRowSetQueryDemo3 {
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

		while(crs.next()) {
			System.out.println("stock symbol = " + crs.getString(1));
			System.out.printf("stock price = %.2f%n", crs.getDouble(2));
 		}
 		crs.close();
  	}// end of main()
}// end of class CachedRowSetQueryDemo3
