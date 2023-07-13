CREATE TABLE [dbo].[Linear_Document]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FilePath] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[CreationDate] [datetime] NOT NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[FileUploadComplete] [bit] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Linear_LayerId] [uniqueidentifier] NULL,
[PositionXBegin] [float] NOT NULL,
[PositionXEnd] [float] NULL,
[PositionYBegin] [float] NULL,
[PositionYEnd] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Document] ADD CONSTRAINT [PK_Linear_Document] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Document] ADD CONSTRAINT [FK_Linear_Document_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_Document] ADD CONSTRAINT [FK_Linear_Document_Author] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Linear_Document] ADD CONSTRAINT [FK_Linear_Document_Linear_LayerId] FOREIGN KEY ([Linear_LayerId]) REFERENCES [dbo].[Linear_Layer] ([Id])
GO
ALTER TABLE [dbo].[Linear_Document] ADD CONSTRAINT [FK_Linear_Document_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
