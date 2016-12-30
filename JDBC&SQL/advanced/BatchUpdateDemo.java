package com.lcpan;

import java.sql.*;
import java.util.*;

public class BatchUpdateDemo {
	public static void main(String[] args) {
		Connection conn = null;

		try {     
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			
			List<EmpRec> emps = new ArrayList<EmpRec>();
			String qryStmt = "SELECT empno, salary FROM employee";
			PreparedStatement pstmt = conn.prepareStatement(qryStmt);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				EmpRec emp = new EmpRec(rs.getString("empno"),rs.getDouble("salary"));
				emps.add(emp);
			}
		
			String updateStmt = "UPDATE employee SET salary = ? WHERE empno = ?";
			pstmt = conn.prepareStatement(updateStmt);
			double currentSalary;
			for (int i = 0; i < emps.size(); i++) {
    			currentSalary = (emps.get(i)).getSalary() * 1.1;
   				pstmt.setDouble(1, currentSalary);
				pstmt.setString(2, (emps.get(i)).getEmpNo());
				pstmt.addBatch();
			}
			pstmt.executeBatch();
	
			qryStmt = "SELECT empname, salary FROM employee";
			pstmt = conn.prepareStatement(qryStmt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("name = " + rs.getString("empname"));
				System.out.println("salary = " + rs.getDouble("salary"));
			}
		} catch (Exception e) {
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
}// end of class BatchUpdateDemo

class EmpRec {
	private String empno;
	private double salary;
	public EmpRec(String empno, double salary) {
		this.empno = empno;
		this.salary = salary;
	}
	public String getEmpNo() { return empno; }
	public double getSalary() { return salary; }
}// end of class EmpRec
