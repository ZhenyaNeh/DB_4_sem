

alter proc PSUBJECT @p varchar(20), @c int output
as begin
	Declare @res int =  (select count(*) from SUBJECT);
	select s.SUBJECT[код], s.SUBJECT_NAME[дисциплиа], s.PULPIT[кафедра] from SUBJECT s Where s.PULPIT = @p
	set @c = @@rowcount;
	return @res
end

DECLARE @result int = 0, @outparam int = 0--, @p varchar(20);
EXEC @result = PSUBJECT @p ='ИСиТ',@c = @outparam output;
print'Total count: ' + cast(@result as nvarchar(10))
print'Count Sub whith pulpit ' + ': ' + cast(@outparam as nvarchar(5))


drop proc PSUBJECT;