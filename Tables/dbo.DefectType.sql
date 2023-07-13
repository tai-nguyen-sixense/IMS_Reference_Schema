CREATE TABLE [dbo].[DefectType]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Style] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HelpContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRetired] [bit] NOT NULL CONSTRAINT [DF_DefectType_IsRetired] DEFAULT ((0)),
[ManagementRestrictedTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType] ADD CONSTRAINT [PK_DefectKnowledge] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectType] ADD CONSTRAINT [FK_DefectKnowledge_DefectKnowledge] FOREIGN KEY ([FatherId]) REFERENCES [dbo].[DefectType] ([Id])
GO
