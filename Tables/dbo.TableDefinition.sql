CREATE TABLE [dbo].[TableDefinition]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FatherColAttributeFieldId] [uniqueidentifier] NULL,
[FatherRowAttributeFieldId] [uniqueidentifier] NULL,
[ShowColTotal] [bit] NULL,
[ShowRowTotal] [bit] NULL,
[Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableDefinition] ADD CONSTRAINT [PK_TableDefinition] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableDefinition] ADD CONSTRAINT [FK_TableDefinitionCol_AttributeField] FOREIGN KEY ([FatherColAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TableDefinition] ADD CONSTRAINT [FK_TableDefinitionRow_AttributeField] FOREIGN KEY ([FatherRowAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
