--���������������� ������, ��������������� ������, ��������� ������
-- uncomitted - ������������ ���������������� ������, �.�. ������� ����� t1 � t2 ����������� ���� ��� commit � B ����-��

use UNIVERSITY
set transaction isolation level READ UNCOMMITTED 
--------- A ---------
begin transaction 
-------------------------- t1 ------------------
select @@SPID �������, 'INSERT AUDITORIUM' ���������, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
select @@SPID �������, 'UPDATE AUDITORIUM' ���������, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
commit
-------------------------- t2 -----------------
--------- B ---------
begin transaction 
insert AUDITORIUM values ('123456', '��-�', 80, '1234')
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
select @@SPID �������, 'INSERT AUDITORIUM' ���������, 
	   * from Departments where Department_Name = 'test'
select @@SPID �������, 'UPDATE AUDITORIUM' ���������, 
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