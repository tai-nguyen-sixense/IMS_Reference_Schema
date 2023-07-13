CREATE TABLE [dbo].[InspectionSheet_Attribute_Material]
(
[InspectionSheetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[MaterialId] [uniqueidentifier] NOT NULL,
[ValidFrom] [datetime] NOT NULL,
[ValidTo] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute_Material] ADD CONSTRAINT [PK_InspectionSheet_Attribute_Material] PRIMARY KEY NONCLUSTERED ([InspectionSheetId], [AttributeFieldId], [MaterialId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute_Material] ADD CONSTRAINT [FK_InspectionSheet_Attribute_Material_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute_Material] ADD CONSTRAINT [FK_InspectionSheet_Attribute_Material_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute_Material] ADD CONSTRAINT [FK_InspectionSheet_Attribute_Material_InspectionSheet_Attribute] FOREIGN KEY ([InspectionSheetId], [AttributeFieldId]) REFERENCES [dbo].[InspectionSheet_Attribute] ([InspectionSheetId], [AttributeFieldId])
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute_Material] ADD CONSTRAINT [FK_InspectionSheet_Attribute_Material_Material] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
GO
