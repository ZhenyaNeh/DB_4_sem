USE N_MyTestBASE

CREATE table Test_Table(
	ID int not null PRIMARY KEY,
	Test_Area_Char nvarchar(20),
	Test_Area_Int int,
	Test_Area_Date date
) on FG1