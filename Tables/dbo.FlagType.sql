CREATE TABLE [dbo].[FlagType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[Prefix] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SMInterface] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_FlagType_IsRetired] DEFAULT ((0)),
[FatherId] [uniqueidentifier] NULL,
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnabledShape] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType] ADD CONSTRAINT [PK_FlagType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlagType] ADD CONSTRAINT [FK_flagtype_flagtype] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[FlagType] ([Id])
GO
