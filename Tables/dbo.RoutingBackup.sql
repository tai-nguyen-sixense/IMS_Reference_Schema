CREATE TABLE [dbo].[RoutingBackup]
(
[Id] [uniqueidentifier] NOT NULL,
[UserIdFrom] [uniqueidentifier] NOT NULL,
[UserIdTo] [uniqueidentifier] NOT NULL,
[MailSent] [bit] NOT NULL,
[DateSent] [smalldatetime] NOT NULL,
[DateReceived] [smalldatetime] NULL,
[RoutingTypeId] [uniqueidentifier] NOT NULL,
[AssetId] [uniqueidentifier] NULL,
[InspectionId] [uniqueidentifier] NULL,
[InspectionStatusId] [uniqueidentifier] NULL,
[FlagId] [uniqueidentifier] NULL,
[FlagStatusId] [uniqueidentifier] NULL,
[ActivityId] [uniqueidentifier] NULL,
[ActivityStatusId] [uniqueidentifier] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[AuditId] [uniqueidentifier] NULL,
[AuditStatusId] [uniqueidentifier] NULL,
[TaskOrderId] [uniqueidentifier] NULL,
[TaskOrderStatusId] [uniqueidentifier] NULL,
[Position] [int] NOT NULL,
[DocumentRevisionId] [uniqueidentifier] NULL,
[DocumentRevisionStatusId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoutingBackup] ADD CONSTRAINT [PK_RoutingBackup] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
