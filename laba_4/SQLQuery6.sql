use UNIVERSITY

SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME 
FROM AUDITORIUM CROSS JOIN AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

use N_MyBASE 

SELECT Departments.Department_Name, Expenses.Recording_Data
FROM Departments CROSS JOIN Expenses
WHERE Departments.Department_Name = Expenses.Department_Name