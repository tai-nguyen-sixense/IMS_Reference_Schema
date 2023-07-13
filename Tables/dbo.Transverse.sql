CREATE TABLE [dbo].[Transverse]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransverseTypeId] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transverse] ADD CONSTRAINT [PK_Transverse] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transverse] ADD CONSTRAINT [FK_Transverse_Transverse] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[Transverse] ([Id])
GO
ALTER TABLE [dbo].[Transverse] ADD CONSTRAINT [FK_Transverse_TransverseType] FOREIGN KEY ([TransverseTypeId]) REFERENCES [dbo].[TransverseType] ([Id])
GO
ALTER TABLE [dbo].[Transverse] ADD CONSTRAINT [FK_Transverse_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
