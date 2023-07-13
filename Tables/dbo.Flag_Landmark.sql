CREATE TABLE [dbo].[Flag_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_Landmark] ADD CONSTRAINT [PK_Flag_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flag_Landmark] ADD CONSTRAINT [FK_Flag_Landmark_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[Flag_Landmark] ADD CONSTRAINT [FK_Flag_Landmark_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
