CREATE TABLE [dbo].[ContractType_Attribute]
(
[ContractTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractType_Attribute] ADD CONSTRAINT [PK_ContractType_Attribute] PRIMARY KEY NONCLUSTERED ([ContractTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractType_Attribute] ADD CONSTRAINT [FK_ContractType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ContractType_Attribute] ADD CONSTRAINT [FK_ContractType_Attribute_ContractType] FOREIGN KEY ([ContractTypeId]) REFERENCES [dbo].[ContractType] ([Id])
GO
