CREATE TABLE [dbo].[Activity_Landmark]
(
[Id] [uniqueidentifier] NOT NULL,
[ActivityId] [uniqueidentifier] NOT NULL,
[LandmarkId] [uniqueidentifier] NOT NULL,
[DeltaX] [float] NOT NULL,
[DeltaY] [float] NOT NULL,
[DeltaZ] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Landmark] ADD CONSTRAINT [PK_Activity_Landmark] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity_Landmark] ADD CONSTRAINT [FK_Activity_Landmark_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Activity_Landmark] ADD CONSTRAINT [FK_Activity_Landmark_Landmark] FOREIGN KEY ([LandmarkId]) REFERENCES [dbo].[Landmark] ([Id])
GO
