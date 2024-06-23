DECLARE 
	@a char = 'f',
	@b varchar(10) = 'Hello Word',
	@c nvarchar,
	@d datetime = getdate(),
	@e time,
	@f int,
	@g smallint,
	@h tinyint,
	@i numeric(12,5);

	SET @c = 'Random String';
	SET @e = getdate();

	SELECT @f = 123, @g =12, @h = 1, @i = 12313.66565


	print 'a = ' + cast(@a as varchar(10))
	print 'b = ' + cast(@b as varchar(10))
	print 'c = ' + cast(@c as varchar(10))
	print 'd = ' + cast(@d as varchar(10))

	SELECT @e e, @f f, @g g, @h h, @i i