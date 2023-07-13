SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcFlagsCheck] @Ids FlagIds Readonly, @UserId uniqueidentifier
	
AS
BEGIN

	Declare @Id uniqueidentifier,
	@AssetId uniqueidentifier, @InspectionId uniqueidentifier, @FlagTypeId uniqueidentifier,@Number nvarchar(max),@FlagStatusId uniqueidentifier,
	@Comments nvarchar(MAX),@FlagDate smalldatetime,@AuthorId uniqueidentifier,@LastModified smalldatetime,
	@PreviousInspectionFlagId uniqueidentifier,@PriorityId uniqueidentifier,@NumberBis nvarchar(MAX),@CommentsBis nvarchar(MAX),@StatusBisId uniqueidentifier,
    @AuditId uniqueidentifier,@ExcludeFromReport bit,@MainReviewerId uniqueidentifier,@EstimatedTime bigint,@ActualTime bigint,@Longitude float,
	@Latitude float,@IdGeography uniqueidentifier,@SurveyId uniqueidentifier

	DECLARE @Counter INT, @NewFlagId uniqueidentifier
	SET @Counter = 0
    
	BEGIN TRY  

		select @Counter

	END TRY
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
