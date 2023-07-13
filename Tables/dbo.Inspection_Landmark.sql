CREATE TABLE [dbo].[Inspection_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_Landmark] ADD CONSTRAINT [PK_Inspection_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspection_Landmark] ADD CONSTRAINT [FK_Inspection_Landmark_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Inspection_Landmark] ADD CONSTRAINT [FK_Inspection_Landmark_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
