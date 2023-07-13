CREATE TABLE [dbo].[ComponentRatingValue]
(
[AssetComponentId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [smalldatetime] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentRatingValue] ADD CONSTRAINT [PK_ComponentRatingValue] PRIMARY KEY NONCLUSTERED ([AssetComponentId], [AttributeFieldId], [Date]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentRatingValue] ADD CONSTRAINT [FK_ComponentRatingValue_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[ComponentRatingValue] ADD CONSTRAINT [FK_ComponentRatingValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentRatingValue] ADD CONSTRAINT [FK_ComponentRatingValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
