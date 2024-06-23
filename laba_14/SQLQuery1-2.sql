use UNIVERSITY
go
alter function COUNT_STUDENTS (@faculty varchar(20), @prof varchar(20) = '1-48 01 02') returns int
begin
	declare @COUNT int = (select count(*)
						  from STUDENT s
						  join GROUPS g on s.IDGROUP = g.IDGROUP
						  join FACULTY f on f.FACULTY = g.FACULTY
						  where g.FACULTY = @faculty and g.PROFESSION = @prof )
	return @COUNT
end
go

declare @count int = dbo.COUNT_STUDENTS('ÒÎÂ', '1-48 01 02')
print @count

