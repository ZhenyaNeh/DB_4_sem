-- ���������� �������� ����, ���������� ���������� �����
SELECT Orders.Customer, Product.Name
FROM   Orders INNER JOIN
             Product ON Orders.Product_Name = Product.Name
WHERE (Orders.Product_Name = N'NoteBook')