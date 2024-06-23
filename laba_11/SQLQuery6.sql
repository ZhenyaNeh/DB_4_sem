use UNIVERSITY;
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values ('КГ',   1025,  '06.05.2013', 3);

declare ProgStud CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.NOTE < 4
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int


OPEN ProgStud
FETCH ProgStud INTO @id, @nm, @nt
print @id + ': ' + @nm + ' (оценка ' + cast(@nt as varchar) + ')'
DELETE PROGRESS WHERE CURRENT OF ProgStud
CLOSE ProgStud
go


declare Prog CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.IDSTUDENT = 1017
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int

OPEN Prog
FETCH Prog INTO @id, @nm, @nt
UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF Prog
print @id + ': ' + @nm + ' (Before: ' + cast(@nt as varchar) + ' After: ' + cast(@nt + 1 as varchar) + ' )'
CLOSE Prog
go




use N_MyBASE
--delete Departments where Department_Name = 'test'

--INSERT INTO Departments (Department_Name, Count_Employees)
	--values ('Dev_1', 600)

DECLARE CursorTest CURSOR LOCAL DYNAMIC FOR
	SELECT d.Department_Name, d.Count_Employees, e.Consuption_Limit
	FROM Departments d
	INNER JOIN Expenses e ON e.Department_Name = d.Department_Name
	Where e.Consuption_Limit = 500 FOR UPDATE

DECLARE @dep nvarchar(10), @count int, @lim int

OPEN CursorTest
	FETCH CursorTest into @dep, @count, @lim
	UPDATE Departments SET Count_Employees = Count_Employees + 1 WHERE CURRENT OF CursorTest
	print @dep + ' ' + cast(@count as varchar) + ' ' + cast(@lim as varchar)
CLOSE CursorTest




