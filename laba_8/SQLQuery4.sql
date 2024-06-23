drop view audit
GO
ALTER VIEW [audit] (id, audit_name)
as SELECT AUDITORIUM, AUDITORIUM_TYPE
FROM AUDITORIUM
WHERE AUDITORIUM_TYPE like '��%' WITH CHECK OPTION
GO
SELECT* FROM audit 
GO
INSERT audit values('800-7','��')
INSERT audit values('801-5','��-�')
INSERT audit values('80122-55','��-�')


DROP VIEW prod_info
GO
CREATE VIEW prod_info
as SELECT Product_Name, Description_About_Product
FROM Products 
WHERE Product_Name like '%RTX%' WITH CHECK OPTION
GO
SELECT* FROM prod_info
GO