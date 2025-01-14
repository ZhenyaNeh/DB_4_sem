USE UNIVERSITY

SELECT CASE
	WHEN NOTE BETWEEN 9 and 10 THEN 'perfect'
	WHEN NOTE BETWEEN 6 and 8 THEN 'good'
	WHEN NOTE BETWEEN 4 and 5 THEN 'passed'
	ELSE 'failed'
	END NOTE, COUNT(*) [Count_Notes]
FROM PROGRESS P
inner join STUDENT S ON P.IDSTUDENT = S.IDSTUDENT
inner join GROUPS G ON S.IDGROUP = G.IDGROUP
WHERE FACULTY = '���'
GROUP BY CASE
	WHEN NOTE BETWEEN 9 and 10 THEN 'perfect'
	WHEN NOTE BETWEEN 6 and 8 THEN 'good'
	WHEN NOTE BETWEEN 4 and 5 THEN 'passed'
	ELSE 'failed'
	END ORDER BY NOTE