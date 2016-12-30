package com.lcpan;

import java.util.*;
import java.sql.*;

public class EmpDAO implements IEmpDAO {
	private static final String INSERT_STMT =
		"INSERT INTO employee VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT =
		"UPDATE employee SET empname=?, hiredate=?, salary=?, deptno=?, title=? WHERE empno=?";
	private static final String DELETE_STMT =
		"DELETE employee WHERE empno=?";
	private static final String GET_ONE_STMT =
		"SELECT empno, empname, hiredate, salary, deptno, title FROM employee WHERE empno=?";
	private static final String GET_ALL_STMT = 
		"SELECT empno, empname, hiredate, salary, deptno, title FROM employee ORDER BY empno";
	
	Connection conn = null;
	private void getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=db01";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insert (EmpVO emp){
		int updateCount = 0;
		try {     
			getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setString(1, emp.getEmpno());
			pstmt.setString(2, emp.getEmpname());
			pstmt.setString(3, emp.getHiredate());
			pstmt.setString(4, emp.getSalary());
			pstmt.setString(5, emp.getDeptno());
			pstmt.setString(6, emp.getTitle());
			updateCount = pstmt.executeUpdate();
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
		return updateCount;
	}
	
	public int update (EmpVO emp){
		int updateCount = 0;
		try {     
			getConnection();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, emp.getEmpname());
			pstmt.setString(2, emp.getHiredate());
			pstmt.setString(3, emp.getSalary());
			pstmt.setString(4, emp.getDeptno());
			pstmt.setString(5, emp.getTitle());
			pstmt.setString(6, emp.getEmpno());
			updateCount = pstmt.executeUpdate();
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
		return updateCount;
	}
	
	public int delete (String empno) {
		int updateCount = 0;
		try {     
			getConnection();
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
			pstmt.setString(1, empno);
			updateCount = pstmt.executeUpdate();
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
		return updateCount;
	}
	
	public EmpVO findByPrimaryKey (String empno){
		EmpVO emp = null;
		try {
			getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, empno);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				emp = new EmpVO();
				emp.setEmpno(rs.getString("empno"));
				emp.setEmpname(rs.getString("empname"));
				emp.setHiredate(rs.getString("hiredate"));
				emp.setSalary(rs.getString("salary"));
				emp.setDeptno(rs.getString("deptno"));
				emp.setTitle(rs.getString("title"));
			}
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
		return emp;
	}

	public List<EmpVO> getAll (){
		EmpVO emp = null;
		List<EmpVO> emps = new ArrayList<EmpVO>();
		try {     
			getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				emp = new EmpVO();
				emp.setEmpno(rs.getString("empno"));
				emp.setEmpname(rs.getString("empname"));
				emp.setHiredate(rs.getString("hiredate"));
				emp.setSalary(rs.getString("salary"));
				emp.setDeptno(rs.getString("deptno"));
				emp.setTitle(rs.getString("title"));
				emps.add(emp);
			}
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
		return emps;
	}
} // end of class EmpDAO