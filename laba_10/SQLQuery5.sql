use tempdb

drop table if exists #EX5
CREATE TABLE #EX5
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

checkpoint;
dbcc DROPCLEANBUFFERS;
set nocount on
declare @i int = 0

while @i < 30000
begin
	insert #EX5(TKEY, TF) 
	values (floor(10000 * rand()), replicate ('строка', 3))
	set @i += 1
end

CREATE INDEX #EX5_TKEY on #EX5(TKEY)
INSERT top(30000) #EX5(TKEY, TF) select TKEY, TF from #EX5;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX5'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = 
ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;

ALTER INDEX #EX5_TKEY ON #EX5 reorganize
ALTER INDEX  #EX5_TKEY ON #EX5 rebuild with (online = off)
drop index #EX5_TKEY on #EX5


-- ///////////////////// Task 7.5 ///////////////////// --
use N_MyBASE
drop table if exists #EX75

checkpoint;
DBCC DROPCLEANBUFFERS;

create table #EX75
(
	name nvarchar(20),
	limit int
)

create index #EX75_LIMIT on #EX75(limit)
insert top(10000) #EX75 select name, limit from #EX75

insert into #EX75
select Department_Name, Consuption_Limit
FROM Expenses

use tempdb

SELECT name [Name], avg_fragmentation_in_percent [Fragmintation (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX75'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null;

Alter index #EX75_LIMIT on #EX75 reorganize
Alter index #EX75_LIMIT on #EX75 rebuild with(online = off)
drop index #EX75_LIMIT on #EX75
