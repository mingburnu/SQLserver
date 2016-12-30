package com.lcpan;

import java.util.*;

public class EmpDAODemo {
	public static void main(String[] args) {
		IEmpDAO dao = new EmpDAO();
		
		// insert 
		EmpVO emp1 = new EmpVO();
		emp1.setEmpno("1009");
		emp1.setEmpname("Jean Tsao");
		emp1.setHiredate("2008/10/20");
		emp1.setSalary("45600");
		emp1.setDeptno("100");
		emp1.setTitle("senior engineer");
		int count1 = dao.insert(emp1);
		System.out.println("insert " + count1 + " rows");
		System.out.println("---------------------------------");
		
		// update 
		EmpVO emp2 = new EmpVO();
		emp2.setEmpno("1009");
		emp2.setEmpname("Jean Tsao");
		emp2.setHiredate("2008/10/22");
		emp2.setSalary("55600");
		emp2.setDeptno("100");
		emp2.setTitle("senior engineer");
		int count2 = dao.update(emp2);
		System.out.println("update " + count2 + " rows");
		System.out.println("---------------------------------");
	
		// find by PrimaryKey 
		EmpVO emp3 = dao.findByPrimaryKey("1009");
		System.out.println("empno = " + emp3.getEmpno());
		System.out.println("empname = " + emp3.getEmpname());
		System.out.println("hiredate = " + emp3.getHiredate());
		System.out.println("salary = " + emp3.getSalary());
		System.out.println("deptno = " + emp3.getDeptno());
		System.out.println("title = " + emp3.getTitle());
		System.out.println("---------------------------------");
		
		// get all emp 
		List<EmpVO> emps = dao.getAll();
		for (EmpVO emp : emps) {
			System.out.print(emp.getEmpno() + ", ");
			System.out.print(emp.getEmpname() + ", ");
			System.out.print(emp.getHiredate() + ", ");
			System.out.print(emp.getSalary() + ", ");
			System.out.print(emp.getDeptno() + ", ");
			System.out.print(emp.getTitle() + "\n");
		}
		System.out.println("---------------------------------");
		
		// delete 
		int count3 = dao.delete("1009");
		System.out.println("delete " + count3 + " rows");
	
	}
} // end of class EmpDAODemo