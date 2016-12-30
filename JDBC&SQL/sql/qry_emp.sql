IF OBJECT_ID ( 'qry_emp', 'P' ) IS NOT NULL 
    DROP PROCEDURE qry_emp;
GO
CREATE PROCEDURE qry_emp (
	@Empno		decimal(4),
	@Empname	varchar(30)		OUT,
	@Salary		decimal(10,2)	OUT
)
AS
BEGIN
	SELECT @Empname = empname, @Salary = salary FROM employee WHERE empno = @Empno;
END;
GO
