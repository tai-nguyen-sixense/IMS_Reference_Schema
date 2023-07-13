CREATE TABLE [dbo].[AttributeField_Condition]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ConditionId] [uniqueidentifier] NOT NULL,
[InspectionSheetId] [uniqueidentifier] NOT NULL,
[DateLinked] [smalldatetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeField_Condition] ADD CONSTRAINT [PK_AttributeField_Condition] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [ConditionId], [InspectionSheetId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeField_Condition] ADD CONSTRAINT [FK_AttributeField_Condition_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeField_Condition] ADD CONSTRAINT [FK_AttributeField_Condition_Condition] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([Id])
GO
ALTER TABLE [dbo].[AttributeField_Condition] ADD CONSTRAINT [FK_AttributeField_Condition_InspectionSheet] FOREIGN KEY ([InspectionSheetId]) REFERENCES [dbo].[InspectionSheet] ([Id])
GO
