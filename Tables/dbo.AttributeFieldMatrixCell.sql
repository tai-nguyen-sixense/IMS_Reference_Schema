CREATE TABLE [dbo].[AttributeFieldMatrixCell]
(
[Id] [uniqueidentifier] NOT NULL,
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IndexXValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndexXValueNumericFrom] [float] NULL,
[IndexXValueNumericTo] [float] NULL,
[IndexYValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndexYValueNumericFrom] [float] NULL,
[IndexYValueNumericTo] [float] NULL,
[IndexZValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndexZValueNumericFrom] [float] NULL,
[IndexZValueNumericTo] [float] NULL,
[MatrixId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrixCell] ADD CONSTRAINT [PK_AttributeFieldMatrixCell_1] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrixCell] ADD CONSTRAINT [FK_AttributeFieldMatrixCell_AttributeFieldMatrix] FOREIGN KEY ([AttributeFieldId], [MatrixId]) REFERENCES [dbo].[AttributeFieldMatrix] ([AttributeFieldId], [MatrixId])
GO
