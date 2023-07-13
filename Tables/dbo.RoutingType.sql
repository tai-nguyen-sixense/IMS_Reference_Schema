CREATE TABLE [dbo].[RoutingType]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[AllowedTime] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoutingType] ADD CONSTRAINT [PK_RoutingType] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
