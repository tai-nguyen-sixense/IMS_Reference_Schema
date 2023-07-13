CREATE TABLE [dbo].[InspectionFinalRatingGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Weight] [numeric] (18, 0) NULL,
[AttributeFieldId] [uniqueidentifier] NULL,
[CalculationRule] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IgnoredValues] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRatingGroup] ADD CONSTRAINT [PK_InspectionFinalRatingGroup] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionFinalRatingGroup] ADD CONSTRAINT [FK_InspectionFinalRatingGroup_AttributeField] FOREIGN KEY ([AttributeFieldId]) REFERENCES [dbo].[AttributeField] ([Id])
GO
