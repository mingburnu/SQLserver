package com.lcpan;

import java.sql.*;
import javax.sql.rowset.*;
import com.sun.rowset.*;

//使用現有的連線
public class CachedRowSetQueryDemo2 {
	public static void main(String[] args) throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
		Connection conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
		CachedRowSet crs = new CachedRowSetImpl();
		String qryStmt = "SELECT * FROM Stock";
		crs.setCommand(qryStmt);
		crs.execute(conn);
		conn.close();

		while(crs.next()) {
			System.out.println("stock symbol = " + crs.getString(1));
			System.out.printf("stock price = %.2f%n", crs.getDouble(2));
 		}
		crs.close();
	}// end of main()
}// end of class CachedRowSetQueryDemo2
