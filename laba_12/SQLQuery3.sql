use UNIVERSITY
DECLARE @point varchar(3)

BEGIN TRY
	BEGIN TRAN
		DELETE FROM AUDITORIUM WHERE AUDITORIUM = '123-1'
		SET @point = 'p1'; SAVE TRAN @point
		INSERT INTO AUDITORIUM VALUES('test', 'ЛК-К', 40, 'test1')
		SET @point = 'p2'; SAVE TRAN @point
		INSERT INTO AUDITORIUM VALUES('test', 'ЛБ-К', 50, 'test2')
		SET @point = 'p3'; SAVE TRAN @point
	COMMIT TRAN
END TRY
BEGIN CATCH
	print 'Ошибка: ' + error_message()
	IF @@TRANCOUNT > 0
	BEGIN
		print 'Контрольная точка: ' + cast(@point as varchar)
		ROLLBACK TRAN @point
		COMMIT TRAN
	END
END CATCH
go


DECLARE @point varchar(3)
use N_MyBASE
begin try
	begin tran
		delete Departments where Department_Name = 'test';
		SET @point = 'p1'; SAVE TRAN @point
		insert Departments(Department_Name, Count_Employees) VALUES ('test', 15);
		SET @point = 'p2'; SAVE TRAN @point
		insert Departments(Department_Name, Count_Employees) VALUES ('test', 15);
		SET @point = 'p3'; SAVE TRAN @point
	commit tran;
end try
BEGIN CATCH
		print 'Ошибка: ' + error_message()
	IF @@TRANCOUNT > 0
	BEGIN
		print 'Контрольная точка: ' + cast(@point as varchar)
		ROLLBACK TRAN @point
		COMMIT TRAN
	END
END CATCH