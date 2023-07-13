CREATE TABLE [dbo].[BreadcrumbExtraData]
(
[Id] [uniqueidentifier] NOT NULL,
[Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttributeFieldId] [uniqueidentifier] NULL,
[Column] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BreadcrumbExtraData] ADD CONSTRAINT [PK_BreadcrumbExtraData] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BreadcrumbExtraData] ADD CONSTRAINT [FK_BreadcrumbExtraData_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[BreadcrumbExtraData] ADD CONSTRAINT [FK_BreadcrumbExtraData_Type] FOREIGN KEY ([Type]) REFERENCES [dbo].[BreadcrumbType] ([Type])
GO
