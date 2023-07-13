CREATE TABLE [dbo].[Drawing]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DrawingType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthorId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drawing] ADD CONSTRAINT [PK_Drawing] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drawing] ADD CONSTRAINT [FK_Drawing_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Drawing] ADD CONSTRAINT [FK_Drawing_User] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
