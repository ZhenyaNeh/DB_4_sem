USE UNIVERSITY

DECLARE @tv char(20), @t char(300)= '';
DECLARE DiscCursor CURSOR
	for SELECT SUBJECT FROM SUBJECT WHERE PULPIT = 'ศั่า';

OPEN DiscCursor;
	FETCH DiscCursor into @tv;
	print 'Short Name:'
	while @@FETCH_STATUS = 0
		begin
			set @t = rtrim(@tv) + ', ' + @t;
			FETCH DiscCursor into @tv;
		end
		print @t
CLOSE DiscCursor;
go

USE N_MyBASE

DECLARE @tv char(20), @t char(300)= '';
DECLARE DiscCursorT CURSOR
	for SELECT Department_Name FROM Departments WHERE Department_Name like '%Dev%' ;

OPEN DiscCursorT;
	FETCH DiscCursorT into @tv;
	print 'Short Name:'
	while @@FETCH_STATUS = 0
		begin
			set @t = rtrim(@tv) + ', ' + @t;
			FETCH DiscCursorT into @tv;
		end
		print @t
CLOSE DiscCursorT;