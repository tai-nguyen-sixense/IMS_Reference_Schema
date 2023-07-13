CREATE TABLE [dbo].[ItineraryStatus]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Icon] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [int] NOT NULL,
[IsAnActiveStatus] [bit] NOT NULL,
[IsRetired] [bit] NOT NULL,
[IsReadOnly] [bit] NOT NULL CONSTRAINT [DF_ItineraryStatus_IsReadOnly] DEFAULT ((0)),
[StatusChangeWarningMessage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItineraryStatus] ADD CONSTRAINT [PK_ItineraryStatus] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
