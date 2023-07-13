SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Sixense
-- Create date: 2022-08-25
-- Description:	Insert new label translation based on language name (en, fr, pt, es, ..)
-- =============================================
CREATE PROCEDURE [dbo].[ImsProcTranslate]
	-- Add the parameters for the stored procedure here
	@LanguageName NVARCHAR(100), 
	@Code NVARCHAR(MAX), 
	@Translation NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	declare @langId as uniqueidentifier;
	set @langId = (select top 1 id from Language where name = @LanguageName);
	delete from Translation where code = @Code and LanguageId = @langId
	insert into Translation values (newid(), @langId, 'label', null, TRIM(@Code), TRIM(@Translation));
END
GO
