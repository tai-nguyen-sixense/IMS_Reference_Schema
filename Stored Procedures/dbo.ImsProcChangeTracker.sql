SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
			CREATE  PROCEDURE [dbo].[ImsProcChangeTracker] 
								@CreatedLog nvarchar(max),
								@ChangeTrackerTable ChangeTrackerTableType READONLY,
								@Log nvarchar(max) out
							AS
							BEGIN

								BEGIN TRY 
 
								--------------------
								set @Log = @CreatedLog 
								select @Log
								END TRY  
	
								BEGIN CATCH 
									RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
								END CATCH;

							END  
set noexec off  
 
--"2020-04-21_01_Permissions"  

If (select count(id) from permission where name = 'm_Surveys_Synoptic_View') = 0
    INSERT INTO Permission values ('m_Surveys_Synoptic_View', 'm_Surveys_Synoptic_View', newid());  
set noexec off  
 
--"2020-04-21_02_Photo_SurveyId"  

IF EXISTS (SELECT * FROM sys.columns WHERE Name = 'SurveyId' AND object_id = OBJECT_ID('Photo'))
BEGIN
	SET NOEXEC ON
END
ALTER TABLE Photo ADD SurveyId uniqueidentifier NULL
alter table Photo add foreign key (SurveyId) REFERENCES Survey(Id); 
SET NOEXEC OFF

  
set noexec off
GO
