CREATE TABLE [dbo].[TaskOrder_Audit]
(
[TaskOrderId] [uniqueidentifier] NOT NULL,
[AuditId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Audit] ADD CONSTRAINT [PK_TaskOrder_Audit] PRIMARY KEY NONCLUSTERED ([TaskOrderId], [AuditId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Audit] ADD CONSTRAINT [FK_TaskOrder_Audit_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Audit] ADD CONSTRAINT [FK_TaskOrder_Audit_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
