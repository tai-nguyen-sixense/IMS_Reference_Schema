CREATE TABLE [dbo].[Threshold]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Threshold] ADD CONSTRAINT [PK_Threshold] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
