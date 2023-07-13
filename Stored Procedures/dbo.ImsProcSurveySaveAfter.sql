SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2018-03-23
-- Description:	Run after saving by the api
-- InPut:		@Id = Survey.Id, @UserId = Loggged User Id
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcSurveySaveAfter] @Id uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	
	BEGIN TRY 
		-- include script here
		select 1;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
