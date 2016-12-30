IF OBJECT_ID ( 'upd_emp_salary', 'P' ) IS NOT NULL 
    DROP PROCEDURE upd_emp_salary;
GO

CREATE PROCEDURE upd_emp_salary (
	@Salary		decimal(10,2),
	@Empno		decimal(4)
)
AS
BEGIN
	UPDATE employee SET salary = @Salary WHERE empno = @Empno;
END;
GO
