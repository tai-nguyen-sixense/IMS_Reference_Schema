CREATE TABLE [dbo].[NavigationDrawing]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DrawingType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[IsSynoptic] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing] ADD CONSTRAINT [PK_NavigationDrawing] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NavigationDrawing] ADD CONSTRAINT [FK_NavigationDrawing_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[NavigationDrawing] ADD CONSTRAINT [FK_NavigationDrawing_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
