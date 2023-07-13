CREATE TABLE [dbo].[ComponentTypeCost]
(
[Id] [uniqueidentifier] NOT NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[AttributeField1Id] [uniqueidentifier] NULL,
[AttributeField1Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeField2Id] [uniqueidentifier] NULL,
[AttributeField2Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeField3Id] [uniqueidentifier] NULL,
[AttributeField3Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [float] NOT NULL,
[ActivityTypeId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [PK_ComponentTypeCost] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [FK_ComponentTypeCost_ActivityType] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [FK_ComponentTypeCost_AttributeField1] FOREIGN KEY ([AttributeField1Id]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [FK_ComponentTypeCost_AttributeField2] FOREIGN KEY ([AttributeField2Id]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [FK_ComponentTypeCost_AttributeField3] FOREIGN KEY ([AttributeField3Id]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ComponentTypeCost] ADD CONSTRAINT [FK_ComponentTypeCost_ComponentType] FOREIGN KEY ([ComponentTypeId]) REFERENCES [dbo].[ComponentType] ([Id])
GO
