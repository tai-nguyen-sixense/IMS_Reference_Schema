SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

    -- =============================================
    -- Author:		Sixense
    -- Create date: 2022-02-04
    -- Description:	Return data table
    -- InPut:		@Type = "the name of the table" @Id = [Asset/Activity/...].Id
    -- OutPut:		Data table
    -- Error:		in case of error, the details are logged in Files\log folder
    -- =============================================

    CREATE PROCEDURE [dbo].[ImsProcDataTable] @Type nvarchar(100), @Id uniqueidentifier
    AS
    BEGIN
        Declare @returnDataTable as nvarchar(max);
        BEGIN TRY  
        declare @tabledata nvarchar(max)
        declare @tableheader nvarchar(max)

        IF @Type = 'inspection-lcc'
            --TODO define columns to display...
			BEGIN;
			set @tableheader='<header><col1>Name</col1><col2>Value</col2></header>'
			set @tabledata=cast(
				(
					SELECT AF.Name,AAV.Value FROM Inspection AS I
						INNER JOIN InspectionMaster AS IM
						on I.InspectionMasterId = IM.Id
						INNER JOIN Asset AS A
						on IM.AssetId = A.Id
						INNER JOIN AssetAttributeValue AS AAV
						on AAV.AssetId = A.Id
						INNER JOIN AttributeField AS AF
						on AF.Id = AAV.AttributeFieldId
						WHERE AF.Type = 'INSPECTION_ITEM'
							AND A.Id = @Id
					FOR XML PATH('values'), ELEMENTS
				) as nvarchar(max)
			) 
			set @tabledata='<table>'+isnull(@tableheader,'')+isnull(@tabledata, '')+'</table>'
			END;

        ELSE
            BEGIN;
			set @tabledata=cast(
				(
					select top 1 'value1' as 'col1', 'value2' as 'col2','value3' as 'col3'
					FOR XML PATH('values'), ELEMENTS
				)
				as nvarchar(max))

			set @tabledata='<table><header><col1>COL1</col1><col2>COL2</col2><col3>COL3</col3></header>'+isnull(@tabledata, '')+'</table>'
            END;
			select @tabledata

			set @returnDataTable=@tabledata

            SELECT @returnDataTable;
        END TRY  
        
        BEGIN CATCH 
            RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + '; Message:' + ERROR_MESSAGE();
        END CATCH;
    END
GO
