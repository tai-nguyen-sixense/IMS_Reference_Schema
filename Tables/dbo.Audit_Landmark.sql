CREATE TABLE [dbo].[Audit_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[AuditId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_Landmark] ADD CONSTRAINT [PK_Audit_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Audit_Landmark] ADD CONSTRAINT [FK_Audit_Landmark_Audit] FOREIGN KEY ([AuditId]) REFERENCES [dbo].[Audit] ([Id])
GO
ALTER TABLE [dbo].[Audit_Landmark] ADD CONSTRAINT [FK_Audit_Landmark_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
