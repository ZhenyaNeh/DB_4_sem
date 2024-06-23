DROP VIEW subjects
GO
CREATE VIEW subjects (id, subjects_name, pulpit_id)
as SELECT TOP 150 SUBJECT.SUBJECT, SUBJECT.SUBJECT_NAME, SUBJECT.PULPIT
FROM SUBJECT 
ORDER BY SUBJECT_NAME
GO
SELECT* FROM subjects


DROP VIEW prod_top
GO
CREATE VIEW prod_top
as SELECT TOP 3 Product_Name, Description_About_Product
FROM Products 
ORDER BY Product_Name 
Go
SELECT* FROM prod_top