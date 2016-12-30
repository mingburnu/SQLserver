package com.lcpan;

public class EmpVO {
	private String empno;
	private String empname;
	private String hiredate;
	private String salary;
	private String deptno;
	private String title;
	
	public String getEmpno () {  return empno;  }
	public String getEmpname () {  return empname;  }
	public String getHiredate () {  return hiredate;  }
	public String getSalary () {  return salary;  }
	public String getDeptno () {  return deptno;  }
	public String getTitle () {  return title;  }
	
	public void setEmpno (String empno) {  this.empno = empno;  }
	public void setEmpname (String empname) {  this.empname = empname;  }
	public void setHiredate (String hiredate) {  this.hiredate = hiredate;  }
	public void setSalary (String salary) {  this.salary = salary;  }
	public void setDeptno (String deptno) {  this.deptno = deptno;  }
	public void setTitle (String title) {  this.title = title;  }
	
} // end of class EmpVO