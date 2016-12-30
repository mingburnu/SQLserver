package com.lcpan;

import javax.sql.rowset.*;
import com.sun.rowset.*;

//Updatable
public class CachedRowSetUpdatableDemo {
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
			String symbol = crs.getString(1);
			if (symbol.equals("DELL")) {
				crs.deleteRow();
				continue;
			}
			double price = crs.getDouble(2);
			price *= 1.03;
			crs.updateDouble(2, price);
			crs.updateRow();
 		}
 		
 		crs.moveToInsertRow(); 
 		crs.updateString(1, "DELL");
 		crs.updateDouble(2, 39.7);
 		crs.insertRow();
 		crs.moveToCurrentRow();

		crs.acceptChanges(); //將修改的資料項寫回資料庫

		crs.beforeFirst();
		while(crs.next()) {
			System.out.println("stock symbol = " + crs.getString(1));
			System.out.printf("stock price = %.2f%n", crs.getDouble(2));
		}
		crs.close();
	}// end of main()
}// end of class CachedRowSetUpdatableDemo
