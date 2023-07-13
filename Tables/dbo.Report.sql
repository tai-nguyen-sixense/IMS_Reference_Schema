CREATE TABLE [dbo].[Report]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[InspectionTypeId] [uniqueidentifier] NULL,
[AssetTypeId] [uniqueidentifier] NULL,
[DisplaysTeamLogo] [bit] NOT NULL,
[AddPageNumbering] [bit] NOT NULL,
[Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileNameFormat] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FlagTypeId] [uniqueidentifier] NULL,
[IsMain] [bit] NOT NULL CONSTRAINT [DF_Report_IsMain] DEFAULT ((0)),
[canBeMassExported] [bit] NULL,
[GenerateUniqueDefect] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report] ADD CONSTRAINT [PK_Report_1] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report] ADD CONSTRAINT [FK_Report_AssetType] FOREIGN KEY ([AssetTypeId]) REFERENCES [dbo].[AssetType] ([Id])
GO
ALTER TABLE [dbo].[Report] ADD CONSTRAINT [FK_Report_InspectionType] FOREIGN KEY ([InspectionTypeId]) REFERENCES [dbo].[InspectionType] ([Id])
GO
ALTER TABLE [dbo].[Report] ADD CONSTRAINT [FK__Report__FlagType__06D7F1EF] FOREIGN KEY ([FlagTypeId]) REFERENCES [dbo].[FlagType] ([Id])
GO
