CREATE TABLE [dbo].[InspectionSheet]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet] ADD CONSTRAINT [PK_InspectionSheet] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
