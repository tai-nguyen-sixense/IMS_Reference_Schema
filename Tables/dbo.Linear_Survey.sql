CREATE TABLE [dbo].[Linear_Survey]
(
[Id] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NOT NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Survey] ADD CONSTRAINT [PK_Linear_Survey] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_Survey] ADD CONSTRAINT [FK_Linear_Survey_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Linear_Survey] ADD CONSTRAINT [FK_Linear_Survey_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
