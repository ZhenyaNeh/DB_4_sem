use UNIVERSITY
begin tran
	insert AUDITORIUM_TYPE values ('��-�', '������������ � ����������')
	begin tran
		update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM_TYPE = '��-�'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from AUDITORIUM where AUDITORIUM_TYPE = '��-�') ���������,
	   (select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE = '��-�') ���
go


use N_MyBASE
begin tran
	insert Departments values ('test', 10)
	begin tran
		update Expenses set Product_Name = 'test' where Department_Name = 'test'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from Departments where Department_Name = 'test') ���������,
	   (select count(*) from Expenses where Product_Name= 'test') ���