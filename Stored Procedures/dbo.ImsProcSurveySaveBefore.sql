SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2018-03-23
-- Description:	Run before saving by the api
-- InPut:		@Id = Survey.Id, @SurveyJson= default Survey in json format, @UserId = Loggged User Id
-- OutPut:		Survey in json format nvarchar(max) or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcSurveySaveBefore] @Id uniqueidentifier, @SurveyJson nvarchar(max), @UserId uniqueidentifier
	
AS
BEGIN
Declare @returnSurveyJson as nvarchar(max);
    
	BEGIN TRY  
		SET @returnSurveyJson=@SurveyJson;
    
		-- include script here
		select @returnSurveyJson;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
