
CREATE TABLE [dbo].[Stage_Projet](
	[Numero] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Numero Commande] [nvarchar](50) NULL,
	[Date de Demande] [date] NULL,
	[Type] [smallint] NOT NULL,
	[Projet] [nvarchar](60) NOT NULL,
	[SubType] [smallint] NOT NULL,
	[NumerationId] [int] NULL,
	[Reference] [nvarchar](50) NOT NULL,
	[Code Utilisateur] [int] NULL,
	[Nom Client] [nvarchar](20) NULL,
	[Nom Utilisateur] [nvarchar](100) NULL,
	[Date de Confirmation] [date] NOT NULL,
	[Confirmation] [smallint] NOT NULL,
	[Pret Production] [date] NULL,
	[Active] [smallint] NOT NULL,
	[Nom de version] [nvarchar](50) NOT NULL,
	[Numero Sous-Comm.] [int] NOT NULL,
	[Copie de version] [int] NULL,
	[Code Client] [int] NULL,
	[Nom] [nvarchar](160) NULL,
	[Date d'acceptation] [date] NOT NULL,
	[Date de decoupe] [date] NOT NULL,
	[Date compte] [date] NOT NULL,
	[Date de livraison] [date] NULL,
	[Langue] [int] NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Information] [nvarchar](50) NOT NULL,
	[Date Modif. Syst.] [date] NULL,
	[Etat de production] [int] NOT NULL,
	[Date de planif.] [date] NOT NULL,
	[Date de creation] [datetime] NULL,
	[Date de Modif.] [datetime] NULL
) ON [PRIMARY]
GO


