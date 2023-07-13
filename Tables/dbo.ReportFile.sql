CREATE TABLE [dbo].[ReportFile]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [uniqueidentifier] NULL,
[FilePath] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportFile] ADD CONSTRAINT [PK_ReportFile] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportFile] ADD CONSTRAINT [FK_ReportFile_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
