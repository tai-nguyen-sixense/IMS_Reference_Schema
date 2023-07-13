SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ImsProcAssetCopyAfter] @previousAssetId uniqueidentifier, @newAssetId uniqueidentifier, @UserId uniqueidentifier
	
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
 
--"2020-04-27_01_Translations"  
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.button.add.many')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.button.add.many', N'Add many', N'Ajouter plusieurs',0);  
set noexec off  
 
--"2020-04-29_01_IMSParameter"  
IF NOT EXISTS (select 1 from [dbo].[IMSParameter] where [Name] = 'powerBiWorkspaceId')
	INSERT INTO [dbo].[IMSParameter]([Id],[Name],[Value],[IsPublic]) VALUES (newid(),'powerBiWorkspaceId',null,1);  
set noexec off  
 
--"2020-04-29_01_Permissions"  
If (select count(id) from permission where name = 'i_PowerBI') = 0
    INSERT INTO Permission values ('i_PowerBI','i_PowerBI',NEWID())  
set noexec off  
 
--"2020-04-29_01_Translations"  
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi', N'Power BI', N'Power BI',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.dashboards')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.dashboards', N'Dashboards', N'Dashboards',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi.toggle.drawer')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi.toggle.drawer', N'Toggle Drawer', N'Tiroir à Bascule',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi.please.select.report.to.print')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi.please.select.report.to.print', N'Print (First select a report)', N'Imprimer (sélectionnez d''abord un rapport)',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi.button.fullscreen')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi.button.fullscreen', N'Fullscreen', N'Plein écran',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi.button.create.new.report')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi.button.create.new.report', N'Create new report', N'Créer un nouveau rapport',0);
IF NOT EXISTS (select 1 from [dbo].[IMSLanguage] where [Code] = 'ims5.lang.powerbi.button.delete.report')
    INSERT INTO dbo.IMSLanguage ( Code, Language1, Language2, ForMobile ) VALUES ( N'ims5.lang.powerbi.button.delete.report', N'Delete report', N'Supprimer le rapport',0);  
set noexec off
GO
