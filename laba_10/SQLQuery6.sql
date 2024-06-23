use tempdb

drop table if exists #EX6
CREATE TABLE #EX6
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

checkpoint;
dbcc DROPCLEANBUFFERS;

create index IX_EX6 on #EX6 (TKEY) with (fillfactor	= 65)

set nocount on
DECLARE @i int = 0

while @i < 10000
begin
	insert #EX6(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @i += 1
end

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX6'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id =
ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;


-- ///////////////////// Task 7.6 ///////////////////// --
use N_MyBASE
drop table if exists #EX76

checkpoint;
DBCC DROPCLEANBUFFERS;

create table #EX76
(
	name nvarchar(20),
	limit int
)

create index #EX76_LIMIT on #EX76(limit) with (fillfactor = 65)
insert top(10000) #EX76 select name, limit from #EX76

insert into #EX76
select Department_Name, Consuption_Limit
FROM Expenses

use tempdb

SELECT name [Name], avg_fragmentation_in_percent [Fragmintation (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX76'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null;

