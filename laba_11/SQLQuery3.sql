USE UNIVERSITY

DECLARE LocalStaticCursor CURSOR LOCAL STATIC
	for SELECT SUBJECT, SUBJECT_NAME, PULPIT FROM SUBJECT WHERE PULPIT = 'ÈÑèÒ';
DECLARE LocalDynamicCursor CURSOR LOCAL DYNAMIC
	for SELECT SUBJECT, SUBJECT_NAME, PULPIT FROM SUBJECT WHERE PULPIT = 'ÈÑèÒ';

DECLARE @sub char(10), @subname char(50), @pul char(10);

--OPEN LocalStaticCursor;
OPEN LocalDynamicCursor;
	print 'Count String: ' + cast(@@CURSOR_ROWS as varchar(5));
	INSERT SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
		values(N'test4', N'test4', N'ÈÑèÒ');

	--FETCH LocalStaticCursor into @sub, @subname, @pul;
	FETCH LocalDynamicCursor into @sub, @subname, @pul;

	while @@FETCH_STATUS = 0
	begin
		print @sub + ' ' + @subname + ' ' + @pul;
		--FETCH LocalStaticCursor into @sub, @subname, @pul;
		FETCH LocalDynamicCursor into @sub, @subname, @pul;
	end
CLOSE LocalDynamicCursor
--CLOSE LocalStaticCursor;
go

SELECT*
FROM SUBJECT
WHERE PULPIT = 'ÈÑèÒ'

--delete SUBJECT where SUBJECT like '%test%'
go


USE N_MyBASE

DECLARE LocalStaticCursorT CURSOR LOCAL STATIC
	for SELECT Department_Name, Count_Employees FROM Departments WHERE Department_Name like '%Dev%';
DECLARE LocalDynamicCursorT CURSOR GLOBAL DYNAMIC
	for SELECT Department_Name, Count_Employees FROM Departments WHERE Department_Name like '%Dev%';

DECLARE @tv char(20), @t int;

--OPEN LocalStaticCursorT;
OPEN LocalDynamicCursorT;
	print 'Count String: ' + cast(@@CURSOR_ROWS as varchar(5));
	INSERT Departments(Department_Name, Count_Employees)
		values(N'test', 10);

	--FETCH LocalStaticCursorT into @tv, @t;
	FETCH LocalDynamicCursorT into @tv, @t;

	while @@FETCH_STATUS = 0
	begin
		print @tv + ' ' + cast(@t as varchar(5));
		--FETCH LocalStaticCursorT into @tv, @t;
		FETCH LocalDynamicCursorT into @tv, @t;
	end
CLOSE LocalDynamicCursorT
--CLOSE LocalStaticCursorT;
go

SELECT*
FROM Departments


--delete Departments where Department_Name like '%test%'