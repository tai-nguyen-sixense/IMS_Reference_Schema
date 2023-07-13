CREATE TABLE [dbo].[TableCellDefinition]
(
[Id] [uniqueidentifier] NOT NULL,
[TableId] [uniqueidentifier] NOT NULL,
[ColAttributeFieldId] [uniqueidentifier] NULL,
[ColAttributeFieldPosition] [int] NULL,
[RowAttributeFieldId] [uniqueidentifier] NULL,
[RowAttributeFieldPosition] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableCellDefinition] ADD CONSTRAINT [PK_TableCellDefinition] PRIMARY KEY CLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TableCellDefinition] ADD CONSTRAINT [FK_TableCellDefinition_TableDefinition] FOREIGN KEY ([TableId]) REFERENCES [dbo].[TableDefinition] ([Id])
GO
ALTER TABLE [dbo].[TableCellDefinition] ADD CONSTRAINT [FK_TableCellDefinitionCol_AttributeField] FOREIGN KEY ([ColAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TableCellDefinition] ADD CONSTRAINT [FK_TableCellDefinitionRow_AttributeField] FOREIGN KEY ([RowAttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
