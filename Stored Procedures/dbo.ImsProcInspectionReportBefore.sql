SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Etienne BOSSUET
-- Create date: 2018-11-27
-- Description:	Run before generating inspection report
-- InPut:		@ReportId, @InspectionId
-- OutPut:		nvarchar(max) return to the end user or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcInspectionReportBefore] @ReportId uniqueidentifier, @InspectionId uniqueidentifier
	
AS
BEGIN
	Declare @returnDone as nvarchar(max);
  
	BEGIN TRY 
		-- include script here
		SET @returnDone='The process has been executed'

		select @returnDone;
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
