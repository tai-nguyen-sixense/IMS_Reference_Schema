CREATE TABLE [dbo].[Flag_Equipment]
(
[FlagId] [uniqueidentifier] NOT NULL,
[EquipmentId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_Equipment] ADD CONSTRAINT [PK_Flag_Equipment] PRIMARY KEY NONCLUSTERED ([FlagId], [EquipmentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_Equipment] ADD CONSTRAINT [FK_Flag_Equipment_Equipment] FOREIGN KEY ([EquipmentId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Flag_Equipment] ADD CONSTRAINT [FK_Flag_Equipment_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
