USE UNIVERSITY

SELECT PULPIT.FACULTY, PULPIT.PULPIT, PULPIT.PULPIT_NAME
FROM PULPIT FULL OUTER JOIN TEACHER
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER.TEACHER IS NULL

SELECT TEACHER.TEACHER_NAME, TEACHER.TEACHER, TEACHER.PULPIT, TEACHER.GENDER 
FROM PULPIT FULL OUTER JOIN TEACHER
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER.TEACHER IS NOT NULL

SELECT * FROM PULPIT FULL OUTER JOIN TEACHER
ON PULPIT.PULPIT = TEACHER.PULPIT

USE N_MyBASE

SELECT Departments.Department_Name, Departments.Count_Employees
FROM Departments full outer join Expenses
ON Departments.Department_Name = Expenses.Department_Name
ORDER BY Expenses.Consuption_Limit

SELECT Expenses.Department_Name, Expenses.Product_Name, Expenses.Consuption_Limit,
Expenses.Recording_Data
FROM Departments full outer join Expenses
ON Departments.Department_Name = Expenses.Department_Name
ORDER BY Expenses.Consuption_Limit

SELECT* FROM Departments full outer join Expenses
ON Departments.Department_Name = Expenses.Department_Name
WHERE Departments.Department_Name  IS NOT NULL
