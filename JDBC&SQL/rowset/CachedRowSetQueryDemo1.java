package com.lcpan;

import javax.sql.rowset.*;
import com.sun.rowset.*;

//自動連線,執行Query,再斷線
public class CachedRowSetQueryDemo1 {
	public static void main(String[] args) throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		CachedRowSet crs = new CachedRowSetImpl();
		crs.setUrl("jdbc:sqlserver://localhost:1433;databaseName=db01");
		crs.setUsername("sa");
		crs.setPassword("passw0rd");
		String qryStmt = "SELECT * FROM Stock";
		crs.setCommand(qryStmt);
		crs.execute();//自動連線,執行Query,再斷線

		while(crs.next()) {
			System.out.println("stock symbol = " + crs.getString(1));
			System.out.printf("stock price = %.2f%n", crs.getDouble(2));
 		}
		crs.close();
	}// end of main()
}// end of class CachedRowSetQueryDemo1
