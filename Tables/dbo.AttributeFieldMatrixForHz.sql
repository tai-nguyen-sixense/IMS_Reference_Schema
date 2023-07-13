CREATE TABLE [dbo].[AttributeFieldMatrixForHz]
(
[MatrixId] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[DateLinked] [smalldatetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrixForHz] ADD CONSTRAINT [PK_AttributeFieldMatrixForHz] PRIMARY KEY NONCLUSTERED ([MatrixId], [AttributeFieldId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrixForHz] ADD CONSTRAINT [FK_AttributeFieldMatrixForHz_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldMatrixForHz] ADD CONSTRAINT [FK_AttributeFieldMatrixForHz_Matrix] FOREIGN KEY ([MatrixId]) REFERENCES [dbo].[Matrix] ([Id])
GO
