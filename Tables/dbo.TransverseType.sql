CREATE TABLE [dbo].[TransverseType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FatherId] [uniqueidentifier] NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseType] ADD CONSTRAINT [PK_TransverseType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseType] ADD CONSTRAINT [FK_TransverseType_TransverseType] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[TransverseType] ([Id])
GO
