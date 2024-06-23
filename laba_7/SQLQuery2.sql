USE UNIVERSITY

SELECT FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM FACULTY 
INNER JOIN GROUPS ON FACULTY.FACULTY = GROUPS.FACULTY
INNER JOIN STUDENT ON GROUPS.IDGROUP = STUDENT.IDGROUP
INNER JOIN PROGRESS ON STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
WHERE FACULTY.FACULTY = '���'
GROUP BY CUBE(GROUPS.PROFESSION, PROGRESS.SUBJECT), FACULTY.FACULTY

USE N_MyBASE

SELECT Departments.Department_Name, Products.Product_Name, ROUND(AVG(CAST(Expenses.Consuption_Limit AS FLOAT(4))), 2)[AVG_LIMIT]
FROM Departments
INNER JOIN Expenses ON Departments.Department_Name = Expenses.Department_Name
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
WHERE Departments.Department_Name = 'Dev_5'
GROUP BY CUBE (Departments.Department_Name, Products.Product_Name) 