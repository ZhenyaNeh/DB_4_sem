print 'ROWCOUNT:	 ' + cast(@@ROWCOUNT as nvarchar)
print 'VERSION:	 ' + cast(@@VERSION  as nvarchar)
print 'SPID:		 ' + cast(@@SPID as nvarchar)
print 'ERROR:		 ' + cast(@@ERROR as nvarchar)
print 'SERVERNAME:	 ' + cast(@@SERVERNAME as nvarchar)
print 'RANCOUNT:	 ' + cast(@@TRANCOUNT as nvarchar)
print 'FETCH_STATUS:' + cast(@@FETCH_STATUS as nvarchar)
print 'NESTLEVEL:	 ' + cast(@@NESTLEVEL as nvarchar)