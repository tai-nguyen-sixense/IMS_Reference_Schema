CREATE TABLE [dbo].[TaskOrder_Activity]
(
[TaskOrderId] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Activity] ADD CONSTRAINT [PK_TaskOrder_Activity] PRIMARY KEY NONCLUSTERED ([TaskOrderId], [ActivityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Activity] ADD CONSTRAINT [FK_TaskOrder_Activity_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Activity] ADD CONSTRAINT [FK_TaskOrder_Activity_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
