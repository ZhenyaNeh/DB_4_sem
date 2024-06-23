USE UNIVERSITY

DECLARE ScrollCursor CURSOR LOCAL STATIC SCROLL
		for SELECT row_number() over (order by SUBJECT) N, SUBJECT 
			FROM SUBJECT WHERE PULPIT = 'ศั่า';

	DECLARE  @tc int, @rn char(50);  

OPEN ScrollCursor
	FETCH FIRST from ScrollCursor into @tc, @rn;
	print 'FIRST: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH NEXT from ScrollCursor into @tc, @rn;
	print 'Next: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH PRIOR from ScrollCursor into @tc, @rn;
	print 'PRIOR: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH ABSOLUTE 3 from ScrollCursor into @tc, @rn;
	print 'ABSOLUTE 3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH ABSOLUTE -3 from ScrollCursor into @tc, @rn;
	print 'ABSOLUTE -3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH RELATIVE -3 from ScrollCursor into @tc, @rn;
	print 'RELATIVE -3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH RELATIVE 3 from ScrollCursor into @tc, @rn;
	print 'RELATIVE 3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH LAST from ScrollCursor into @tc, @rn;
	print 'LAST: ' + cast(@tc as varchar(3))+ rtrim(@rn);
CLOSE ScrollCursor


go

use N_MyBASE
DECLARE ScrollCursorT CURSOR LOCAL STATIC SCROLL
	for SELECT row_number() over (order by Department_Name) N, Department_Name 
			FROM Departments WHERE Department_Name like '%Dev%';

DECLARE  @tc int, @rn char(10);  

OPEN ScrollCursorT
	FETCH FIRST from ScrollCursorT into @tc, @rn;
	print 'FIRST: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH NEXT from ScrollCursorT into @tc, @rn;
	print 'Next: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH PRIOR from ScrollCursorT into @tc, @rn;
	print 'PRIOR: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH ABSOLUTE 3 from ScrollCursorT into @tc, @rn;
	print 'ABSOLUTE 3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH ABSOLUTE -3 from ScrollCursorT into @tc, @rn;
	print 'ABSOLUTE -3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH RELATIVE -3 from ScrollCursorT into @tc, @rn;
	print 'RELATIVE -3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH RELATIVE 3 from ScrollCursorT into @tc, @rn;
	print 'RELATIVE 3: ' + cast(@tc as varchar(3))+ rtrim(@rn);

	FETCH LAST from ScrollCursorT into @tc, @rn;
	print 'LAST: ' + cast(@tc as varchar(3))+ rtrim(@rn);
CLOSE ScrollCursorT