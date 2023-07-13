CREATE TABLE [dbo].[AuditStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[MarkerType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SMCanBeApplied] [bit] NOT NULL,
[SMIsLocked] [bit] NOT NULL,
[SMCanBeDownloaded] [bit] NOT NULL,
[IsReadOnly] [bit] NOT NULL CONSTRAINT [DF_AuditStatus_IsReadOnly] DEFAULT ((0)),
[StatusChangeWarningMessage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_AuditStatus_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditStatus] ADD CONSTRAINT [PK_AuditStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
