CREATE TABLE [dbo].[TaskOrderAttributeValue]
(
[TaskOrderId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderAttributeValue] ADD CONSTRAINT [PK_TaskOrderAttributeValue] PRIMARY KEY NONCLUSTERED ([TaskOrderId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskOrderAttributeValue] ADD CONSTRAINT [FK_TaskOrderAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderAttributeValue] ADD CONSTRAINT [FK_TaskOrderAttributeValue_TaskOrder] FOREIGN KEY ([TaskOrderId]) REFERENCES [dbo].[TaskOrder] ([Id])
GO
ALTER TABLE [dbo].[TaskOrderAttributeValue] ADD CONSTRAINT [FK_TaskOrderAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
