SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
create PROCEDURE [dbo].[ShowSchemaDate]
AS
BEGIN
select value from IMSParameter where Name = 'SchemaLastUpdateOn' 
END
GO
