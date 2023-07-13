CREATE TABLE [dbo].[AssetPostDetails]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetPostId] [uniqueidentifier] NOT NULL,
[LastModified] [datetime] NOT NULL,
[CreationDate] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[PostDetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetPostDetails] ADD CONSTRAINT [PK_AssetPostDetails] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetPostDetails] ADD CONSTRAINT [FK_AssetPostDetails_AssetPost] FOREIGN KEY ([AssetPostId]) REFERENCES [dbo].[AssetPost] ([Id])
GO
ALTER TABLE [dbo].[AssetPostDetails] ADD CONSTRAINT [FK_AssetPostDetails_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
