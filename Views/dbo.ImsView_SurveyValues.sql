SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ImsView_SurveyValues]
AS
SELECT dbo.Survey.Id AS SurveyId, dbo.SurveyValue.Id AS SurveyValueId, dbo.Survey.Date AS SurveyDate, dbo.Survey.AssetId AS SurveyAssetId, dbo.SurveyValue.AttributeFieldId AS SurveyValueAttributeFieldId, dbo.Landmark.PositionZ + dbo.SurveyValue.DeltaX AS Position, dbo.SurveyValue.DeltaY AS Length, 
                dbo.SurveyValue.Value, dbo.SurveyValue.Comments
FROM   dbo.SurveyValue INNER JOIN
                dbo.Survey ON dbo.SurveyValue.SurveyId = dbo.Survey.Id INNER JOIN
                dbo.Landmark ON dbo.SurveyValue.LandmarkId = dbo.Landmark.Id
GO
