CREATE TABLE [dbo].[AttributeFieldMatrix]
(
[AttributeFieldId] [uniqueidentifier] NOT NULL,
[IndexXId] [uniqueidentifier] NOT NULL,
[IndexXCalculationRule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndexYId] [uniqueidentifier] NULL,
[IndexYCalculationRule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndexZId] [uniqueidentifier] NULL,
[IndexZCalculationRule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MatrixId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [PK_AttributeFieldMatrix] PRIMARY KEY NONCLUSTERED ([AttributeFieldId], [MatrixId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [FK_AttributeFieldMatrix_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [FK_AttributeFieldMatrix_AttributeField_X] FOREIGN KEY ([IndexXId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [FK_AttributeFieldMatrix_AttributeField_Y] FOREIGN KEY ([IndexYId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [FK_AttributeFieldMatrix_AttributeField_Z] FOREIGN KEY ([IndexZId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
ALTER TABLE [dbo].[AttributeFieldMatrix] ADD CONSTRAINT [FK_AttributeFieldMatrix_Matrix] FOREIGN KEY ([MatrixId]) REFERENCES [dbo].[Matrix] ([Id])
GO
