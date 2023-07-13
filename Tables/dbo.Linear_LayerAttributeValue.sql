CREATE TABLE [dbo].[Linear_LayerAttributeValue]
(
[Linear_LayerId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueNumeric] [float] NULL,
[ValueDate] [datetime] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [datetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LayerAttributeValue] ADD CONSTRAINT [PK_Linear_LayerAttributeValue] PRIMARY KEY NONCLUSTERED ([Linear_LayerId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linear_LayerAttributeValue] ADD CONSTRAINT [FK_Linear_LayerAttributeValue_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[Linear_LayerAttributeValue] ADD CONSTRAINT [FK_Linear_LayerAttributeValue_Linear_Layer] FOREIGN KEY ([Linear_LayerId]) REFERENCES [dbo].[Linear_Layer] ([Id])
GO
ALTER TABLE [dbo].[Linear_LayerAttributeValue] ADD CONSTRAINT [FK_Linear_LayerAttributeValue_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
