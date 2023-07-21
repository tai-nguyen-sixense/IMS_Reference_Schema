CREATE TYPE [dbo].[AssetComponentCheckBefore] AS TABLE
(
[AssetId] [uniqueidentifier] NOT NULL,
[Id] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL
)
GO
