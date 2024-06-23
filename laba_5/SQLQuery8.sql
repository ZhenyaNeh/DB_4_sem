USE UNIVERSITY

SELECT PROGRESS.NOTE, PROGRESS.SUBJECT
FROM PROGRESS
WHERE PROGRESS.NOTE >=ANY (SELECT PROGRESS.NOTE FROM PROGRESS 
	WHERE PROGRESS.SUBJECT like '%нюхо%')

USE N_MyBASE

SELECT Expenses.Department_Name, Expenses.Product_Name
FROM Expenses
WHERE Expenses.Consuption_Limit >= ANY (SELECT Departments.Count_Employees FROM Departments
	WHERE Departments.Department_Name like '%5')