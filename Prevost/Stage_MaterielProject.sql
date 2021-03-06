﻿CREATE TABLE [dbo].[Stage_MaterielProject](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Ordre] [smallint] NOT NULL,
	[Reference] [nchar](25) NOT NULL,
	[Configuration Couleur] [int] NOT NULL,
	[Quantite] [int] NOT NULL,
	[Longueur] [decimal](19, 6) NOT NULL,
	[Hauteur] [decimal](19, 6) NOT NULL,
	[AngleCoupeA] [decimal](19, 6) NOT NULL,
	[AngleCoupeB] [decimal](19, 6) NOT NULL,
	[Complexe] [smallint] NOT NULL,
	[IdMateriel] [int] NOT NULL,
	[IdPeinture] [int] NOT NULL,
	[Angle] [smallint] NOT NULL,
	[Peinture] [smallint] NOT NULL,
	[Composite] [smallint] NOT NULL,
	[Composante] [smallint] NOT NULL,
	[NoVerre] [int] NOT NULL,
	[Demonte] [smallint] NOT NULL,
	[IdEtalonPeinture] [smallint] NOT NULL,
	[IdSousModele] [smallint] NOT NULL,
	[Param] [ntext] NULL,
	[ConfigurationCouleurMaterielBrut] [int] NOT NULL,
	[Poid] [decimal](19, 6) NOT NULL,
	[CodeTypeProduit] [int] NULL,
	[InstanceClasseTraitement] [smallint] NOT NULL,
	[CoteModel] [smallint] NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]