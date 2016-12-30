--S=1+2+...+100

--using  T-SQL
declare  @x int  = 1,
           @s int  = 0;
  while (@x<= 100)
  BEGIN
      set @S=@S+@x;
      set @x=@x+1;
  END;
  select @s

go
--using Procedure

create procedure S1 (@vx int)
AS
BEGIN
  declare  @x int  = 1,
           @s int  = 0;
  while (@x<= @vx)
  BEGIN
      set @S=@S+@x;
      set @x=@x+1;
  END;
  select @s
END;

--run
exec S1 100
go
--Using Function

create function F1(@vx int)
RETURNS int
AS
BEGIN
  declare  @x int  = 1,
           @s int  = 0;
  while (@x<= @vx)
  BEGIN
      set @S=@S+@x;
      set @x=@x+1;
  END;
  RETURN @s
END;
go
--run

declare @s int
set  @s = dbo.F1(100)
select @s

select dbo.F1(100)