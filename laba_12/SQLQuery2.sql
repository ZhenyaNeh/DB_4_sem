use UNIVERSITY
begin try
	begin tran
		delete AUDITORIUM where AUDITORIUM.AUDITORIUM = '206-1';
		insert AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) VALUES ('206-1', 'ЛБ-К', 15, '206-1');
		insert AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) VALUES ('303-1', 'ЛБ-К', 15, '303-1');
	commit tran;
end try
begin catch
		print 'ошибка' + case
		when error_number() = 2627 and patindex('%AUDITORIUM_PK%', error_message()) > 0
		then ' дублирование ключа'
		else ' неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@TRANCOUNT > 0 
		rollback tran;
end catch;


use N_MyBASE
begin try
	begin tran
		delete Departments where Department_Name = 'test';
		insert Departments(Department_Name, Count_Employees) VALUES ('test', 15);
		insert Departments(Department_Name, Count_Employees) VALUES ('test', 15);
	commit tran;
end try
begin catch
		print 'ошибка' + case
		when error_number() = 2627 and patindex('%AUDITORIUM_PK%', error_message()) > 0
		then ' дублирование ключа'
		else ' неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@TRANCOUNT > 0 
		rollback tran;
end catch;