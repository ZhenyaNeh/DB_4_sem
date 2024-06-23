use UNIVERSITY

--drop function if exists COUNT_STUDENTS

go
create function COUNT_STUDENTS (@faculty varchar(20)) returns int
begin
	declare @COUNT int = (select count(*)
						  from STUDENT s
						  join GROUPS g on s.IDGROUP = g.IDGROUP
						  join FACULTY f on f.FACULTY = g.FACULTY
						  where g.FACULTY = @faculty)
	return @COUNT
end
go


declare @count int = dbo.COUNT_STUDENTS('евшв')
print @count
