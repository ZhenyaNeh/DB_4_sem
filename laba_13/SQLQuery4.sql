use UNIVERSITY
go
create proc PAUDITORIUM_INSERT 
				@a char(20), @n varchar(50), @c int = 0, @t char(10)
as begin
	begin try
		insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
		values (@a, @n, @c, @t)
		return 1
	end try
	begin catch
		print 'ERROR_NUMBER:  ' + cast(ERROR_NUMBER() as varchar)
		print 'ERROR_SEVERITY: ' + cast(ERROR_SEVERITY() as varchar)
		print 'ERROR_MESSAGE:   ' + cast(ERROR_MESSAGE() as varchar)
		return -1
	end catch
end

declare @RETURN int
exec @RETURN = PAUDITORIUM_INSERT @a = '322-1', @n = '322-1', @c = 20, @t = 'À - '
print 'Error code: ' + cast(@RETURN as varchar)

--delete AUDITORIUM where AUDITORIUM = '322-1'
--drop proc PAUDITORIUM_INSERT