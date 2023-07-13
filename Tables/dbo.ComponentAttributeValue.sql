CREATE TABLE [dbo].[ComponentAttributeValue]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueNumericComputed] AS (TRY_CAST([Value] AS [float])) PERSISTED,
[ComponentChapterId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [PK_ComponentAttributeValue] PRIMARY KEY NONCLUSTERED ([AssetComponentId], [ComponentChapterId], [AttributeFieldId], [ValueVersionId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [FK_ComponentAttributeValue_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [FK_ComponentAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [FK_ComponentAttributeValue_ComponentChapter] FOREIGN KEY ([ComponentChapterId]) REFERENCES [dbo].[ComponentChapter] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [FK_ComponentAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentAttributeValue] ADD CONSTRAINT [FK_ComponentAttributeValue_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
