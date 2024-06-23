USE UNIVERSITY

DECLARE 
	@stud int = (SELECT COUNT(*) FROM STUDENT) - 36

IF @stud > 50
	print 'Number of students more than 50'
ELSE IF @stud < 50
	print 'Number of students less than 50'
ELSE
	print 'Number of students is 50'
