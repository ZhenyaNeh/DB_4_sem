USE UNIVERSITY

SELECT*
FROM(SELECT CASE
		when NOTE BETWEEN 1 and 4 THEN '1-4'
		when NOTE BETWEEN 5 and 8 THEN '5-8'
		when NOTE BETWEEN 8 and 10 THEN '8-10'
		else 'uncorrect'
		END [NOTES_RADIUS], count(*)[COUNT_OF_NOTES]
	FROM PROGRESS GROUP BY CASE
		when NOTE BETWEEN 1 and 4 THEN '1-4'
		when NOTE BETWEEN 5 and 8 THEN '5-8'
		when NOTE BETWEEN 8 and 10 THEN '8-10'
		else 'uncorrect'
		END) AS T

		ORDER BY CASE [NOTES_RADIUS]
			WHEN '1-4' THEN 4
			WHEN '5-8' THEN 3
			WHEN '8-10' THEN 2
			ELSE 0
			END

USE N_MyBASE

SELECT*
FROM(SELECT CASE 
		WHEN Consuption_Limit BETWEEN 500 and 999 THEN '500-1000'
		WHEN Consuption_Limit BETWEEN 1000 and 1500 THEN '1000-1500'
		else 'uncorrect number'
		END[LIMIT_NUMBER], count(*)[Count_LIMITS]
	FROM Expenses GROUP BY CASE 
		WHEN Consuption_Limit BETWEEN 500 and 999 THEN '500-1000'
		WHEN Consuption_Limit BETWEEN 1000 and 1500 THEN '1000-1500'
		else 'uncorrect number'
		END) AS T

		ORDER BY CASE [LIMIT_NUMBER]
			WHEN '500-1000' THEN 1
			WHEN '1000-1500' THEN 2
			ELSE 0
			END

