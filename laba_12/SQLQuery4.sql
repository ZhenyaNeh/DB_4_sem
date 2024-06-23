--Неподтвержденное чтение, Неповторяющееся чтение, Фантомное чтение
-- uncomitted - поддерживает неподтвержденное чтение, т.е. запросы между t1 и t2 выполняются даже без commit в B тран-ии

use UNIVERSITY
set transaction isolation level READ UNCOMMITTED 
--------- A ---------
begin transaction 
-------------------------- t1 ------------------
select @@SPID Процесс, 'INSERT AUDITORIUM' Результат, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
select @@SPID Процесс, 'UPDATE AUDITORIUM' Результат, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
commit
-------------------------- t2 -----------------
--------- B ---------
begin transaction 
insert AUDITORIUM values ('123456', 'ЛК-К', 80, '1234')
update AUDITORIUM set AUDITORIUM = '123456'
				  where AUDITORIUM = '1234567' 
-------------------------- t1 --------------------
-------------------------- t2 --------------------
rollback


use N_MyBASE
set transaction isolation level READ UNCOMMITTED 
--------- A ---------
begin transaction 
-------------------------- t1 ------------------
select @@SPID Процесс, 'INSERT AUDITORIUM' Результат, 
	   * from Departments where Department_Name = 'test'
select @@SPID Процесс, 'UPDATE AUDITORIUM' Результат, 
	   * from Departments where Department_Name = 'test'
commit
-------------------------- t2 -----------------
--------- B ---------
begin transaction 
insert Departments values ('test', 80)
update Departments set Department_Name = 'test'
				  where Department_Name = 'test1' 
-------------------------- t1 --------------------
-------------------------- t2 --------------------
rollback

--delete Departments Where Department_Name = 'test'