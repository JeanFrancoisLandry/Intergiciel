
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table Brute_ContenidoPAF dans une table transformée appelée Stage_DetailProject.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_ContenidoPAF_a_Stage_DetailProject]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_DetailProject]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_DetailProject];

SELECT [Numero]
      ,[Version]
      ,[Orden]																				 AS [Ordre]
      ,[SortOrder]																			 AS [SortOrdre]
      ,[Tipo]											COLLATE SQL_Latin1_General_CP1_CI_AS AS [Type]
      ,ISNULL([SubType], 0)																	 AS [Sous-Type]
      ,ISNULL([Nomenclatura], SPACE(0))					COLLATE SQL_Latin1_General_CP1_CI_AS AS [Nomenclature]
      ,ISNULL([Concepto], SPACE(0))						COLLATE SQL_Latin1_General_CP1_CI_AS AS [Concept]
      ,ISNULL([Descripcion], SPACE(0))					COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description]
      ,[Cantidad]																			 AS [Quantité]	
      ,[CosteUnitario]																		 AS [Cout Unitaire]
      ,[PrecioUnitario]																		 AS [Prix Unitaire]
      ,[ManufacturerPrice]																	 AS [Prix Manufacture]
      ,[ResellerPrice]																		 AS [Prix Revente]
      ,[Importe]																			 AS [Montant]
      ,[Beneficio]																			 AS [Benefice]
      ,[Color]											COLLATE SQL_Latin1_General_CP1_CI_AS AS [Couleur]
      ,[Medidas]										COLLATE SQL_Latin1_General_CP1_CI_AS AS [Mesures]
      ,[AltoDibujo]																			 AS [Hauteur Dessin]
      ,[AnchoDibujo]																		 AS [Largeur Dessin]
      ,[FactorEscala]																		 AS [Facteur echelle]
      ,[AltoCotas]																			 AS [Hauteur Dimension]
      ,[Ventana]																			 AS [Fenetre]
      ,[MOVentana]																			 AS [MO Fenetre]
      ,[CosteVentana]																		 AS [Cout Fenetre]
      ,[CosteMOVentana]																		 AS [Cout MO Fenetre]
      ,[VentanaReal]																		 AS [Cout Reel Fenetre]
      ,[MOVentanaReal]																		 AS [Cout MO Reel Fenetre]
      ,[BOMCostPriceGroup1]																	 AS [Cout BOM Prix Groupe1]
      ,[BOMCostLPriceGroup1]																 AS [Cout BOM LPrix Groupe]
      ,[Texto]											COLLATE SQL_Latin1_General_CP1_CI_AS AS [Texte]
      ,[ProdType]																			 AS [Type Prod.]
      ,[numMarcos]																			 AS [Type de Cadre]
      ,[numHojas]																			 AS [Nombre de Feuille]
      ,[numPostes]																			 AS [Nombre de Poteau]
      ,ISNULL([System], SPACE(0))						COLLATE SQL_Latin1_General_CP1_CI_AS AS [System]
      ,[ProductType]									
      ,CONVERT(date, [MaterialesPAFUTCModificationTime])									AS [Date modif. Materiel]
      ,CONVERT(date, [ManoObraPAFUTCModificationTime])										AS [Date modif. Main Oeuvre]
      ,CONVERT(date, [BackgroundUTCModificationTime])										AS [Date modif. Background]
      --,[DateCreation]
      --,[DateModification]
	INTO [Prevost].[dbo].[Stage_DetailProject]
	FROM [Prevost].[dbo].[Brute_ContenidoPAF]
	ORDER BY Numero DESC

	SET @version			= 1
	SET @Nom				= 'Stage_DetailProject'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_ContenidoPAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


