CREATE TABLE [dbo].[AssetAttributeValueHistory]
(
[AssetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ChapterId] [uniqueidentifier] NOT NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL,
[ValueTagId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [PK_AssetAttributeValueHistory_1] PRIMARY KEY NONCLUSTERED ([AssetId], [AttributeFieldId], [ValueVersionId], [ChapterId], [DateArchived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_aavh_ValueTagId] FOREIGN KEY ([ValueTagId]) REFERENCES [dbo].[ValueTag] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_AssetAttributeValueHistory_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_AssetAttributeValueHistory_AttributeField1] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_AssetAttributeValueHistory_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_AssetAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AssetAttributeValueHistory] ADD CONSTRAINT [FK_AssetAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
