CREATE TABLE [dbo].[AssetAssetAttributeValue]
(
[AssetAssetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAssetAttributeValue] ADD CONSTRAINT [PK_AssetAssetAttributeValue] PRIMARY KEY CLUSTERED ([AssetAssetId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAssetAttributeValue] ADD CONSTRAINT [FK_AssetAssetAttributeValue_AssetAsset] FOREIGN KEY ([AssetAssetId]) REFERENCES [dbo].[Asset_Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetAssetAttributeValue] ADD CONSTRAINT [FK_AssetAssetAttributeValue_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetAssetAttributeValue] ADD CONSTRAINT [FK_AssetAssetAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
