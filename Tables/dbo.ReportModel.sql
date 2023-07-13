CREATE TABLE [dbo].[ReportModel]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FilePath] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsGeneral] [bit] NOT NULL,
[IsActive] [bit] NOT NULL,
[RequiresPhotoRenumbering] [bit] NOT NULL,
[IncludeAttachedDocuments] [bit] NOT NULL,
[PhotoRenumberingOrder0] [int] NULL,
[PhotoRenumberingOrder1] [int] NULL,
[PhotoRenumberingOrder2] [int] NULL,
[PhotoRenumberingOrder3] [int] NULL,
[PhotoRenumberingOrder4] [int] NULL,
[PhotoRenumberingOrder5] [int] NULL,
[PhotoRenumberingOrder6] [int] NULL,
[PhotoRenumberingOrder7] [int] NULL,
[PhotoRenumberingOrder8] [int] NULL,
[PhotoRenumberingOrder9] [int] NULL,
[FileNameFormat] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsMain] [bit] NOT NULL CONSTRAINT [DF_ReportModel_IsMain] DEFAULT ((0)),
[canBeMassExported] [bit] NULL,
[IsAvailableForReportGraph] [bit] NOT NULL CONSTRAINT [DF__ReportMod__IsAva__3EE740E8] DEFAULT ((0)),
[GenerateUniqueDefect] [bit] NULL,
[BypassGenerateDrawings] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportModel] ADD CONSTRAINT [PK_Report] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
