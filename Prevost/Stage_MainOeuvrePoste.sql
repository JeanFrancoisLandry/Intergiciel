CREATE TABLE [dbo].[Stage_MainOeuvrePoste](
	[RowId] [uniqueidentifier] NOT NULL,
	[PosteTravail] [nchar](30) NOT NULL,
	[CodePosteTravail] [int] IDENTITY(1,1) NOT NULL,
	[Operateur] [int] NULL,
	[Zone] [int] NULL,
	[IdGroupeBudget] [smallint] NULL,
	[Cout] [float] NULL,
	[EstTacheOuvrier] [smallint] NOT NULL,
	[Variable] [smallint] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL
) ON [PRIMARY]
GO
