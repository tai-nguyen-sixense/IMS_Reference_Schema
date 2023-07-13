CREATE TABLE [dbo].[InspectionChapter]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionChapter] ADD CONSTRAINT [PK_InspectionChapter] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
