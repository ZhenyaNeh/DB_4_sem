DROP VIEW pulpit_count_view
GO
CREATE VIEW pulpit_count_view WITH SCHEMABINDING
as SELECT FACULTY.FACULTY_NAME, COUNT(*)[pulpit_count_view] 
FROM dbo.FACULTY 
INNER JOIN dbo.PULPIT ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY.FACULTY_NAME
GO
SELECT* FROM pulpit_count_view


DROP VIEW prod_count_last
GO
CREATE VIEW prod_count_last WITH SCHEMABINDING
as SELECT Expenses.Department_Name, COUNT(Products.Product_Name)[count]
FROM dbo.Expenses
INNER JOIN dbo.Products ON Expenses.Product_Name = Products.Product_Name
GROUP BY Expenses.Department_Name
GO
SELECT* FROM prod_count_last