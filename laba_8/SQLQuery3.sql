DROP VIEW audit
GO
CREATE VIEW audit(name, type)
AS SELECT AUDITORIUM, AUDITORIUM_TYPE
FROM AUDITORIUM
WHERE AUDITORIUM_TYPE like 'À %'
GO
SELECT* FROM audit
GO
INSERT audit values('800-7','À ')
INSERT audit values('801-5','À¡- ')



DROP VIEW prod_info
GO
CREATE VIEW prod_info
as SELECT Product_Name, Description_About_Product
FROM Products 
WHERE Product_Name like '%RTX%'
GO
SELECT* FROM prod_info
