alter proc PSUBJECT @p varchar(20)
as Begin
	select* from SUBJECT Where PULPIT = @p
end

--Drop table #SUBJECT

Create table #SUBJECT
(
	код varchar(10) primary key,
	дисциплина varchar(50),
	кафедра varchar(10)
)

insert #SUBJECT exec PSUBJECT @p = 'ИСиТ'

select* From #SUBJECT
