CREATE TABLE [dbo].[AssetAttributeValue]
(
[AssetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ChapterId] [uniqueidentifier] NOT NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL,
[ValueTagId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [PK_AssetAttributeValue_1] PRIMARY KEY NONCLUSTERED ([AssetId], [AttributeFieldId], [ValueVersionId], [ChapterId], [ValueTagId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_aav_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_AssetAttributeValue_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_AssetAttributeValue_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_AssetAttributeValue_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_AssetAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValue] ADD CONSTRAINT [FK_AssetAttributeValue_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
