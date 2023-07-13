SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Darth Vader
-- Create date: 2020-04-02
-- Description:	Run Homogeneous zone calculation 
-- InPut:		@AnalysisId, @AssetId, @UserId
-- OutPut:		1 or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcHomogeneousZoneCalculation] @AnalysisId uniqueidentifier, @AssetId uniqueidentifier, @UserId uniqueidentifier
	
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




  
set noexec off  
 
--"2020-04-02_02_hz_calculation_by_proc"  
IF NOT EXISTS (select 1 from IMSPARAMETER where Name = 'hz_calculation_by_proc')
    INSERT INTO IMSPARAMETER VALUES (newid(), 'hz_calculation_by_proc', '0', 0);  
set noexec off  
 
--"2020-04-02_03_Translations"  
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.dialog.confirm.hzcalculation')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.dialog.confirm.hzcalculation', N'New calculation can break previous values', N'Un nouveau calcul peut Ã©craser les anciennes donnÃ©es',0);
  
set noexec off  
 
--"2020-04-02_04_Flag_Activitiy_SurveyId"  

IF EXISTS (SELECT * FROM sys.columns WHERE Name = 'SurveyId' AND object_id = OBJECT_ID('Activity'))
BEGIN
	SET NOEXEC ON
END
ALTER TABLE Activity ADD SurveyId uniqueidentifier NULL
SET NOEXEC OFF


IF EXISTS (SELECT * FROM sys.columns WHERE Name = 'SurveyId' AND object_id = OBJECT_ID('Flag'))
BEGIN
	SET NOEXEC ON
END
ALTER TABLE Flag ADD SurveyId uniqueidentifier NULL
SET NOEXEC OFF  
set noexec off  
 
--"2020-04-03_01_Translations"  
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.inspectiondocumentrootname')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.inspectiondocumentrootname', N'Inspection Document Root Folder', N'Dossier racine du document d''inspection',0);

IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.assetdocumentrootname')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.assetdocumentrootname', N'Asset Document Root Folder', N'Dossier racine du document d''actif',0);  
set noexec off  
 
--"2020-04-07_01_HZAnalysis.IsActive"  
IF EXISTS (SELECT * FROM sys.columns WHERE Name = 'IsActive' AND object_id = OBJECT_ID('HomogeneousZoneAnalysis'))
BEGIN
	SET NOEXEC ON
END
ALTER TABLE HomogeneousZoneAnalysis ADD IsActive bit NULL
GO
