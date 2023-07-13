CREATE TABLE [dbo].[DecisionTreeNode]
(
[NodeId] [int] NOT NULL,
[DecisionTreeId] [uniqueidentifier] NOT NULL,
[FatherId] [int] NULL,
[ConditionOperator] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConditionValue] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DecisionTreeNode] ADD CONSTRAINT [PK_DecisionTreeNode] PRIMARY KEY CLUSTERED ([NodeId], [DecisionTreeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DecisionTreeNode] ADD CONSTRAINT [FK_DecisionTreeNode_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[DecisionTreeNode] ADD CONSTRAINT [FK_DecisionTreeNode_DecisionTree] FOREIGN KEY ([DecisionTreeId]) REFERENCES [dbo].[DecisionTree] ([Id])
GO
ALTER TABLE [dbo].[DecisionTreeNode] ADD CONSTRAINT [FK_DecisionTreeNode_DecisionTreeNodeFather] FOREIGN KEY ([FatherId], [DecisionTreeId]) REFERENCES [dbo].[DecisionTreeNode] ([NodeId], [DecisionTreeId])
GO
