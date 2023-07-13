CREATE TABLE [dbo].[AttributeField]
(
[Id] [uniqueidentifier] NOT NULL,
[Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SqlType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SystemUnitId] [uniqueidentifier] NOT NULL,
[ColumnIndexInDatagrid] [numeric] (18, 0) NULL,
[MinNumericalValue] [float] NULL,
[MaxNumericalValue] [float] NULL,
[IsVisibleInFilter] [bit] NOT NULL,
[HelpContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalDBTable] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalDBField] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalFileTextPosition] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalFileTextLength] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsVisibleInPivot] [bit] NOT NULL,
[IsLccAttribute] [bit] NOT NULL,
[IsUsedForHz] [bit] NOT NULL,
[CalculationRule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NavigationUIDisplayMode] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetDataField] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumberOfDigits] [int] NULL,
[DefaultValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowButtonsInMobile] [bit] NOT NULL,
[NumberOfLines] [int] NULL,
[CalculationFormula] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsMandatory] [bit] NULL,
[EnableMultipleValues] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeField] ADD CONSTRAINT [PK_FlagAttribute] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttributeField] ADD CONSTRAINT [FK_AttributeField_SystemUnit] FOREIGN KEY ([SystemUnitId]) REFERENCES [dbo].[SystemUnit] ([Id])
GO
