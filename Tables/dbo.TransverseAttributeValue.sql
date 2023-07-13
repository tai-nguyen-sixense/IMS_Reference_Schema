CREATE TABLE [dbo].[TransverseAttributeValue]
(
[TransverseId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[ValueVersionId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ValueBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommentsBis] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsHighlighted] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseAttributeValue] ADD CONSTRAINT [PK_TransverseAttributeValue] PRIMARY KEY NONCLUSTERED ([TransverseId], [AttributeFieldId], [ValueVersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransverseAttributeValue] ADD CONSTRAINT [FK_TransverseAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[TransverseAttributeValue] ADD CONSTRAINT [FK_TransverseAttributeValue_Transverse] FOREIGN KEY ([TransverseId]) REFERENCES [dbo].[Transverse] ([Id])
GO
ALTER TABLE [dbo].[TransverseAttributeValue] ADD CONSTRAINT [FK_TransverseAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TransverseAttributeValue] ADD CONSTRAINT [FK_TransverseAttributeValue_ValueVersion] FOREIGN KEY ([ValueVersionId]) REFERENCES [dbo].[ValueVersion] ([Id])
GO
