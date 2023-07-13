CREATE TABLE [dbo].[InspectionType_SummaryType]
(
[InspectionTypeId] [uniqueidentifier] NOT NULL,
[SummaryTypeId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL,
[LastModified] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_SummaryType] ADD CONSTRAINT [PK_InspectionType_SummaryType] PRIMARY KEY NONCLUSTERED ([InspectionTypeId], [SummaryTypeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InspectionType_SummaryType] ADD CONSTRAINT [FK_InspectionType_SummaryType_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
ALTER TABLE [dbo].[InspectionType_SummaryType] ADD CONSTRAINT [FK_InspectionType_SummaryType_SummaryType] FOREIGN KEY ([SummaryTypeId]) REFERENCES [dbo].[SummaryType] ([Id])
GO
