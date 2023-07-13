CREATE TABLE [dbo].[FilterAttribute]
(
[Id] [uniqueidentifier] NOT NULL,
[FilterId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[LogicOverAll] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogicAttributeField] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Operator] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FilterAttribute] ADD CONSTRAINT [PK_FilterAttribute] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FilterAttribute] ADD CONSTRAINT [FK_FilterAttribute_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[FilterAttribute] ADD CONSTRAINT [FK_FilterAttribute_Filter] FOREIGN KEY ([FilterId]) REFERENCES [dbo].[Filter] ([Id])
GO
