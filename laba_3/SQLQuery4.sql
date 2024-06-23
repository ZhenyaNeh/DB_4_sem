USE N_MyBASE;

INSERT INTO Departments(Department_Name, Count_Employees)
	VALUES
		('Dev_1', 45),
		('Dev_2', 38),
		('Dev_3', 87),
		('Dev_4', 18),
		('Dev_5', 22);

INSERT INTO Products(Product_Name, Description_About_Product)
	VALUES
		('Laptop', 'first'),
		('IPhone', 'second'),
		('HeadPhones', 'third'),
		('PC', 'fouth'),
		('RTX 4090', 'fifth');

INSERT INTO Expenses(ID, Department_Name, Product_Name, Consuption_Limit, Amount_Spent, Recording_Data)
	VALUES
		(1, 'Dev_1', 'Laptop', 600, 300, convert(date, '2023-01-17', 102)),
		(2, 'Dev_2', 'IPhone', 800, 200, convert(date, '2023-02-17', 102)),
		(3, 'Dev_3', 'HeadPhones', 500, 350, convert(date, '2023-01-27', 102)),
		(4, 'Dev_4', 'PC', 1000, 800, convert(date, '2023-03-01', 102)),
		(5, 'Dev_5', 'RTX 4090', 1500, 1200, convert(date, '2023-10-16', 102));