drop table if exists #EX

CREATE table #EX
(    TKEY int, 
      CC int identity(1, 1),
      TF varchar(100)
);

set nocount on;           
declare @i int = 0;

while   @i < 20000      
begin
       INSERT #EX(TKEY, TF) values(floor(30000 * RAND()), replicate('string ', 10));
       set @i = @i + 1; 
end;

CREATE index #EX_NONCLU on #EX(TKEY, CC);

SELECT * from  #EX where  TKEY > 1500 and  CC < 4500;  
SELECT * from  #EX order by  TKEY, CC;
SELECT * from  #EX where  TKEY = 556 and  CC > 3;

-- ///////////////////// Task 7.2 ///////////////////// --

use N_MyBASE
drop table if exists #EX72

checkpoint;
DBCC DROPCLEANBUFFERS;

create table #EX72
(
	spend int,
	limit int
)

insert into #EX72
select Amount_Spent, Consuption_Limit
FROM Expenses

CREATE index #EX72_NONCLU on #EX72(spend, limit);

SELECT * from  #EX72 where  spend > 10 and  limit < 6000;  
SELECT * from  #EX72 order by  spend, limit;
SELECT * from  #EX72 where  spend = 800 and  limit > 3;