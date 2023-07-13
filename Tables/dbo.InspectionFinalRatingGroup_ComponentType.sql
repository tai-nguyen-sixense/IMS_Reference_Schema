CREATE TABLE [dbo].[InspectionFinalRatingGroup_ComponentType]
(
[InspectionFinaleRatingGroupId] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[AdditionalWeight] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRatingGroup_ComponentType] ADD CONSTRAINT [PK_InspectionFinalRatingGroup_ComponentType] PRIMARY KEY NONCLUSTERED ([InspectionFinaleRatingGroupId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRatingGroup_ComponentType] ADD CONSTRAINT [FK_InspectionFinalRatingGroup_ComponentType_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
ALTER TABLE [dbo].[InspectionFinalRatingGroup_ComponentType] ADD CONSTRAINT [FK_InspectionFinalRatingGroup_ComponentType_InspectionFinalRatingGroup] FOREIGN KEY ([InspectionFinaleRatingGroupId]) REFERENCES [dbo].[InspectionFinalRatingGroup] ([Id])
GO
