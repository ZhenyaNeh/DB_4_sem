-- commited - запросы между t1 и t2 не будут работать пока мы не произведем commit в тран-и B
use UNIVERSITY
insert AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) 
	values ('1234', 'ЛК-К', 12, '1234')
go
set transaction isolation level READ COMMITTED 
-- A ---
begin transaction 
select count(*) from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 ------------------ 
select 'update' результат, count(*)[count] from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t2 -----------------
select 'update' результат, count(*)[count] from AUDITORIUM where AUDITORIUM = '1234'
commit
--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
update AUDITORIUM set AUDITORIUM = '123456' where AUDITORIUM = '1234' 
commit
-------------------------- t2 --------------------


go
DELETE AUDITORIUM WHERE AUDITORIUM = '123456'




use N_MyBASE
set transaction isolation level READ COMMITTED 
--------- A ---------
begin transaction 
select count(*) from Departments where Department_Name = 'test'
-------------------------- t1 ------------------
-------------------------- t2 -----------------
select 'UPDATE' Результат, count(*) from Departments where Department_Name = 'test'
commit
--------- B ---------
begin transaction 
-------------------------- t1 --------------------
update Departments set Department_Name = 'test'
				  where Department_Name = 'test1' 
commit
-------------------------- t2 --------------------
