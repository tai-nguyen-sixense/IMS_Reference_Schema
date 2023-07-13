CREATE TABLE [dbo].[AssetPost]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NULL,
[LastModified] [datetime] NOT NULL,
[CreationDate] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Post] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetPost] ADD CONSTRAINT [PK_AssetPost] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetPost] ADD CONSTRAINT [FK_AssetPost_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetPost] ADD CONSTRAINT [FK_AssetPost_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
