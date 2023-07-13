CREATE TABLE [dbo].[BimScene_BimModel]
(
[Id] [uniqueidentifier] NOT NULL,
[BimSceneId] [uniqueidentifier] NOT NULL,
[BimModelId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[Settings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BimScene_BimModel] ADD CONSTRAINT [PK_BimScene_BimModel] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BimScene_BimModel] ADD CONSTRAINT [FK_BimScene_BimModel_BimModel] FOREIGN KEY ([BimModelId]) REFERENCES [dbo].[BimModel] ([Id])
GO
ALTER TABLE [dbo].[BimScene_BimModel] ADD CONSTRAINT [FK_BimScene_BimModel_BimScene] FOREIGN KEY ([BimSceneId]) REFERENCES [dbo].[BimScene] ([Id])
GO
ALTER TABLE [dbo].[BimScene_BimModel] ADD CONSTRAINT [FK_BimScene_BimModel_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
