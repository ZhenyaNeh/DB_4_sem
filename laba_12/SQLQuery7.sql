-- serializable не допускает фантомных зн-й, т.е. теперь при добавлении нового поля через тран B, оно не добавится 
use UNIVERSITY
-- A ---	
set transaction isolation level SERIALIZABLE 
begin transaction 
	delete AUDITORIUM where AUDITORIUM = '1234'
    insert AUDITORIUM values ('1234', 'ЛК-К', 10, '1234')
    update AUDITORIUM set AUDITORIUM_NAME = '1234' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 -----------------
	select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t2 ------------------ 
commit 	

--- B ---	
begin transaction 	  
	delete AUDITORIUM where AUDITORIUM_NAME = '1234'; 
    insert AUDITORIUM values ('1234', 'ЛК-К', 10, '1234')
    update AUDITORIUM set AUDITORIUM_NAME = '1234' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t1 --------------------
commit

select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t2 -------------------
go



use N_MyBASE
-- A ---	
set transaction isolation level SERIALIZABLE 
begin transaction 
	delete Departments where Department_Name = 'test'
    insert Departments values ('test', 10)
    update Departments set Department_Name = 'test' where Count_Employees = 10
    select Department_Name from Departments where Department_Name= 'test'
-------------------------- t1 -----------------
	select Department_Name from Departments where Department_Name = 'test'
-------------------------- t2 ------------------ 
commit 	

--- B ---	
begin transaction 	  
	delete Departments where Department_Name = 'test'
    insert Departments values ('test', 10)
    update Departments set Department_Name = 'test' where Count_Employees = 10
    select Department_Name from Departments where Department_Name= 'test'
-------------------------- t1 --------------------
commit

	select Department_Name from Departments where Department_Name = 'test'
-------------------------- t2 -------------------