CREATE TABLE [dbo].[Dashboard]
(
[Id] [uniqueidentifier] NOT NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WidthFlex] [int] NOT NULL,
[HeightPixels] [int] NOT NULL,
[XaxisLabel] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YaxisLabel] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SqlRequest] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Position] [int] NOT NULL,
[Page] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dashboard] ADD CONSTRAINT [PK_Dashboard] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
