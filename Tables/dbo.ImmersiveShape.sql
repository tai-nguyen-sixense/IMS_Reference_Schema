CREATE TABLE [dbo].[ImmersiveShape]
(
[Id] [uniqueidentifier] NOT NULL,
[ImmersiveFrameId] [uniqueidentifier] NOT NULL,
[FlagId] [uniqueidentifier] NULL,
[Type] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Points] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveShape] ADD CONSTRAINT [PK_ImmersiveShape] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImmersiveShape] ADD CONSTRAINT [FK_ImmersiveShape_Flag] FOREIGN KEY ([FlagId]) REFERENCES [dbo].[Flag] ([Id])
GO
ALTER TABLE [dbo].[ImmersiveShape] ADD CONSTRAINT [FK_ImmersiveShape_ImmersiveFrame] FOREIGN KEY ([ImmersiveFrameId]) REFERENCES [dbo].[ImmersiveFrame] ([Id])
GO
