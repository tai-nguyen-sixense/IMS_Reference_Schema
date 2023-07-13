CREATE TABLE [dbo].[AuditType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[FileName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CanBeLinkedToInspection] [bit] NOT NULL,
[IsFlowDataRelated] [bit] NOT NULL,
[SMInterface] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_AuditType_IsRetired] DEFAULT ((0)),
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType] ADD CONSTRAINT [PK_AuditType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuditType] ADD CONSTRAINT [FK_AuditType_AuditType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[AuditType] ([Id])
GO
