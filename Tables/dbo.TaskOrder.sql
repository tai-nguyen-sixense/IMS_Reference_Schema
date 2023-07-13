CREATE TABLE [dbo].[TaskOrder]
(
[Id] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AssignmentDate] [date] NOT NULL,
[AssignedToId] [uniqueidentifier] NULL,
[Duration] [int] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DueDate] [date] NULL,
[ContractId] [uniqueidentifier] NULL,
[TaskOrderPriorityId] [uniqueidentifier] NOT NULL,
[TaskOrderStatusId] [uniqueidentifier] NOT NULL,
[LastModified] [date] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[EstimatedCost] [money] NULL,
[ActualCost] [money] NULL,
[PercentageComplete] [int] NOT NULL,
[ProjectManagerId] [uniqueidentifier] NULL,
[RequestId] [uniqueidentifier] NULL,
[TaskOrderTypeId] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TaskOrder__TaskO__70148828] DEFAULT ('714C8122-E3A3-45A3-9811-37FCF764FF23')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [PK_TaskOrder] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_Contract] FOREIGN KEY ([ContractId]) REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_Request] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Request] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_TaskOrderPriority1] FOREIGN KEY ([TaskOrderPriorityId]) REFERENCES [dbo].[TaskOrderPriority] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_TaskOrderStatus1] FOREIGN KEY ([TaskOrderStatusId]) REFERENCES [dbo].[TaskOrderStatus] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_TaskOrderType] FOREIGN KEY ([TaskOrderTypeId]) REFERENCES [dbo].[TaskOrderType] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_User2] FOREIGN KEY ([AssignedToId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_User3] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder] ADD CONSTRAINT [FK_TaskOrder_User4] FOREIGN KEY ([ProjectManagerId]) REFERENCES [dbo].[User] ([Id])
GO
