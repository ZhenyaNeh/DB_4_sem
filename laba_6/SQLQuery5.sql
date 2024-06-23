USE UNIVERSITY

SELECT FACULTY, SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2)[AVG_NOTE]
FROM PROGRESS
INNER JOIN STUDENT ON STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
INNER JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = 'ÒÎÂ'
GROUP BY FACULTY, SUBJECT;

USE N_MyBASE

SELECT Expenses.Department_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit as float(4))), 2)[AVG_LINIT]
FROM Expenses
inner join Departments ON Expenses.Department_Name = Departments.Department_Name
inner join Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_5'
GROUP BY Expenses.Department_Name