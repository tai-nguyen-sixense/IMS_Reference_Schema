CREATE TABLE [dbo].[ComponentAttributeValueHistory]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[DateArchived] [datetime] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ComponentChapterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [PK_ComponentAttributeValueHistory] PRIMARY KEY NONCLUSTERED ([AssetComponentId], [ComponentChapterId], [AttributeFieldId], [ValueVersionId], [DateArchived]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [FK_ComponentAttributeValueHistory_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [FK_ComponentAttributeValueHistory_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [FK_ComponentAttributeValueHistory_ComponentChapter] FOREIGN KEY ([ComponentChapterId]) REFERENCES [dbo].[ComponentChapter] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [FK_ComponentAttributeValueHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValueHistory] ADD CONSTRAINT [FK_ComponentAttributeValueHistory_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
