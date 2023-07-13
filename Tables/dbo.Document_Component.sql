CREATE TABLE [dbo].[Document_Component]
(
[DocumentId] [uniqueidentifier] NOT NULL,
[AssetComponentId] [uniqueidentifier] NOT NULL,
[ListIndex] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document_Component] ADD CONSTRAINT [PK_Document_Component] PRIMARY KEY NONCLUSTERED ([DocumentId], [AssetComponentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document_Component] ADD CONSTRAINT [FK_Document_Component_AssetComponent] FOREIGN KEY ([AssetComponentId]) REFERENCES [dbo].[AssetComponent] ([Id])
GO
ALTER TABLE [dbo].[Document_Component] ADD CONSTRAINT [FK_Document_Component_Document] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Document] ([Id])
GO
