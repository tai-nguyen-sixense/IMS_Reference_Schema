CREATE TABLE [dbo].[AllowableValueLink]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttributeFieldIdLink] [uniqueidentifier] NOT NULL,
[ValueLink] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Id] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowableValueLink] ADD CONSTRAINT [PK_AllowableValueLink] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowableValueLink] ADD CONSTRAINT [FK_AllowableValueLink_AllowableValue] FOREIGN KEY ([AttributeFieldId], [Value]) REFERENCES [dbo].[AllowableValue] ([AttributeFieldId], [Value])
GO
ALTER TABLE [dbo].[AllowableValueLink] ADD CONSTRAINT [FK_AllowableValueLink_AllowableValue1] FOREIGN KEY ([AttributeFieldIdLink], [ValueLink]) REFERENCES [dbo].[AllowableValue] ([AttributeFieldId], [Value])
GO
