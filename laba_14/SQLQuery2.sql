use UNIVERSITY
go
create function FSUBJECTS (@PULPIT varchar(20)) returns varchar(300)
as begin
	declare @OUT varchar(300) = 'Subject: '
	declare @SUBJ varchar(100) = ''
	declare cur cursor local static for
		(select s.SUBJECT 
		 from   SUBJECT s 
		 where  s.PULPIT = @PULPIT)
	open cur
	fetch cur into @SUBJ
	while @@FETCH_STATUS = 0
	begin
		set @OUT += rtrim(ltrim(@SUBJ)) + ', '
		fetch cur into @SUBJ
	end
	return @OUT
end

--drop function FSUBJECTS

select PULPIT [pulpit], dbo.FSUBJECTS(PULPIT) [SUB]
from   PULPIT