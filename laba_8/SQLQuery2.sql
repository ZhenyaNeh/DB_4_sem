DROP VIEW Pulpit_Count
GO
CREATE VIEW [Pulpit_Count]
as SELECT FACULTY.FACULTY_NAME, COUNT(*)[Pulpit_Count] 
FROM FACULTY 
INNER JOIN PULPIT ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY.FACULTY_NAME;
GO
SELECT * FROM Pulpit_Count

DROP VIEW prod_count
GO
CREATE VIEW prod_count
as SELECT Expenses.Department_Name, COUNT(Products.Product_Name)[count]
FROM Expenses
INNER JOIN Products ON Expenses.Product_Name = Products.Product_Name
GROUP BY Expenses.Department_Name
GO
SELECT* FROM prod_count