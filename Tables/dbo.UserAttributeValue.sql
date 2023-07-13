CREATE TABLE [dbo].[UserAttributeValue]
(
[UserId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAttributeValue] ADD CONSTRAINT [PK_UserAttributeValue_1] PRIMARY KEY NONCLUSTERED ([UserId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAttributeValue] ADD CONSTRAINT [FK_UserAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[UserAttributeValue] ADD CONSTRAINT [FK_UserAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
