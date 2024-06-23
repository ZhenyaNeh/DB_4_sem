USE UNIVERSITY

SELECT PROGRESS.NOTE, PROGRESS.SUBJECT
FROM PROGRESS
WHERE PROGRESS.NOTE >= ALL (SELECT PROGRESS.NOTE FROM PROGRESS 
	WHERE PROGRESS.SUBJECT like '%ад%')

USE N_MyBASE

SELECT Expenses.Department_Name, Expenses.Product_Name
FROM Expenses
WHERE Expenses.Consuption_Limit >= ALL (SELECT Departments.Count_Employees FROM Departments
	WHERE Departments.Department_Name like '%2')