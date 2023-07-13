CREATE TABLE [dbo].[BR_InspectionStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[InspectionStatusFromId] [uniqueidentifier] NOT NULL,
[InspectionStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL,
[UpdateReviewer] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_InspectionStatus] ADD CONSTRAINT [PK_BR_InspectionStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_InspectionStatus] ADD CONSTRAINT [FK_BR_InspectionStatus_InspectionStatus] FOREIGN KEY ([InspectionStatusFromId]) REFERENCES [dbo].[InspectionStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_InspectionStatus] ADD CONSTRAINT [FK_BR_InspectionStatus_InspectionStatus1] FOREIGN KEY ([InspectionStatusToId]) REFERENCES [dbo].[InspectionStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_InspectionStatus] ADD CONSTRAINT [FK_BR_InspectionStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_InspectionStatus] ADD CONSTRAINT [FK_BR_InspectionStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
