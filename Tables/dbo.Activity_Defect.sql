CREATE TABLE [dbo].[Activity_Defect]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[DefectId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Defect] ADD CONSTRAINT [PK_Activity-Defect] PRIMARY KEY NONCLUSTERED ([ActivityId], [DefectId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Defect] ADD CONSTRAINT [FK_Activity_Defect_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Activity_Defect] ADD CONSTRAINT [FK_Activity_Defect_Defect] FOREIGN KEY ([DefectId]) REFERENCES [dbo].[Defect] ([Id])
GO
