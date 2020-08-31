﻿
CREATE TABLE [dbo].[Stage_BesoinMateriel](
	[GUID] [uniqueidentifier] NOT NULL,
	[Numero] [int] NULL,
	[Version] [int] NULL,
	[Ensemble Production] [int] NULL,
	[Code BesoinProduction] [int] NULL,
	[MNSet] [smallint] NOT NULL,
	[Position] [int] NOT NULL,
	[IdCarre] [int] NOT NULL,
	[IdTrou] [int] NOT NULL,
	[IdElement] [nvarchar](10) NOT NULL,
	[TypeMateriel] [smallint] NOT NULL,
	[Complexe] [smallint] NOT NULL,
	[Reference] [nchar](25) NOT NULL,
	[ConfigurationCouleur] [int] NOT NULL,
	[ConfigurationCouleur MaterialBrut] [int] NOT NULL,
	[ReferenceBrut] [nchar](25) NOT NULL,
	[Qte] [float] NOT NULL,
	[Longueur] [real] NOT NULL,
	[Hauteur] [real] NOT NULL,
	[Volume] [real] NOT NULL,
	[Code de Fournisseur] [int] NOT NULL,
	[Code Entrepot] [smallint] NOT NULL,
	[AutoriserACommander] [smallint] NOT NULL,
	[QteACommander] [float] NOT NULL,
	[QteAEscompter] [float] NOT NULL,
	[QteEscompter] [float] NOT NULL,
	[QteReservee] [float] NOT NULL,
	[EstCopie] [smallint] NOT NULL,
	[CopieDuNumero] [int] NOT NULL,
	[CopieDeVersion] [int] NOT NULL,
	[NiveauCible] [int] NOT NULL,
	[NonAssemble] [smallint] NOT NULL,
	[CodeTypeProduit] [int] NOT NULL,
	[TypeLongueurPerso] [smallint] NOT NULL,
	[DeltaQte] [float] NOT NULL,
	[ComposantCommander] [smallint] NOT NULL,
	[Poids] [float] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO


