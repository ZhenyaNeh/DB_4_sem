Use UNIVERSITY
go
CREATE PROCEDURE PSUBJECT
as
Begin
	declare @param int = (select count(*) from SUBJECT);
	select top(8) s.SUBJECT[���], s.SUBJECT_NAME[���������], s.PULPIT[�������] from SUBJECT s
	return @param
End

DECLARE @p int = 0;
EXEC @p = PSUBJECT;
print'count: ' + cast(@p as nvarchar(10))

drop proc PSUBJECT;
