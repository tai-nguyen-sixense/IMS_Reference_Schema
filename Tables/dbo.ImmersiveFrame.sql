CREATE TABLE [dbo].[ImmersiveFrame]
(
[Id] [uniqueidentifier] NOT NULL,
[ImmersiveViewId] [uniqueidentifier] NOT NULL,
[Filename] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LowResFileName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Timestamp] [float] NOT NULL,
[X] [float] NOT NULL,
[Y] [float] NOT NULL,
[Z] [float] NOT NULL,
[Yaw] [float] NOT NULL,
[IsVisible] [bit] NOT NULL CONSTRAINT [DF__Immersive__IsVis__3489AE06] DEFAULT ('1')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveFrame] ADD CONSTRAINT [PK_ImmersiveFrame] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveFrame] ADD CONSTRAINT [FK_ImmersiveFrame_ImmersiveView] FOREIGN KEY ([ImmersiveViewId]) REFERENCES [dbo].[ImmersiveView] ([Id])
GO
