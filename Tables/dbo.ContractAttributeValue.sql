CREATE TABLE [dbo].[ContractAttributeValue]
(
[ContractId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractAttributeValue] ADD CONSTRAINT [PK_ContractAttributeValue] PRIMARY KEY NONCLUSTERED ([ContractId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContractAttributeValue] ADD CONSTRAINT [FK_ContractAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[ContractAttributeValue] ADD CONSTRAINT [FK_ContractAttributeValue_Contract] FOREIGN KEY ([ContractId]) REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[ContractAttributeValue] ADD CONSTRAINT [FK_ContractAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
