
CREATE TABLE [dbo].[Stage_MainOeuvreProjet](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[IdSousModele] [smallint] NOT NULL,
	[PosteTravail] [nchar](30) NOT NULL,
	[Secondes] [real] NOT NULL,
	[IdMainOeuvre] [int] NOT NULL,
	[CodeTypeProduit] [int] NULL,
	[InstanceClasseTraitement] [smallint] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO

