CREATE TABLE [dbo].[BR_TaskOrderStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[RoleFromId] [uniqueidentifier] NOT NULL,
[TaskOrderStatusFromId] [uniqueidentifier] NOT NULL,
[TaskOrderStatusToId] [uniqueidentifier] NOT NULL,
[RoleToId] [uniqueidentifier] NOT NULL,
[SameTeamOnly] [bit] NOT NULL,
[FlagStatusBisToId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [PK_BR_TaskOrderStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [FK_BR_TaskOrderStatus_FlagStatusBis] FOREIGN KEY ([FlagStatusBisToId]) REFERENCES [dbo].[FlagStatusBis] ([Id])
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [FK_BR_TaskOrderStatus_Role] FOREIGN KEY ([RoleFromId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [FK_BR_TaskOrderStatus_Role1] FOREIGN KEY ([RoleToId]) REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [FK_BR_TaskOrderStatus_TaskOrderStatus] FOREIGN KEY ([TaskOrderStatusFromId]) REFERENCES [dbo].[TaskOrderStatus] ([Id])
GO
ALTER TABLE [dbo].[BR_TaskOrderStatus] ADD CONSTRAINT [FK_BR_TaskOrderStatus_TaskOrderStatus1] FOREIGN KEY ([TaskOrderStatusToId]) REFERENCES [dbo].[TaskOrderStatus] ([Id])
GO
