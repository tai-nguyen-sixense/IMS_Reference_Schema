CREATE TABLE [dbo].[InspectionFinalRating]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[InspectionFinalRatingGroupId] [uniqueidentifier] NOT NULL,
[DateLinked] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRating] ADD CONSTRAINT [PK_InspectionFinalRating] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [InspectionFinalRatingGroupId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRating] ADD CONSTRAINT [FK_InspectionFinalRating_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[InspectionFinalRating] ADD CONSTRAINT [FK_InspectionFinalRating_InspectionFinalRatingGroup] FOREIGN KEY ([InspectionFinalRatingGroupId]) REFERENCES [dbo].[InspectionFinalRatingGroup] ([Id])
GO
