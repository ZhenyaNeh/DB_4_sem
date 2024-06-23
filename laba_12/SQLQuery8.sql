use UNIVERSITY
begin tran
	insert AUDITORIUM_TYPE values ('ЛБ-П', 'Лабораторный с проектором')
	begin tran
		update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM_TYPE = 'ЛБ-П'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from AUDITORIUM where AUDITORIUM_TYPE = 'ЛБ-П') Аудитории,
	   (select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'ЛБ-П') Тип
go


use N_MyBASE
begin tran
	insert Departments values ('test', 10)
	begin tran
		update Expenses set Product_Name = 'test' where Department_Name = 'test'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from Departments where Department_Name = 'test') Аудитории,
	   (select count(*) from Expenses where Product_Name= 'test') Тип