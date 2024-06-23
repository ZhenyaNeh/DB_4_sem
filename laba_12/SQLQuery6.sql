-- repeatable не допускает неподтвержденного и неповторяющегося чтения (если мы 
--изменяем данные между двумя операциями чтения, то рез-т будет разным)
use UNIVERSITY
delete AUDITORIUM where AUDITORIUM = 'test'
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM = 'test'
-------------------------- t1 ------------------ 
-------------------------- t2 ------------------
select case
       when AUDITORIUM_CAPACITY = 50 then 'insert'  else ' ' 
end 'результат', AUDITORIUM from AUDITORIUM where AUDITORIUM = 'test'
commit

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
insert AUDITORIUM values ('test', 'ЛК-К', 10, 'test');
commit
-------------------------- t2 --------------------
go


use N_MyBASE
delete Departments where Department_Name = 'test'
--------- A ---------
set transaction isolation level  REPEATABLE READ 
begin transaction 

select Count_Employees from Departments where Department_Name = 'test'
-------------------------- t1 ------------------
-------------------------- t2 -----------------
select case
       when Count_Employees = 50 then 'insert'  else ' ' 
end 'результат', Department_Name from Departments where Department_Name = 'test'
commit

--------- B ---------
begin transaction 
-------------------------- t1 --------------------
insert Departments values ('test', 15);
commit
-------------------------- t2 --------------------