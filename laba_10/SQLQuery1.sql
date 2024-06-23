use UNIVERSITY

exec sp_helpindex 'AUDITORIUM'
exec sp_helpindex 'AUDITORIUM_TYPE'
exec sp_helpindex 'FACULTY'
exec sp_helpindex 'SUBJECT'
exec sp_helpindex 'PROFESSION'

DROP TABLE IF EXISTS #EXPLRE

CREATE TABLE #EXPLRE
( 
	ID int,
	NUM_STRING nvarchar(10)
)

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

SET nocount on;

DECLARE @i int = 0

while @i < 1000
begin
	INSERT #EXPLRE (ID, NUM_STRING)
	values(@i, 'string_' + CAST(@i as nvarchar(5)))
	SET @i += 1
end

SELECT* FROM #EXPLRE WHERE ID between 0 and 100000 ORDER BY ID

CREATE clustered index #EXPLRE_CL on #EXPLRE(ID asc)


-- ///////////////////// Task 7.1 ///////////////////// --

use N_MyBASE
select * From Departments, Expenses, Products

exec sp_helpindex 'Products'
exec sp_helpindex 'Expenses'
exec sp_helpindex 'Departments'

drop table if exists #task1

create table #task1
(
	name nvarchar(20),
	name_prod nvarchar(20)
)

checkpoint;
DBCC DROPCLEANBUFFERS;

insert into #task1
select Department_Name, Product_Name
FROM Expenses
WHERE Consuption_Limit = 1500 OR Consuption_Limit = 1000

select* from #task1

create index t1 on #task1(name)

