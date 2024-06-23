--найти заказы определенной фирмы по ее названию, отсортировать их по датам поставки
SELECT NehaychikSales.dbo.Orders.Order_Number, Orders.Delivery_Date
FROM   Customers INNER JOIN
             Orders ON Customers.Company_Name = Orders.Customer INNER JOIN
             Product ON Orders.Product_Name = Product.Name
WHERE (Orders.Customer = N'First_comp')
ORDER BY Delivery_Date;