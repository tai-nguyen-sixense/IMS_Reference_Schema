CREATE TABLE [dbo].[BreadcrumbType]
(
[Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BreadcrumbType] ADD CONSTRAINT [PK_BreadcrumbType] PRIMARY KEY NONCLUSTERED ([Type]) ON [PRIMARY]
GO
