CREATE TABLE [dbo].[HomogeneousZoneAnalysis_DecisionTree]
(
[AnalysisId] [uniqueidentifier] NOT NULL,
[DecisionTreeId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis_DecisionTree] ADD CONSTRAINT [PK_HomogeneousZoneAnalysis_DecisionTree] PRIMARY KEY CLUSTERED ([AnalysisId], [DecisionTreeId], [Position]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis_DecisionTree] ADD CONSTRAINT [FK_HZAnalysisDecisionTree_DecisionTree] FOREIGN KEY ([DecisionTreeId]) REFERENCES [dbo].[DecisionTree] ([Id])
GO
ALTER TABLE [dbo].[HomogeneousZoneAnalysis_DecisionTree] ADD CONSTRAINT [FK_HZAnalysisDecisionTree_HZAnalysis] FOREIGN KEY ([AnalysisId]) REFERENCES [dbo].[HomogeneousZoneAnalysis] ([Id])
GO
