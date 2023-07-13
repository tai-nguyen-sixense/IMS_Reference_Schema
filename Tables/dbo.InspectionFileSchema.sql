CREATE TABLE [dbo].[InspectionFileSchema]
(
[Id] [uniqueidentifier] NOT NULL,
[XSD] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFileSchema] ADD CONSTRAINT [PK_InspectionFileSchema] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
