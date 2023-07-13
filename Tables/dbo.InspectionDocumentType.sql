CREATE TABLE [dbo].[InspectionDocumentType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionDocumentType] ADD CONSTRAINT [PK_InspectionDocumentType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
