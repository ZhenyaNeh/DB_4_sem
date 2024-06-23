USE UNIVERSITY

SELECT ISNULL(TEACHER.TEACHER_NAME, '***')[TEACHER], PULPIT.PULPIT_NAME
FROM PULPIT LEFT OUTER JOIN TEACHER
ON TEACHER.PULPIT = PULPIT.PULPIT

use N_MyBASE 

--SELECT* FROM  Departments SELECT* FROM Expenses SELECT* FROM Products

SELECT ISNULL(Expenses.Department_Name, '***')[Name], Products.Product_Name
FROM Expenses left outer join Products
ON Expenses.Product_Name = Products.Product_Name