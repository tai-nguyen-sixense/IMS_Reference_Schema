CREATE TABLE [dbo].[BimData]
(
[Id] [uniqueidentifier] NOT NULL,
[ProjectId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BimData] ADD CONSTRAINT [PK_BimData] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
