CREATE TABLE [dbo].[BimModel]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Settings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [uniqueidentifier] NOT NULL,
[LastModified] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BimModel] ADD CONSTRAINT [PK_BimModel] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BimModel] ADD CONSTRAINT [FK_BimModel_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[BimModel] ADD CONSTRAINT [FK_BimModel_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
