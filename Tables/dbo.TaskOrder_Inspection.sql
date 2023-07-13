CREATE TABLE [dbo].[TaskOrder_Inspection]
(
[TaskOrderId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Inspection] ADD CONSTRAINT [PK_TaskOrder_Inspection] PRIMARY KEY NONCLUSTERED ([TaskOrderId], [InspectionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrder_Inspection] ADD CONSTRAINT [FK_TaskOrder_Inspection_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[TaskOrder_Inspection] ADD CONSTRAINT [FK_TaskOrder_Inspection_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
