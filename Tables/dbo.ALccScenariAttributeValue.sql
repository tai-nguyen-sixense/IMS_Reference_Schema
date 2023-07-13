CREATE TABLE [dbo].[ALccScenariAttributeValue]
(
[ALccScenariId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenariAttributeValue] ADD CONSTRAINT [PK_ALccScenariAttributeValue] PRIMARY KEY NONCLUSTERED ([ALccScenariId], [AttributeFieldId], [ValueVersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALccScenariAttributeValue] ADD CONSTRAINT [FK_ALccScenariAttributeValue_ALccScenari] FOREIGN KEY ([ALccScenariId]) REFERENCES [dbo].[ALccScenari] ([Id])
GO
ALTER TABLE [dbo].[ALccScenariAttributeValue] ADD CONSTRAINT [FK_ALccScenariAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ALccScenariAttributeValue] ADD CONSTRAINT [FK_ALccScenariAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ALccScenariAttributeValue] ADD CONSTRAINT [FK_ALccScenariAttributeValue_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
