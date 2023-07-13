CREATE TABLE [dbo].[TaskOrder_Flag]
(
[TaskOrderId] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NOT NULL,
[WorkDetailsId] [uniqueidentifier] NULL,
[UserId] [uniqueidentifier] NOT NULL,
[DateLinked] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Flag] ADD CONSTRAINT [PK_TaskOrder_Flag] PRIMARY KEY NONCLUSTERED ([TaskOrderId], [FlagId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Flag] ADD CONSTRAINT [FK_TaskOrder_Flag_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Flag] ADD CONSTRAINT [FK_TaskOrder_Flag_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Flag] ADD CONSTRAINT [FK_TaskOrder_Flag_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Flag] ADD CONSTRAINT [FK_TaskOrder_Flag_WorkDetails] FOREIGN KEY ([WorkDetailsId]) REFERENCES [dbo].[WorkDetails] ([Id])
GO
