SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Sixense INC
-- Create date: 2022-09-21
-- Description:	Database health check
-- OutPut:		table with Category, Importance, Information
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcHealthCheck]
	
AS
BEGIN
    
	BEGIN TRY  

		/*
		1-High: Serious data issue which has a high probability of creating a bug on screen or report. This is typically due to duplicates.
		2-Medium: Configuration that are not optimum and may lead to confusion for users or overcomplicate the configuration
		3-Low: Cosmetic items, that could be cleaned-up
		*/
		DECLARE @ResultTable TABLE (
			Category NVARCHAR(255),
			Importance NVARCHAR(25),
			Information NVARCHAR (MAX)
		)

		/*** IT - INDEX FRAGMENTATION ***/
		IF EXISTS (SELECT  count(*) FROM    sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'limited') ddips INNER JOIN sys.[indexes] i ON ddips.[object_id] = i.[object_id] AND ddips.[index_id] = i.[index_id] WHERE ddips.[avg_fragmentation_in_percent] > '33' AND ddips.[page_count] > '10')
			INSERT INTO @ResultTable VALUES (
				'IT - INDEX FRAGMENTATION', 
				'2-Medium', 
				'You have database indexes with more than 33% of fragmentation and over 10 pages. You should review your database performance and look into index rebuild.');


		/*** ASSET ATTRIBUTE FIELDS - ORPHEAN DATA ***/
		IF EXISTS (select Count(*) from AssetAttributeValue left join Chapter_Attribute on Chapter_Attribute.AttributeFieldId=AssetAttributeValue.AttributeFieldid Where Chapter_Attribute.AttributeFieldId IS NULL  )
			INSERT INTO @ResultTable VALUES (
				'ASSET ATTRIBUTE FIELDS - ORPHEAN DATA', 
				'1-High', 
				'You have entries in AssetAttributevalue with the field not defined in an chapter anymore. Value should be merged to a new field, archived or deleted.');

		/*** ASSET ATTRIBUTE FIELDS - DUPLICATE CHAPTER DATA ***/
		IF EXISTS (SELECT Count(*) from AssetAttributeValue GROUP BY AssetId, AttributeFieldId, ValueTagId, ValueVersionId HAVING COUNT(*) >1 )
			INSERT INTO @ResultTable VALUES (
				'ASSET ATTRIBUTE FIELDS - DUPLICATE CHAPTER DATA', 
				'1-High', 
				'You have AssetAttributevalue duplicated for the same Asset and attributeField but different chapter. Value should be merged to a new chapter or deleted.');


		/*** ASSETCOMPONENT - DUPLICATE POSITION ***/
		IF EXISTS (select Count(*) from AssetComponent GROUP BY AssetComponent.AssetId, AssetComponent.FatherId, AssetComponent.Position HAVING Count(*) > 1 )
			INSERT INTO @ResultTable VALUES (
				'ASSETCOMPONENT - DUPLICATE POSITION', 
				'2-Medium', 
				'You have entries in AssetComponent with the same parent and the same value in the position field. Position should be unique for each AssetComponent under the same parent.');

		/*** AUDIT ATTRIBUTE FIELDS - DUPLICATES NAME ***/
		IF EXISTS (select count(*)  from AttributeField Where [Type]='AUDIT' group by [Type],[Name] HAVING COUNT(*) >1 )
			INSERT INTO @ResultTable VALUES (
				'AUDIT ATTRIBUTE FIELDS - DUPLICATES NAME', 
				'2-Medium', 
				'You have attributes with the same names in your list, you might want to regroup some fields.');

		/*** AUDIT ATTRIBUTE FIELDS - UNUSED ATTRIBUTES ***/
		IF EXISTS (select count(*) from AttributeField left join AuditType_Attribute on AuditType_Attribute.AttributeFieldId=AttributeField.id Where [Type]='AUDIT' and  AuditType_Attribute.AttributeFieldId IS NULL )
			INSERT INTO @ResultTable VALUES (
				'AUDIT ATTRIBUTE FIELDS - UNUSED ATTRIBUTES', 
				'3-Low', 
				'You have unused attributes in your list, you might want to regroup delete them.');

		/*** INSPECTION ATTRIBUTE FIELDS - DUPLICATES ***/
		IF EXISTS (select count(*) from [InspectionPoint] inner join AssetComponent on [InspectionPoint].AssetComponentId =AssetComponent.Id where AssetComponent.IsActive=1 group by AssetComponentId ,AttributeFieldId ,InspectionId  having count(*) > 1 )
			INSERT INTO @ResultTable VALUES (
				'INSPECTION ATTRIBUTE FIELDS - DUPLICATES', 
				'1-High', 
				'You have duplicate inspectionpoints, the records should be cleaned up.');

		/*** INSPECTION POINTS - ERROR COMPONENT-INSPECTIONSHEETS ***/
		IF EXISTS (Select count(*) from InspectionPoint inner join AssetComponent on InspectionPoint.AssetComponentId = AssetComponent.id inner join InspectionSheet_ComponentType on AssetComponent.ComponentTypeId = InspectionSheet_ComponentType.ComponentTypeId where InspectionPoint.InspectionSheetId <> InspectionSheet_ComponentType.InspectionSheetId And AssetComponent.IsActive=1 )
			INSERT INTO @ResultTable VALUES (
				'INSPECTION POINTS - ERROR COMPONENT-INSPECTIONSHEETS', 
				'1-High', 
				'You have inspection point with a pair AssetComponent-Inspection which is not defined in InspectionSheet_ComponentType, this mean you will have display issues or possible duplicates, the records should be cleaned up.');

		/*** REPORTS - UNSUSED MODEL ***/
		IF EXISTS(select count(*) from ReportModel where IsActive=0)
			INSERT INTO @ResultTable VALUES (
				'REPORTS - UNSUSED MODEL', 
				'3-Low', 
				'You have archived report model, you might want to regroup delete them.');

		/*** REPORTS - UNSUSED MODEL ***/
		IF EXISTS(select count(*) from ReportModel left outer join Report_ReportModel on Reportmodel.id=Report_ReportModel.reportmodelid  where IsActive=1 and code like '%list%' and Report_ReportModel.id is not null)
			INSERT INTO @ResultTable VALUES (
				'REPORTS - UNSUSED MODEL', 
				'2-Medium', 
				'You have report model with a code ListXXX but linked to an Report, you might want to change their code or their assignment to a report.');

		/*** REPORTS - NO MAIN MODEL ***/
		IF (select count(*) from Report where IsActive=1 and IsMain=1) <1
			INSERT INTO @ResultTable VALUES (
				'REPORTS - NO MAIN MODEL', 
				'2-Medium', 
				'You have no Report template defined as main, there is a risk your inspection reports are not saved properly. Check if some of the report should be marked as main.');
		
		IF exists (SELECT LanguageId, linkid, COUNT(linkid) as total FROM Translation GROUP BY LanguageId, linkid HAVING COUNT(linkid) > 1)
			INSERT INTO @ResultTable VALUES (
				'TRANSLATIONS - DUPLICATES (Knowledge data)', 
				'2-Medium', 
				'SELECT LanguageId, linkid, COUNT(linkid) as total FROM Translation GROUP BY LanguageId, linkid HAVING COUNT(linkid) > 1');
		
		IF exists (SELECT LanguageId, code, COUNT(code) as total FROM Translation where LinkId is null GROUP BY LanguageId, code HAVING COUNT(code) > 1)
			INSERT INTO @ResultTable VALUES (
				'TRANSLATIONS - DUPLICATES (label)', 
				'2-Medium', 
				'SELECT LanguageId, code, COUNT(code) as total FROM Translation where LinkId is null GROUP BY LanguageId, code HAVING COUNT(code) > 1');

		IF exists (SELECT name, COUNT(name) as total FROM IMSParameter GROUP BY name HAVING COUNT(name) > 1)
			INSERT INTO @ResultTable VALUES (
				'IMSPARAMETER - DUPLICATES ', 
				'2-Medium', 
				'SELECT name, COUNT(name) as total FROM IMSParameter GROUP BY name HAVING COUNT(name) > 1');


		--- Check for attrbiutedeclared as integer with ValueNumeric empty
		/*select [Value], [ValueNumeric] from AssetAttributeValue where Attributefieldid in (
		select Id from Attributefield where [Type]='Asset' and (SqlType='REAL' or SqlType='CUR' or SqlType='INT') ) AND [Value] is not null and [ValueNumeric] is NULL

		select [Value], [ValueDate] from AssetAttributeValue where Attributefieldid in (
		select Id from Attributefield where [Type]='Asset' and SqlType='DAT') AND [Value] is not null and [ValueDate] is NULL
		*/

		Select * from @ResultTable order by Importance 

	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
