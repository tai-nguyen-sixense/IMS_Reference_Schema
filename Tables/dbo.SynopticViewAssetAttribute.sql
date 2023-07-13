CREATE TABLE [dbo].[SynopticViewAssetAttribute]
(
[SynopticViewId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ChapterId] [uniqueidentifier] NOT NULL,
[PositionX] [numeric] (6, 2) NOT NULL,
[PositionY] [numeric] (6, 2) NOT NULL,
[ViewLabel] [bit] NOT NULL,
[RotateAngle] [numeric] (6, 2) NOT NULL,
[LabelWidth] [numeric] (6, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticViewAssetAttribute] ADD CONSTRAINT [PK_SynopticViewAssetAttribute] PRIMARY KEY NONCLUSTERED ([SynopticViewId], [AttributeFieldId], [ChapterId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticViewAssetAttribute] ADD CONSTRAINT [FK_SynopticViewAssetAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[SynopticViewAssetAttribute] ADD CONSTRAINT [FK_SynopticViewAssetAttribute_Chapter] FOREIGN KEY ([ChapterId]) REFERENCES [dbo].[Chapter] ([Id])
GO
ALTER TABLE [dbo].[SynopticViewAssetAttribute] ADD CONSTRAINT [FK_SynopticViewAssetAttribute_SynopticView] FOREIGN KEY ([SynopticViewId]) REFERENCES [dbo].[SynopticView] ([Id])
GO
