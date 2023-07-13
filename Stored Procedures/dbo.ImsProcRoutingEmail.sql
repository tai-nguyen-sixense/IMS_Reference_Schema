SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-12-07
-- Description:	Return list of fields for email
-- InPut:		@Id= Routing.Id, @UserId = Loggged User Id
-- OutPut:		List of key nvarchar(max), value nvarchar(max)

-- =============================================
CREATE PROCEDURE [dbo].[ImsProcRoutingEmail]  @Id uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	SET NOCOUNT ON;

	--use temporary table to define output
	Declare @returnValue as Table (
			dataKey nvarchar(max),
			dataValue nvarchar(max))
    
	BEGIN TRY  

		INSERT INTO @returnValue
			   (dataKey
			   ,dataValue
			 )
		 VALUES
			   ('Subject','Subject from [ImsProcRoutingEmail]')

		INSERT INTO @returnValue
			   (dataKey
			   ,dataValue
			 )
		 VALUES
			   ('Header','Header from [ImsProcRoutingEmail]')
	
		INSERT INTO @returnValue
			   (dataKey
			   ,dataValue
			 )
		 VALUES
			   ('Content','Content from [ImsProcRoutingEmail]')

		--return temporary table
		SELECT * from @returnValue

	END TRY  
	
	BEGIN CATCH 
		--get error message
	    Declare @msg nvarchar(max) ;
		set  @msg = cast(ERROR_NUMBER() as nvarchar(max)) + '-' + ERROR_MESSAGE();

		--return actual table
		SELECT * from @returnValue
	END CATCH;

END
GO
