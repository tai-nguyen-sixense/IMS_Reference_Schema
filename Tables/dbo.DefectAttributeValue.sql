CREATE TABLE [dbo].[DefectAttributeValue]
(
[DefectID] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[IsHighlighted] [bit] NOT NULL,
[ValueDateComputed] AS (TRY_PARSE(left([value],(50)) AS [datetime]))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectAttributeValue] ADD CONSTRAINT [PK_DefectAttribute] PRIMARY KEY NONCLUSTERED ([DefectID], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DefectAttributeValue] ADD CONSTRAINT [FK_DefectAttribute_Defect] FOREIGN KEY ([DefectID]) REFERENCES [dbo].[Defect] ([Id])
GO
ALTER TABLE [dbo].[DefectAttributeValue] ADD CONSTRAINT [FK_DefectAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[DefectAttributeValue] ADD CONSTRAINT [FK_DefectAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
