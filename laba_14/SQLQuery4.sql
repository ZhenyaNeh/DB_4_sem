use UNIVERSITY
go
create function FCTEACHER (@PULPIT varchar(20)) returns int
as begin
	declare @COUNT int = (select count(*)
						  from   TEACHER t
						  where  t.PULPIT = isnull(@PULPIT, t.PULPIT))
	return @COUNT
end
go

print 'Total teachers count: ' + cast(dbo.FCTEACHER(null) as varchar)
print 'Teacher count on ISiT:  ' + cast(dbo.FCTEACHER('ศั่า') as varchar)
select PULPIT [pulpit], dbo.FCTEACHER(PULPIT) [COUNT]
from   PULPIT