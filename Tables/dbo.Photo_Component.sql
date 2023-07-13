CREATE TABLE [dbo].[Photo_Component]
(
[PhotoId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[ListIndex] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Photo_Component] ADD CONSTRAINT [PK_Photo_Component] PRIMARY KEY NONCLUSTERED ([PhotoId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Photo_Component] ADD CONSTRAINT [FK_Photo_Component_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Photo_Component] ADD CONSTRAINT [FK_Photo_Component_Photo] FOREIGN KEY ([PhotoId]) REFERENCES [dbo].[Photo] ([Id])
GO
