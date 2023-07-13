CREATE TABLE [dbo].[DeteriorationParameters]
(
[NBI_Group] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Structure_Def] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NBI_Climate] [numeric] (38, 0) NOT NULL,
[StartValue] [numeric] (38, 0) NOT NULL,
[StartYear] [numeric] (38, 0) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeteriorationParameters] ADD CONSTRAINT [PK_DeteriorationParameters] PRIMARY KEY NONCLUSTERED ([NBI_Group], [Structure_Def], [NBI_Climate], [StartValue]) ON [PRIMARY]
GO
