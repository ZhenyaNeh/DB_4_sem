Use UNIVERSITY
go
CREATE PROCEDURE PSUBJECT
as
Begin
	declare @param int = (select count(*) from SUBJECT);
	select top(8) s.SUBJECT[код], s.SUBJECT_NAME[дисциплиа], s.PULPIT[кафедра] from SUBJECT s
	return @param
End

DECLARE @p int = 0;
EXEC @p = PSUBJECT;
print'count: ' + cast(@p as nvarchar(10))

drop proc PSUBJECT;
