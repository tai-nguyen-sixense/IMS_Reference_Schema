CREATE TABLE [dbo].[TaskOrderStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IncludedFlagsStatusBisId] [uniqueidentifier] NULL,
[IncludedFlagsStatusId] [uniqueidentifier] NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[SMCanBeDownloaded] [bit] NOT NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_TaskOrderStatus_IsRetired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderStatus] ADD CONSTRAINT [PK_TaskOrderStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderStatus] ADD CONSTRAINT [FK_taskorderstatus_IncludedFlagsStatus] FOREIGN KEY ([IncludedFlagsStatusId]) REFERENCES [dbo].[FlagStatus] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderStatus] ADD CONSTRAINT [FK_taskorderstatus_IncludedFlagsStatusBis] FOREIGN KEY ([IncludedFlagsStatusBisId]) REFERENCES [dbo].[FlagStatusBis] ([Id])
GO
