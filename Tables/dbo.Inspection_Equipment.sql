CREATE TABLE [dbo].[Inspection_Equipment]
(
[InspectionId] [uniqueidentifier] NOT NULL,
[EquipmentId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_Equipment] ADD CONSTRAINT [PK_Inspection_Equipment] PRIMARY KEY NONCLUSTERED ([InspectionId], [EquipmentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_Equipment] ADD CONSTRAINT [FK_Inspection_Equipment_Equipment] FOREIGN KEY ([EquipmentId]) REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[Inspection_Equipment] ADD CONSTRAINT [FK_Inspection_Equipment_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
