USE UNIVERSITY

DECLARE LocalCursor CURSOR LOCAL
	for SELECT SUBJECT FROM SUBJECT WHERE PULPIT = 'ศั่า';
DECLARE GlobalCursor CURSOR GLOBAL
	for SELECT SUBJECT FROM SUBJECT WHERE PULPIT = 'ศั่า';

DECLARE @tv char(20);
OPEN LocalCursor;
	FETCH LocalCursor into @tv;
	print '1. ' + @tv
	go
	DECLARE @tv char(20);
	FETCH LocalCursor into @tv
	print '2. ' + @tv
--CLOSE LocalCursor;
go

DECLARE @tv char(20);
OPEN GlobalCursor;
	FETCH GlobalCursor into @tv;
	print '1. ' + @tv
	go
	DECLARE @tv char(20);
	FETCH GlobalCursor into @tv
	print '2. ' + @tv
CLOSE GlobalCursor;
go


USE N_MyBASE

DECLARE LocalCursorT CURSOR LOCAL
	for SELECT Department_Name FROM Departments WHERE Department_Name like '%Dev%';
DECLARE GlobalCursorT CURSOR GLOBAL
	for SELECT Department_Name FROM Departments WHERE Department_Name like '%Dev%';

DECLARE @tv char(20);
OPEN LocalCursorT;
	FETCH LocalCursorT into @tv;
	print '1. ' + @tv
	go
	DECLARE @tv char(20);
	FETCH LocalCursorT into @tv
	print '2. ' + @tv
--CLOSE LocalCursor;
go

DECLARE @tv char(20);
OPEN GlobalCursorT;
	FETCH GlobalCursorT into @tv;
	print '1. ' + @tv
	go
	DECLARE @tv char(20);
	FETCH GlobalCursorT into @tv
	print '2. ' + @tv
CLOSE GlobalCursorT;