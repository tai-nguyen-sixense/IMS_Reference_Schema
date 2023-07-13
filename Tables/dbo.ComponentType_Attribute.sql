CREATE TABLE [dbo].[ComponentType_Attribute]
(
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL,
[DefaultValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_Attribute] ADD CONSTRAINT [PK_ComponentTypeAttribute] PRIMARY KEY NONCLUSTERED ([ComponentTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentType_Attribute] ADD CONSTRAINT [FK_ComponentType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentType_Attribute] ADD CONSTRAINT [FK_ComponentType_Attribute_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
