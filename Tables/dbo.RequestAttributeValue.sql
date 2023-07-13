CREATE TABLE [dbo].[RequestAttributeValue]
(
[RequestId] [uniqueidentifier] NOT NULL,
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
ALTER TABLE [dbo].[RequestAttributeValue] ADD CONSTRAINT [PK_RequestAttributeValue] PRIMARY KEY NONCLUSTERED ([RequestId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RequestAttributeValue] ADD CONSTRAINT [FK_RequestAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[RequestAttributeValue] ADD CONSTRAINT [FK_RequestAttributeValue_Request] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Request] ([Id])
GO
ALTER TABLE [dbo].[RequestAttributeValue] ADD CONSTRAINT [FK_RequestAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
