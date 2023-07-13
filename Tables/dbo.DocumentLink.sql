CREATE TABLE [dbo].[DocumentLink]
(
[DocumentId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentLink] ADD CONSTRAINT [PK_DocumentLink] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentLink] ADD CONSTRAINT [FK_DocumentLink_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[DocumentLink] ADD CONSTRAINT [FK_DocumentLink_Document] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[DocumentLink] ADD CONSTRAINT [FK_DocumentLink_Father] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Document] ([Id])
GO
