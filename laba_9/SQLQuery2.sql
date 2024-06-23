USE UNIVERSITY

DECLARE
	@totalCapacity int  = (SELECT sum(AUDITORIUM_CAPACITY) FROM AUDITORIUM),
	@countOfAudit int,
	@averageCapacity real,
	@countOfAuditLessAvg int,
	@procentAudit numeric(12,1);


IF @totalCapacity > 200
begin
	SET @countOfAudit = (SELECT count(*) FROM AUDITORIUM)
	SET @averageCapacity = (SELECT avg(AUDITORIUM_CAPACITY) FROM AUDITORIUM);
	SET @countOfAuditLessAvg = (SELECT count(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @averageCapacity);
	SET @procentAudit = ROUND((CAST(@countOfAuditLessAvg as real) / CAST(@countOfAudit as real)), 3) * 100;

	print 'Count Of Audit: ' + cast(@countOfAudit as varchar(20));
	print 'Average Capacity: ' + cast(@averageCapacity as varchar(20));
	print 'Count Of Audit Less Avg: ' + cast(@countOfAuditLessAvg as varchar(20));
	print 'Procent Audit: ' + cast(@procentAudit as varchar(20)) + '%';

end

ELSE
	print 'Total Capacity: ' + cast(@totalCapacity as varchar(20))