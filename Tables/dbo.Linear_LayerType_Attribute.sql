CREATE TABLE [dbo].[Linear_LayerType_Attribute]
(
[Linear_LayerTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LayerType_Attribute] ADD CONSTRAINT [PK_Linear_LayerType_Attribute] PRIMARY KEY NONCLUSTERED ([Linear_LayerTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LayerType_Attribute] ADD CONSTRAINT [FK_Linear_LayerType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[Linear_LayerType_Attribute] ADD CONSTRAINT [FK_Linear_LayerType_Attribute_Linear_LayerType] FOREIGN KEY ([Linear_LayerTypeId]) REFERENCES [dbo].[Linear_LayerType] ([Id])
GO
