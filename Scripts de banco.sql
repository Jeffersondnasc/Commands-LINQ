--DROP TABLE [dbo].[RPAAccount] 
--DROP TABLE [dbo].[Position] 

CREATE TABLE [dbo].[RPAAccount](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[PositionId] INT NOT NULL,
 	[Name] [varchar](150) NULL,
	[EmployeeId] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[AdmissionDate] [DateTime] NULL,
	[Active] [bit] NOT NULL
)
GO
ALTER TABLE [dbo].[RPAAccount] ADD  CONSTRAINT [DF_RPAAccount_AdmissionDate]  DEFAULT (getutcdate()) FOR [AdmissionDate]
GO

ALTER TABLE [dbo].[RPAAccount] ADD  CONSTRAINT [DF_RPAAccount_Active]  DEFAULT (1) FOR [Active]
GO

----------------------------------------------------------------------------------
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1)PRIMARY KEY NOT NULL,
 	[Name] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
	[Created] [DateTime] NULL
)

ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_Created]  DEFAULT (getutcdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_Active]  DEFAULT (1) FOR [Active]
GO
ALTER TABLE [dbo].[RPAAccount]  WITH CHECK ADD  CONSTRAINT [fk_RPAAccount_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
insert into [dbo].[Position]([Name])
values( 'Junior')
GO
insert into [dbo].[Position]([Name])
values( 'Pleno')
GO
insert into [dbo].[Position]([Name])
values( 'Senior')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email] )
values(1, 'Luis Antonio Teste', '123456', 'luis@teste.com')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email] )
values(1, 'Jose Luis', '222456', 'jose@teste.com')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email] )
values(2, 'Eva Maria', '777123', 'eva@teste.com')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email] )
values(3, 'Maria Paula', '111420', 'paula@teste.com')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email] )
values(3, 'Jefferson do Nascimento', '000000', 'jefferson@teste.com')
GO
insert into [dbo].[RPAAccount]([PositionId],[Name],[EmployeeId],[Email],[Active] )
values(2, 'Jefferson do Nascimento', '000000', 'zzzzzzz@teste.com', 0)

--SELECT * FROM [dbo].[RPAAccount]



--SELECT * FROM [dbo].[Position]
