CREATE TABLE [dbo].[Task_Task]
(
[Task1Id] [uniqueidentifier] NOT NULL,
[Task2Id] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Task_Task] ADD CONSTRAINT [PK_Task-Audit] PRIMARY KEY NONCLUSTERED ([Task1Id], [Task2Id]) ON [PRIMARY]
GO
