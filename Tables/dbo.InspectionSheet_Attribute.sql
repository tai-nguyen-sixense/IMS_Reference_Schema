CREATE TABLE [dbo].[InspectionSheet_Attribute]
(
[InspectionSheetId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[ValidFrom] [datetime] NOT NULL,
[ValidTo] [datetime] NULL,
[HasComments] [bit] NOT NULL,
[disablePhotos] [bit] NULL,
[disableFlags] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute] ADD CONSTRAINT [PK_InspectionSheet-Attribute] PRIMARY KEY NONCLUSTERED ([InspectionSheetId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute] ADD CONSTRAINT [FK_InspectionSheet_Attribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionSheet_Attribute] ADD CONSTRAINT [FK_InspectionSheet_Attribute_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
