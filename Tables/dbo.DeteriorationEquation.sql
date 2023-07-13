CREATE TABLE [dbo].[DeteriorationEquation]
(
[NBI_Group] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Structure_Def] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NBI_Climate] [numeric] (38, 0) NOT NULL,
[Factor3] [float] NOT NULL,
[Factor2] [float] NOT NULL,
[Factor1] [float] NOT NULL,
[Factor0] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeteriorationEquation] ADD CONSTRAINT [PK_DeteriorationEquation] PRIMARY KEY NONCLUSTERED ([NBI_Group], [Structure_Def], [NBI_Climate]) ON [PRIMARY]
GO
