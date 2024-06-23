CREATE TABLE #EX4
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 20000
begin
	insert #EX4(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('string', 10))
	set @I += 1
end

SELECT TKEY FROM #EX4 WHERE TKEY BETWEEN 5000 AND 19999 
SELECT TKEY FROM #EX4 WHERE TKEY > 15000 AND TKEY < 20000  
SELECT TKEY FROM #EX4 WHERE TKEY = 17000

CREATE INDEX IX_dbo_EX4_FILTER ON #EX4 (TKEY) WHERE (TKEY > 15000 and TKEY < 20000)

-- ///////////////////// Task 7.4 ///////////////////// --

use N_MyBASE
drop table if exists #EX74

checkpoint;
DBCC DROPCLEANBUFFERS;

create table #EX74
(
	spend int,
	limit int
)

insert into #EX74
select Amount_Spent, Consuption_Limit
FROM Expenses

SELECT spend FROM #EX74 WHERE limit between 100 and 2000
SELECT spend FROM #EX74 WHERE limit > 10 and limit < 20000
SELECT spend FROM #EX74 WHERE limit = 800

CREATE INDEX #EX4_INDEX ON #EX74(limit) WHERE (limit > 10 and limit < 20000)