SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
CREATE VIEW [dbo].[ImsView_ReportPhotoOrder]
AS
SELECT     dbo.InspectionPoint.InspectionId, 
                      dbo.V_REPORT_GENERAL_Component_hierarchy.MainElement + '\' + dbo.V_REPORT_GENERAL_Component_hierarchy.Name AS Order1, 
                      dbo.V_REPORT_GENERAL_Component_hierarchy.MainElement AS Order2, dbo.V_REPORT_GENERAL_Component_hierarchy.MasterElement AS Order3, 
                      dbo.V_REPORT_GENERAL_Component_hierarchy.SubElement AS Order4, 
                      CAST(dbo.V_REPORT_GENERAL_Component_hierarchy.ComponentTreeView AS nvarchar(MAX)) AS Order5, CAST(1 AS int) AS Order6, 1 AS Order7, 1 AS Order8, 
                      dbo.InspectionSheet_Attribute.Position AS Order9, dbo.InspectionPointComment.CommentIndex AS Order10, dbo.InspectionPointComment.InspectionPointId, 
                      dbo.InspectionPhoto_InspectionPoint.InspectionPhotoId, dbo.InspectionPhoto.NumberForReport AS Number, dbo.InspectionPhoto.ToPrintInReport
FROM         dbo.InspectionPoint INNER JOIN
                      dbo.InspectionPointComment ON dbo.InspectionPoint.Id = dbo.InspectionPointComment.InspectionPointId INNER JOIN
                      dbo.InspectionPhoto_InspectionPoint ON dbo.InspectionPointComment.Id = dbo.InspectionPhoto_InspectionPoint.InspectionPointCommentId INNER JOIN
                      dbo.InspectionSheet_Attribute ON dbo.InspectionPoint.AttributeFieldId = dbo.InspectionSheet_Attribute.AttributeFieldId AND 
                      dbo.InspectionPoint.InspectionSheetId = dbo.InspectionSheet_Attribute.InspectionSheetId INNER JOIN
                      dbo.InspectionPhoto ON dbo.InspectionPhoto_InspectionPoint.InspectionPhotoId = dbo.InspectionPhoto.Id INNER JOIN
                      dbo.V_REPORT_GENERAL_Component_hierarchy ON dbo.InspectionPoint.AssetComponentId = dbo.V_REPORT_GENERAL_Component_hierarchy.Id
GO
