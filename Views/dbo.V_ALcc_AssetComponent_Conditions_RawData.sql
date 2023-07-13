SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW [dbo].[V_ALcc_AssetComponent_Conditions_RawData] AS
SELECT *
  FROM
  (
  SELECT AttributeField.Name AttributeFieldName,AssetComponentId,IP.Value, IP.InspectionId
  FROM InspectionPoint IP 
   INNER JOIN AttributeField ON AttributeField.Id = IP.AttributeFieldId 
   WHERE IP.AttributeFieldId IN (  
  '0A0863D7-1F92-4404-8CE3-E50AD864402A',
  'F3410E22-54A7-4335-B7C3-0A9DC270615B',
  'F202B6A2-30A5-4974-8113-16E462E3FCE1',
  'BC3A1C0A-34AC-4343-AFC2-F697F541B44F'

   )
)up
 PIVOT (MAX(value) FOR AttributeFieldName IN ([Excellent],[Good],[Fair],[Poor]))pvt
GO
