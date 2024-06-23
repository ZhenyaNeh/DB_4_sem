USE N_MyBASE;

CREATE table Products(
	Product_Name nvarchar(20) PRIMARY KEY,
	Description_About_Product nvarchar(50) not null
);

CREATE table Departments(
	Department_Name nvarchar(20) PRIMARY KEY,
	Count_Employees int not null
);

CREATE table Expenses(
	ID int PRIMARY KEY,
	Department_Name nvarchar(20) not null FOREIGN KEY REFERENCES Departments(Department_Name), 
	Product_Name nvarchar(20) not null FOREIGN KEY REFERENCES Products(Product_Name),
	Consuption_Limit int not null,
	Amount_Spent int not null
);

