package com.lcpan;

import java.util.*;

public interface IEmpDAO {
	public int insert (EmpVO emp);
	public int update (EmpVO emp);
	public int delete (String empno);
	public EmpVO findByPrimaryKey (String empno);
	public List<EmpVO> getAll ();
} // end of class IEmpDAO