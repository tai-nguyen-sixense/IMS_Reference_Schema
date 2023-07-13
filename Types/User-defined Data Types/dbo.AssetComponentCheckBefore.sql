CREATE TYPE [dbo].[AssetComponentCheckBefore] AS TABLE
(
[Id] [uniqueidentifier] NOT NULL,
[FatherId] [uniqueidentifier] NULL,
[ComponentTypeId] [uniqueidentifier] NOT NULL,
[Position] [int] NOT NULL
)
GO
