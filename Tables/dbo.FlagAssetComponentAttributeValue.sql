CREATE TABLE [dbo].[FlagAssetComponentAttributeValue]
(
[FlagAssetComponentId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAssetComponentAttributeValue] ADD CONSTRAINT [PK_FlagAssetComponentAttributeValue] PRIMARY KEY NONCLUSTERED ([FlagAssetComponentId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagAssetComponentAttributeValue] ADD CONSTRAINT [FK_FlagAssetComponentAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FlagAssetComponentAttributeValue] ADD CONSTRAINT [FK_FlagAssetComponentAttributeValue_FlagAssetComponent] FOREIGN KEY ([FlagAssetComponentId]) REFERENCES [dbo].[Flag_AssetComponent_InspectionPoint] ([Id])
GO
ALTER TABLE [dbo].[FlagAssetComponentAttributeValue] ADD CONSTRAINT [FK_FlagAssetComponentAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
