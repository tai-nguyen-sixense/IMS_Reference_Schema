CREATE TABLE [dbo].[LccRatingLaw]
(
[SubScenarioValue] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[LifespanWithNoMaintenance] [numeric] (18, 2) NOT NULL,
[LifespanWithFullMaintenance] [numeric] (18, 2) NOT NULL,
[RatingOfNewComponent] [numeric] (18, 2) NOT NULL,
[RatingWhenComponentIsDefectuous] [numeric] (18, 2) NOT NULL,
[RatingWhenComponentNeedsRepair] [numeric] (18, 2) NOT NULL,
[RatingIncreaseAfterRepair] [numeric] (18, 2) NOT NULL,
[CoefficientForAssetRating] [numeric] (18, 2) NOT NULL,
[NumberMaxOfRepair] [numeric] (18, 2) NOT NULL,
[IsCritical] [bit] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccRatingLaw] ADD CONSTRAINT [PK__LccRatin__C6267F24D4D61AB0] PRIMARY KEY NONCLUSTERED ([SubScenarioValue], [AttributeFieldId], [ComponentTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LccRatingLaw] ADD CONSTRAINT [FK_LccRatingLaw_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[LccRatingLaw] ADD CONSTRAINT [FK_LccRatingLaw_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
