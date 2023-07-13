CREATE TABLE [dbo].[Activity_Equipment]
(
[ActivityId] [uniqueidentifier] NOT NULL,
[EquipmentId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Equipment] ADD CONSTRAINT [PK_Activity_Equipment] PRIMARY KEY NONCLUSTERED ([ActivityId], [EquipmentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Equipment] ADD CONSTRAINT [FK_Activity_Equipment_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Activity_Equipment] ADD CONSTRAINT [FK_Activity_Equipment_Equipment] FOREIGN KEY ([EquipmentId]) REFERENCES [dbo].[Asset] ([Id])
GO
