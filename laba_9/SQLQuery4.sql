USE UNIVERSITY

-- // First Task // --
print '   First Task'

DECLARE
	@z numeric(5,3), 
	@t float,
	@x float

SET @t = 1
SET @x = 1.2

IF(@t > @x)
	SET @z = SIN(@t)*SIN(@t)
ELSE IF(@t < @x)
	SET @z = 4 *(@t + @x)
ELSE
	SET @z = 1 - EXP(@x -2)

print 'Result = ' + CAST(@z as nvarchar) 
print ''

-- // Second Task // --

print '   Second Task'

DECLARE 
	@fullName nvarchar(50) = (SELECT top(1) NAME FROM STUDENT),
	@surname nvarchar(15),
	@name nvarchar(1),
	@fathername nvarchar(1)

SELECT
	@surname = PARSENAME(REPLACE(@fullname, ' ', '.'), 3),
	@name = PARSENAME(REPLACE(@fullname, ' ', '.'), 2),
	@fathername = PARSENAME(REPLACE(@fullname, ' ', '.'), 1)

print @fullname
print @surname + ' ' + @name + '.' + @fathername + '.' 
print ''

-- // Third Task // --

print '   Third Task'

DECLARE 
	@studName nvarchar(100) = (SELECT TOP(1) NAME FROM STUDENT WHERE MONTH(BDAY) = MONTH(getdate()) + 1),
	@studBday nvarchar(100)  = (SELECT TOP(1) BDAY FROM STUDENT WHERE MONTH(BDAY) = MONTH(getdate()) + 1)
DECLARE	@studAge  int = DATEDIFF(YEAR, @studBday, getdate());

print 'Students Name: ' + @studName
print 'Students Bday: ' + @studBday
print 'Students Age: ' + CAST(@studAge as nvarchar(5))
print ''

-- // Fourth Task // --

print '   Fourth Task'

DECLARE
	@dateExam date = (SELECT TOP(1) p.PDATE 
						FROM PROGRESS p 
						inner join STUDENT s ON p.IDSTUDENT = s.IDSTUDENT
						WHERE p.SUBJECT = 'ад' AND s.IDGROUP = 17)

	print DATENAME(dw, @dateExam)

