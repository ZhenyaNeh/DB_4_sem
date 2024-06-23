USE master ;
go 

CREATE database N_MyTestBASE ON PRIMARY
(name = N'N_MyTestBASE_mdf', filename =N'D:\University\DB\laba_3\N_MyTestBASE_mdf.mdf',
 size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'N_MyTestBASE_ndf', filename =N'D:\University\DB\laba_3\N_MyTestBASE_ndf.ndf',
 size = 10240Kb, maxsize = 1Gb, filegrowth = 25%),

filegroup FG1
(name = N'N_MyTestBASE_fg1_1', filename =N'D:\University\DB\laba_3\N_MyTestBASE_fgq-1.ndf',
 size = 10240Kb, maxsize = 1Gb, filegrowth = 25%),
(name = N'N_MyTestBASE_fg1_2', filename =N'D:\University\DB\laba_3\N_MyTestBASE_fgq-2.ndf',
 size = 10240Kb, maxsize = 1Gb, filegrowth = 25%)

log on
(name = N'N_MyTestBASE_log', filename =N'D:\University\DB\laba_3\N_MyTestBASE_log.ldf',
 size = 10240Kb, maxsize = 1Gb, filegrowth = 10%)

 go