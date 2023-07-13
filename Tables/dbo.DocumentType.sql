CREATE TABLE [dbo].[DocumentType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsFolder] [bit] NOT NULL CONSTRAINT [DF__DocumentT__IsFol__06B7F65E] DEFAULT ('0'),
[Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__DocumentTy__Type__3C94E422] DEFAULT ('ASSET')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentType] ADD CONSTRAINT [PK_DocumentType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
