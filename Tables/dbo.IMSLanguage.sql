CREATE TABLE [dbo].[IMSLanguage]
(
[Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Language1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ForMobile] [bit] NOT NULL,
[Language3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IMSLanguage] ADD CONSTRAINT [PK_IMSLanguage] PRIMARY KEY NONCLUSTERED ([Code]) ON [PRIMARY]
GO
