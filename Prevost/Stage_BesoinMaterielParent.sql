CREATE TABLE [dbo].[Stage_BesoinMaterielParent](
	[Numero] [int] NULL,
	[Version] [int] NULL,
	[Ensemble Production] [int] NULL,
	[Code Besoin Production] [int] NULL,
	[MNSet] [smallint] NOT NULL,
	[Date de calcul] [date] NOT NULL,
	[Obsolete] [smallint] NULL,
	[Description] [nvarchar](50) NULL,
	[TypeMNSet] [smallint] NOT NULL,
	[Date de calcul UTC] [date] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO


