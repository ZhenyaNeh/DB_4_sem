USE UNIVERSITY

INSERT SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
		values(N'test', N'test', N'ศั่า');
go

DECLARE ForUpCursor CURSOR LOCAL DYNAMIC
	for SELECT SUBJECT, SUBJECT_NAME, PULPIT 
		FROM SUBJECT WHERE PULPIT = 'ศั่า' FOR UPDATE;

DECLARE @sub char(10), @subname char(50), @pul char(10);

OPEN ForUpCursor
	FETCH ForUpCursor into @sub, @subname, @pul
	DELETE SUBJECT where CURRENT OF ForUpCursor
	FETCH ForUpCursor into @sub, @subname, @pul
	UPDATE SUBJECT set SUBJECT = SUBJECT + 'test'
		where current of ForUpCursor 
CLOSE ForUpCursor


go
Use N_MyBASE
INSERT Departments(Department_Name, Count_Employees)
		values(N'test', 10);
go

DECLARE ForUpCursorT CURSOR LOCAL DYNAMIC
	for SELECT Department_Name, Count_Employees
		FROM Departments WHERE Department_Name = 'test' FOR UPDATE;

DECLARE @t char(10), @tt int

OPEN ForUpCursorT
	FETCH ForUpCursorT into @t, @tt
	DELETE Departments where CURRENT OF ForUpCursorT
	FETCH ForUpCursor into @t, @tt
	UPDATE Departments set Department_Name = Department_Name + 'test'
		where current of ForUpCursor 
CLOSE ForUpCursorT
