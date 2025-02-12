 USE UNIVERSITY

 SELECT AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
 FROM AUDITORIUM aud1
 WHERE AUDITORIUM_CAPACITY = (SELECT TOP(1) AUDITORIUM_CAPACITY
 FROM AUDITORIUM aud2
 WHERE aud2.AUDITORIUM_TYPE = aud1.AUDITORIUM_TYPE
 ORDER BY AUDITORIUM_CAPACITY DESC)

 USE N_MyBASE

 SELECT Product_Name, Amount_Spent
 FROM Expenses ex1
 WHERE Amount_Spent = (SELECT TOP(1) Amount_Spent
 FROM Expenses ex2
 WHERE ex1.Consuption_Limit > ex2.Amount_Spent
 ORDER BY Amount_Spent DESC)
