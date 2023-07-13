SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[UpdateSchemaDate]
AS
BEGIN
if (select count(*) from IMSParameter where Name = 'SchemaLastUpdateOn') = 0
insert into IMSParameter(Id,Name, Value) values
(newid(),'SchemaLastUpdateOn', SYSDATETIME())

update IMSParameter set Value= SYSDATETIME() where Name = 'SchemaLastUpdateOn' 
END
GO
