SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Aaron Kinfe
-- Create date: 2021-11-17
-- Description:	Return flatform summary in table format
-- InPut:		@Id = Inspection.Id, @UserId = Loggged User Id
-- OutPut:		flatform summary in table format format or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

Create PROCEDURE [dbo].[ImsProcInspectionFormSummary] @Id uniqueidentifier, @UserId uniqueidentifier
	
	
AS
BEGIN
	Declare @AssetComponentId as uniqueidentifier;
	Declare @FullName as nvarchar(max);
	Declare @AssetcomponentFatherId as uniqueidentifier;
	Declare @AssetcomponentNumber as nvarchar(max);
	Declare @AssetcomponentName as nvarchar(max);
	Declare @FatherName as nvarchar(max);
	Declare @AttributeFiledName as nvarchar(max);
	Declare @table TABLE (AssetComponentId uniqueidentifier, AssetcomponentNumber nvarchar(max), FullName nvarchar(max), AllowableValue nvarchar(max))

	BEGIN TRY  
		 DECLARE flags CURSOR READ_ONLY
	FOR
	select c.Id, c.FatherId,c.Number,c.Name from ImsFunc_ComponentsForInspection(@Id) inner join AssetComponent c on c.Id = AssetComponentId

	OPEN flags
	FETCH NEXT FROM flags INTO
		  @AssetComponentId,
		  @AssetcomponentFatherId,
		  @AssetcomponentNumber,
		  @AssetcomponentName
		  WHILE @@FETCH_STATUS = 0
			BEGIN
			set @FullName = @AssetcomponentName
			WHILE(@AssetcomponentFatherId IS NOT NULL)
			BEGIN
				select @FatherName = name from AssetComponent where Id=@AssetcomponentFatherId
				if @FatherName is not null
					set @FullName = CONCAT(@FatherName,CONCAT(' >> ', @FullName))
				set @AssetcomponentFatherId = (select FatherId from AssetComponent where Id=@AssetcomponentFatherId)
			END
			insert into @table(AssetComponentId,AssetcomponentNumber,FullName)
			values(@AssetComponentId,@AssetcomponentNumber,@FullName)
	FETCH NEXT FROM flags INTO
		  @AssetComponentId,
		  @AssetcomponentFatherId,
		  @AssetcomponentNumber, 
		  @AssetcomponentName
			END
			--CLOSE THE CURSOR.
	CLOSE flags
	DEALLOCATE flags
	select t.AssetComponentId, CASE when t.AssetcomponentNumber is not null and t.AssetcomponentNumber != '' then  CONCAT(CONCAT(CONCAT(t.FullName,' ('),t.AssetcomponentNumber),')') else  t.FullName  end as assetComponentName, att.Name as attributeFieldName, 
	CASE when al.Description is not null and p.Value is not null then CONCAT(p.Value,'. '+al.Description)
	else p.Value end as value, p.Comments as comment
	,al.Color as color
	from @table t
	left join InspectionPoint p on p.AssetComponentId = t.AssetComponentId  and p.InspectionId=@Id
	left join AllowableValue al on al.Value = p.Value and al.AttributeFieldId= p.AttributeFieldId
	left join AttributeField att on att.Id = p.AttributeFieldId 
	left join InspectionPointComment ic on ic.InspectionPointId=p.Id
	where t.FullName is not null and (p.Value is not null or p.Comments is not null or p.Value != '' or p.Comments != '')
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END



--21.12.1-rc.1

--2021-11-03_01_Translations.sql
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.flatform.show.summary')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.flatform.show.summary','Show Summary','Afficher le résumé',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.flatform.header.assetComponentName')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.flatform.header.assetComponentName','AssetComponent Name','Nom du composant d''actif',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.flatform.header.attributeFieldName')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.flatform.header.attributeFieldName','Attribute Field Name','Nom du champ d''attribut',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.flatform.header.value')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.flatform.header.value','Value','Valeur',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.flatform.header.comment')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.flatform.header.comment','Comment','Comment',0);

--21.12.1-rc.2

--20-10-13-01-Translation.sql
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.sm.image.size')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.sm.image.size',
	'Max image size download on mobile','Taille maximale de l''image à télécharger sur mobile',0)

--2021-11-02_01_Translations.sql
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.appconfig.show_inspections')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.appconfig.show_inspections','Show Inspections','Afficher les inspections',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.scheduling.due.date')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.scheduling.due.date','Due Date','Date d''échéance',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.appconfig.use_only_due_date')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.appconfig.use_only_due_date','Use only due date for inspection master on planning','Date de fin seulement (planning)',0);
IF NOT EXISTS (SELECT 1 FROM [dbo].[IMSLanguage] WHERE Code = 'ims5.lang.item(s).filtered')
    INSERT INTO [dbo].[IMSLanguage] ([Code],[Language1],[Language2],[ForMobile]) VALUES ('ims5.lang.item(s).filtered','item(s) filtered','élements filtrés',0);

--2021-11-29_CptTypeFlagTypeMaterial_update.sql

IF COL_LENGTH('ComponentType_FlagType', 'MaterialId') IS NULL
    SET NOEXEC OFF;
ELSE
    SET NOEXEC ON;

-- Add missing columns
ALTER TABLE [dbo].ComponentType_FlagType ADD MaterialId uniqueidentifier;
ALTER TABLE [dbo].ComponentType_FlagType ADD Id uniqueidentifier;

-- Drop current PK
IF OBJECT_ID('PK_ComponentType_FlagType') is not null
ALTER TABLE ComponentType_FlagType DROP CONSTRAINT PK_ComponentType_FlagType;

-- Update Id for PK
EXEC('UPDATE ComponentType_FlagType set Id = newid();');

-- Add PK on Id
ALTER TABLE [dbo].ComponentType_FlagType alter column Id uniqueidentifier NOT NULL;

-- Add FK On Material
ALTER TABLE [dbo].ComponentType_FlagType ADD CONSTRAINT PK_ComponentType_FlagType PRIMARY KEY (Id);
ALTER TABLE [dbo].[ComponentType_FlagType] WITH CHECK ADD CONSTRAINT [FK_ComponentType_FlagType_Material] FOREIGN KEY([MaterialId]) REFERENCES [dbo].[Material] ([Id]);

SET NOEXEC OFF;
GO
