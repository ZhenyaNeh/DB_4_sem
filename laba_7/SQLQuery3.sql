USE UNIVERSITY;

--UNION
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS 
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '���'
GROUP BY FACULTY, PROFESSION, SUBJECT
UNION
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS 
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '����'
GROUP BY FACULTY, PROFESSION, SUBJECT

--UNION ALL
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS 
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '���'
GROUP BY FACULTY, PROFESSION, SUBJECT
UNION ALL
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS 
INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '����'
GROUP BY FACULTY, PROFESSION, SUBJECT

--==================================================================================================================

USE N_MyBASE

SELECT Departments.Department_Name, Products.Product_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit AS FLOAT(4))), 2)[AVG_LIMIT]
FROM Departments
INNER JOIN Expenses ON Departments.Department_Name = Expenses.Department_Name
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_5'
GROUP BY Departments.Department_Name, Products.Product_Name
UNION
SELECT Departments.Department_Name, Products.Product_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit AS FLOAT(4))), 2)[AVG_LIMIT]
FROM Departments
INNER JOIN Expenses ON Departments.Department_Name = Expenses.Department_Name
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_4'
GROUP BY Departments.Department_Name, Products.Product_Name

SELECT Departments.Department_Name, Products.Product_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit AS FLOAT(4))), 2)[AVG_LIMIT]
FROM Departments
INNER JOIN Expenses ON Departments.Department_Name = Expenses.Department_Name
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_5'
GROUP BY Departments.Department_Name, Products.Product_Name
UNION ALL
SELECT Departments.Department_Name, Products.Product_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit AS FLOAT(4))), 2)[AVG_LIMIT]
FROM Departments
INNER JOIN Expenses ON Departments.Department_Name = Expenses.Department_Name
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_4'
GROUP BY Departments.Department_Name, Products.Product_Name