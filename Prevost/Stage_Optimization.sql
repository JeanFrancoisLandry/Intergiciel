﻿CREATE TABLE [dbo].[Stage_Optimisation](
	[DocumentId] [uniqueidentifier] NOT NULL,
	[NumeroOptimization] [int] NULL,
	[Date de fin] [date] NOT NULL,
	[Sections Utilisees] [smallint] NULL,
	[Description] [nvarchar](60) NULL,
	[Date de Debut Atelier] [date] NOT NULL,
	[Date de Fin Atelier] [date] NOT NULL,
	[Semaine] [smallint] NULL,
	[Liste de Production] [smallint] NULL,
	[Type] [nchar](25) NULL,
	[Responsable] [int] NULL,
	[Date MAJ stock] [date] NOT NULL,
	[Date du calcul] [date] NOT NULL,
	[Date besoin materiel] [date] NOT NULL,
	[Niveau Optimization] [smallint] NOT NULL,
	[DontUseWasteInterval] [smallint] NOT NULL,
	[Non-Forcer Tige Max.] [smallint] NOT NULL,
	[Longue Piece 1] [smallint] NOT NULL,
	[Tige 1 Fenetre 1] [smallint] NOT NULL,
	[Type fente] [smallint] NOT NULL,
	[Code entrepot] [smallint] NULL,
	[Date Planifiee] [date] NOT NULL,
	[Semaine Planifiee] [smallint] NULL,
	[Date reel besoin materiel] [date] NOT NULL,
	[Date de calcul reel] [date] NOT NULL,
	[Date Reel MAJ Materiel] [date] NOT NULL,
	[Date Reel Debut Achat] [date] NOT NULL,
	[Date Reel Fin Achat] [date] NOT NULL,
	[Rabais Materiel] [smallint] NOT NULL,
	[Detaillee par] [smallint] NOT NULL,
	[Mode Tige Multiple] [smallint] NOT NULL,
	[Date de calcul reel UTC] [date] NOT NULL,
	[En utilisation] [smallint] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO


