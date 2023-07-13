CREATE TABLE [dbo].[InspectionType_Attribute]
(
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_Attribute] ADD CONSTRAINT [PK_InspectionType_Attribute] PRIMARY KEY NONCLUSTERED ([InspectionTypeId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_Attribute] ADD CONSTRAINT [FK_InspectionType_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionType_Attribute] ADD CONSTRAINT [FK_InspectionType_Attribute_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
