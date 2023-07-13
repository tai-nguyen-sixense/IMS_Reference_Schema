CREATE TABLE [dbo].[ReportGraph]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[Manual] [bit] NOT NULL,
[Monthly] [bit] NOT NULL,
[Yearly] [bit] NOT NULL,
[AssetId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportGraph] ADD CONSTRAINT [PK_ReportGraph] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportGraph] ADD CONSTRAINT [FK_ReportGraph_AssetId] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[ReportGraph] ADD CONSTRAINT [FK_ReportGraph_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ReportGraph] ADD CONSTRAINT [FK_ReportGraph_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
