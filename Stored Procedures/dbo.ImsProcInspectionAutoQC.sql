SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:    Vincent Morisseau
-- Create date: 2017-11-17
-- Description: Run on demand by end user
-- InPut:   @Id = Inspection.Id, @UserId = Loggged User Id
-- OutPut:    nvarchar(max) return to the end user or error in string format
-- Error:   in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcInspectionAutoQC] @Id     UNIQUEIDENTIFIER, @statusId     UNIQUEIDENTIFIER,  @UserId UNIQUEIDENTIFIER
AS
     BEGIN
         DECLARE @returnCheck AS NVARCHAR(MAX);
         BEGIN TRY 
		 

		 declare @tabledata nvarchar(max)
set @tabledata=cast((

select top 10 isnull(asset.name, '') as 'cel1','', isnull(asset.number,'') as 'cel2','', cast(assettypeid as nvarchar(max)) as 'cel3',''
from asset 
FOR XML PATH('tr'), ELEMENTS ) as nvarchar(max))

set @tabledata=
'<table><tr><cel1>QC.Type</cel1><Cel2>QC.Location</cel2><cel3>QC.Description</cel3></tr>'+@tabledata+'</table>'


 

set @returnCheck=@tabledata

             SELECT @returnCheck;

	
			 
         END TRY
	
         BEGIN CATCH
             RETURN 'Sql Error- Number:'+CAST(ERROR_NUMBER() AS NVARCHAR(MAX))+' ;Message:'+ERROR_MESSAGE();
         END CATCH;
     END;
GO
