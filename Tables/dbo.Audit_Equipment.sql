CREATE TABLE [dbo].[Audit_Equipment]
(
[AuditId] [uniqueidentifier] NOT NULL,
[EquipmentId] [uniqueidentifier] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_Equipment] ADD CONSTRAINT [PK_Audit_Equipment] PRIMARY KEY NONCLUSTERED ([AuditId], [EquipmentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_Equipment] ADD CONSTRAINT [FK_Audit_Equipment_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Audit_Equipment] ADD CONSTRAINT [FK_Audit_Equipment_Equipment] FOREIGN KEY ([EquipmentId]) REFERENCES [dbo].[Asset] ([Id])
GO
