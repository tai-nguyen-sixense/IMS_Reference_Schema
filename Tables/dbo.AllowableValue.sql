CREATE TABLE [dbo].[AllowableValue]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Icon] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[ExportAs] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HelpFile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ForceComments] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowableValue] ADD CONSTRAINT [PK_FlagAllowableValue] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [Value]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowableValue] ADD CONSTRAINT [FK_AllowableValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
