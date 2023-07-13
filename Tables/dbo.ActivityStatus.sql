CREATE TABLE [dbo].[ActivityStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsManagedByScenario] [bit] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[SMCanBeApplied] [bit] NOT NULL,
[SMIsLocked] [bit] NOT NULL,
[SMCanBeDownloaded] [bit] NOT NULL,
[IsReadOnly] [bit] NOT NULL CONSTRAINT [DF_ActivityStatus_IsReadOnly] DEFAULT ((0)),
[StatusChangeWarningMessage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_ActivityStatus_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityStatus] ADD CONSTRAINT [PK_ActivityStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
