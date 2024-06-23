SELECT *
FROM Expenses

SELECT Department_Name, Count_Employees
From Departments

SELECT count(*)
FROM Products

UPDATE Expenses set Amount_Spent += 100 WHERE Product_Name = 'PC';

SELECT Product_Name, Amount_Spent
FROM Expenses
WHERE Product_Name = 'PC';

UPDATE Expenses set Amount_Spent -= 100 WHERE Product_Name = 'PC';