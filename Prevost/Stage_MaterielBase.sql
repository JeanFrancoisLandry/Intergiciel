﻿
CREATE TABLE [dbo].[Stage_MaterielBase](
	[IdLigne] [uniqueidentifier] NOT NULL,
	[ReferenceBase] [nchar](25) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TypeCalcul] [nchar](15) NULL,
	[Niveau1] [nvarchar](150) NOT NULL,
	[Niveau2] [nvarchar](150) NOT NULL,
	[Niveau3] [nvarchar](150) NOT NULL,
	[Niveau4] [nvarchar](150) NOT NULL,
	[Niveau5] [nvarchar](150) NOT NULL,
	[CodeFournisseur] [int] NULL,
	[NonIncluFeuilleTravail] [smallint] NULL,
	[NonOptimise] [smallint] NULL,
	[NonIncluBesoinMateriel] [smallint] NOT NULL,
	[PrixCommanderKg] [smallint] NULL,
	[RemplacePour] [nchar](25) NOT NULL,
	[IdGroupeBudget] [smallint] NULL,
	[IdGroupeProduction] [smallint] NULL,
	[Auto] [nvarchar](120) NOT NULL,
	[CommandeAuto] [smallint] NOT NULL,
	[Production] [nvarchar](120) NOT NULL,
	[CommandeProduction] [smallint] NOT NULL,
	[Famille] [nchar](25) NOT NULL,
	[Classe] [nchar](50) NOT NULL,
	[CommandeOptimisation] [smallint] NULL,
	[Evaluateur] [smallint] NULL,
	[EstMonterCadre] [smallint] NULL,
	[Role] [nchar](25) NULL,
	[PosteTravail] [smallint] NULL,
	[CommandeOptimal] [smallint] NOT NULL,
	[MaterielAuPosteTravail] [smallint] NULL,
	[CalculTarifDouane] [smallint] NOT NULL,
	[Secteur] [float] NULL,
	[CouleurPeriInterieur] [float] NULL,
	[CouleurPeriExterieur] [float] NULL,
	[PointX] [float] NULL,
	[Pointy] [float] NULL,
	[CoteMateriel] [smallint] NOT NULL,
	[CôteMateriel] [smallint] NOT NULL,
	[ColorControl] [smallint] NOT NULL,
	[Demonte] [smallint] NULL,
	[DefautMonter] [smallint] NULL,
	[QteEmballe] [float] NOT NULL,
	[TypeEmballeUnitaire] [smallint] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NonIncluRapportMateriel] [smallint] NULL,
	[Active] [int] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL
) ON [PRIMARY]
GO
