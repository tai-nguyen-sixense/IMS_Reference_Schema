CREATE TABLE [dbo].[TransverseType_Attribute]
(
[TransverseTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseType_Attribute] ADD CONSTRAINT [PK_TransverseTypeAttribute] PRIMARY KEY NONCLUSTERED ([TransverseTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseType_Attribute] ADD CONSTRAINT [FK_TransverseType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TransverseType_Attribute] ADD CONSTRAINT [FK_TransverseType_Attribute_TransverseType] FOREIGN KEY ([TransverseTypeId]) REFERENCES [dbo].[TransverseType] ([Id])
GO
