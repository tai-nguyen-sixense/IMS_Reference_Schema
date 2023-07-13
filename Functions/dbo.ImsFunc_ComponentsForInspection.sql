SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Jack Daus
-- Create date: 2020-11-06
-- Description:	Gets the full tree of elements for the FlatForm for all valid component paths. 
--				A valid component path is defined as:
--					(1) not having any ancestor components archived before the current Inspeciton.FromDate
--					(2) not having any ancestor component which is excluded from the inspection master
-- InPut:		Inspection Id
-- OutPut:		AssetComponent Ids
-- =============================================

CREATE FUNCTION [dbo].[ImsFunc_ComponentsForInspection]
(
	@inspectionID uniqueidentifier
)
/**/
RETURNS TABLE AS RETURN
(
	/*Recursive CTE*/
	WITH AssetComponentHierarchy (BaseId, AncestorId, AncestorLevel, AncestorIsActive, AncestorDateDeactivated, InspectionMasterId, AncestorExcludedFromMaster)
	AS
	(
		select  
			ac1.id,
			ac1.id,
			0,
			ac1.IsActive,
			ac1.DateDeactivated,
			im.Id,
			IIF(im_ec.AssetComponentId IS NULL, 0, 1)
		from inspection i
		inner join InspectionMaster im on im.id = i.InspectionMasterId
		inner join asset a on im.AssetId = a.id
		inner join InspectionType it on it.Id = im.InspectionTypeId
		inner join InspectionType_InspectionSheet itis on itis.InspectionTypeId = it.id
		inner join InspectionSheet insps on insps.Id = itis.InspectionSheetId
		inner join InspectionSheet_ComponentType isct on isct.InspectionSheetId = insps.id
		/*NOTE: here we would add a condition regarding the InspectionSheet_ComponentType.ValidFrom/ValidTo*/
		inner join ComponentType ct on ct.id = isct.ComponentTypeId
		inner join AssetComponent ac1 on ac1.ComponentTypeId = isct.ComponentTypeId and ac1.AssetId = a.id
		left join InspectionMaster_ExcludedComponents im_ec on im.id = im_ec.InspectionMasterId and ac1.Id = im_ec.AssetComponentId
		where insps.type = 'Points'
		and i.id = @inspectionID /*Filter placed here explicitly, within the CTE. Runs fast.*/
		/*Filter out excluded base records from the get-go. Significantly improves speed.  and ac1.IsActive=1*/
		--and ac1.IsActive=1
		and (i.DateFrom < ac1.DateDeactivated or ac1.DateDeactivated IS NULL)
		and im_ec.AssetComponentId IS NULL

		UNION ALL

		select 
			AssetComponentHierarchy.BaseId, 
			FatherComp.FatherId, 
			AncestorLevel + 1,
			FatherComp.IsActive,
			FatherComp.DateDeactivated,
			AssetComponentHierarchy.InspectionMasterId,
			IIF((Select im_ec.AssetComponentId
			from InspectionMaster_ExcludedComponents im_ec 
			where im_ec.InspectionMasterId = AssetComponentHierarchy.InspectionMasterId
			and im_ec.AssetComponentId = FatherComp.Id) IS NULL, 0, 1) /*Outer join is not allowed in the recursive part of a CTE*/
		from AssetComponentHierarchy
		join AssetComponent FatherComp on AssetComponentHierarchy.AncestorId = FatherComp.Id
		where FatherComp.FatherId is not null
	)

	/*We take the AncestorId column because we want to be able to build the full tree with all valid (i.e., active and non-excluded) component paths*/
	select distinct x.AncestorId AS AssetComponentId
	from AssetComponentHierarchy AS x
	left join AssetComponentHierarchy AS ExclusionViaAncestors
		on x.BaseId = ExclusionViaAncestors.BaseId 
		AND (ExclusionViaAncestors.AncestorExcludedFromMaster = 1 
			OR (ExclusionViaAncestors.AncestorIsActive = 0 AND ExclusionViaAncestors.AncestorDateDeactivated < (select DateFrom from Inspection where Id = @inspectionID)))
	where ExclusionViaAncestors.BaseId is null
)

GO
