CREATE TABLE [dbo].[Stage_LotMiseEnProductionProjet](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[Instance] [smallint] NOT NULL,
	[SousModele] [smallint] NOT NULL,
	[Lot] [int] NULL,
	[Ensemble] [int] NULL,
	[PositionEnsemble] [int] NOT NULL,
	[DateEntreeAchat] [datetime] NULL,
	[DateSortieAchat] [datetime] NULL,
	[DateExpedition] [datetime] NULL,
	[DateLivraison] [datetime] NULL,
 CONSTRAINT [PK_Stage_LotMiseEnProductionProjet] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC,
	[Version] ASC,
	[Ordre] ASC,
	[Instance] ASC,
	[SousModele] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
