drop table if exists #localtable

CREATE TABLE #localtable
(	INT_FIELD int,
	STR_FIELD varchar(100),
	DATE_FIELD date
)

TRUNCATE TABLE #localtable

SET nocount on;
DECLARE 
	@i int = 0,
	@randVal int;

WHILE @i < 10
BEGIN
	SET @randVal = floor(300 * rand());
	INSERT #localtable(INT_FIELD, STR_FIELD, DATE_FIELD) VALUES (@randVal, replicate('s', @i + 1), GETDATE() + @randVal);
	SET @i += 1
END

SELECT * FROM #localtable