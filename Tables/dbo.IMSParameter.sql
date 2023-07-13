CREATE TABLE [dbo].[IMSParameter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsPublic] [bit] NOT NULL CONSTRAINT [DF_IsPublic] DEFAULT ('0')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IMSParameter] ADD CONSTRAINT [PK_IMSParameter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IMSParameter] ADD CONSTRAINT [UC_IMSParameter_Name] UNIQUE NONCLUSTERED ([Name]) ON [PRIMARY]
GO
