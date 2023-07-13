CREATE TABLE [dbo].[SynopticViewDetails]
(
[Id] [uniqueidentifier] NOT NULL,
[SynopticViewId] [uniqueidentifier] NOT NULL,
[ComponentTypeShapeId] [uniqueidentifier] NOT NULL,
[GridRow] [int] NOT NULL,
[GridRowSpan] [int] NOT NULL,
[GridColumn] [int] NOT NULL,
[GridColumnSpan] [int] NOT NULL,
[ComponentNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticViewDetails] ADD CONSTRAINT [PK_SynopticViewDetails] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynopticViewDetails] ADD CONSTRAINT [FK_SynopticViewDetails_ComponentTypeShape] FOREIGN KEY ([ComponentTypeShapeId]) REFERENCES [dbo].[ComponentTypeShape] ([Id])
GO
ALTER TABLE [dbo].[SynopticViewDetails] ADD CONSTRAINT [FK_SynopticViewDetails_SynopticView] FOREIGN KEY ([SynopticViewId]) REFERENCES [dbo].[SynopticView] ([Id])
GO
