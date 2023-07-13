CREATE TABLE [dbo].[InspectionSummary]
(
[Id] [uniqueidentifier] NOT NULL,
[SummaryTypeId] [uniqueidentifier] NOT NULL,
[InspectionId] [uniqueidentifier] NOT NULL,
[Body] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [uniqueidentifier] NULL,
[LastModified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSummary] ADD CONSTRAINT [PK_InspectionSummary] PRIMARY KEY NONCLUSTERED ([Id], [SummaryTypeId], [InspectionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionSummary] ADD CONSTRAINT [FK_InspectionSummary_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[InspectionSummary] ADD CONSTRAINT [FK_InspectionSummary_SummaryType] FOREIGN KEY ([SummaryTypeId]) REFERENCES [dbo].[SummaryType] ([Id])
GO
