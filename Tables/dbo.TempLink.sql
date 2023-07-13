CREATE TABLE [dbo].[TempLink]
(
[Id] [uniqueidentifier] NOT NULL,
[Url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Count] [int] NULL,
[Expiration] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempLink] ADD CONSTRAINT [PK_TempLink] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
