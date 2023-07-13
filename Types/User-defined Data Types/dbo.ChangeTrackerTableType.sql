CREATE TYPE [dbo].[ChangeTrackerTableType] AS TABLE
(
[ObjectId] [uniqueidentifier] NULL,
[ObjectType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColumnName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OldValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ObjStatus] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModified] [smalldatetime] NULL,
[UserId] [uniqueidentifier] NULL
)
GO
