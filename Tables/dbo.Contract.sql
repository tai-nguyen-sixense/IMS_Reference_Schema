CREATE TABLE [dbo].[Contract]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContractTypeId] [uniqueidentifier] NOT NULL,
[IsActive] [bit] NOT NULL,
[LastModified] [smalldatetime] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[AuthorId] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [date] NULL,
[AssigmentDate] [date] NULL,
[EndDate] [date] NULL,
[ActualConstructionCost] [money] NULL,
[EstimateConstructionCost] [money] NULL,
[ActualDuration] [int] NULL,
[PercentageCompleted] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract] ADD CONSTRAINT [PK_Contract] PRIMARY KEY NONCLUSTERED ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract] ADD CONSTRAINT [FK_Contract_ContractType] FOREIGN KEY ([ContractTypeId]) REFERENCES [dbo].[ContractType] ([Id])
GO
ALTER TABLE [dbo].[Contract] ADD CONSTRAINT [FK_Contract_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] ADD CONSTRAINT [FK_Contract_User1] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[User] ([Id])
GO
