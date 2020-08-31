CREATE TABLE [dbo].[Stage_MainOeuvreOptimization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroOptimization] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[SousModele] [int] NOT NULL,
	[PosteTravail] [nchar](30) NOT NULL,
	[Secondes] [real] NOT NULL,
	[Quantite] [int] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO
