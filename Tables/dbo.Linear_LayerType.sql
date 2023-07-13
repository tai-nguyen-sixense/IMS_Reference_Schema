CREATE TABLE [dbo].[Linear_LayerType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ShortName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LayerType] ADD CONSTRAINT [PK_Linear_LayerType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
