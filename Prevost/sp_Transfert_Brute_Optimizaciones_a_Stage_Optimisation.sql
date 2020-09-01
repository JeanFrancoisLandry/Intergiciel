
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_Optimizaciones] contenant les données d'optimization d'une tâche
--				dans une table transformée appelée Stage_Optimisation.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_Optimizaciones_a_Stage_Optimisation]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_Optimisation]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_Optimisation];


	SELECT [DocumentId]
		,ABS([Numero])													AS [NumeroOptimization]
		--,[Reference]			
		--,[Dirty]		
		,ISNULL(CONVERT(DATE, [FechaAlta]), '1754-01-01')				AS [Date de fin]
		,[UsarTramos]													AS [Sections Utilisees]
		,[Descripcion]		COLLATE SQL_Latin1_General_CP1_CI_AS		AS [Description]
	    ,ISNULL(CONVERT(DATE, [FechaEntradaTaller]), '1754-01-01')		AS [Date de Debut Atelier]										
		,ISNULL(CONVERT(DATE, [FechaSalidaTaller]), '1754-01-01')		AS [Date de Fin Atelier]
		,[Semana]														AS [Semaine]
		,[ListaProduccion]												AS [Liste de Production]
		,[Tipo]				COLLATE SQL_Latin1_General_CP1_CI_AS		AS [Type]
		,[Owner]														AS [Responsable]
		,ISNULL(CONVERT(DATE, [StockUpdateDate]), '1754-01-01')			AS [Date MAJ stock]
		,ISNULL(CONVERT(DATE, [CalculationDate]), '1754-01-01')			AS [Date du calcul]
		,ISNULL(CONVERT(DATE, [MaterialNeedsDate]), '1754-01-01')		AS [Date besoin materiel]									
		,[OptimizationLevel]											AS [Niveau Optimization]
		,[DontUseWasteInterval]
		,[DontForceMaxRodsAllowed]										AS [Non-Forcer Tige Max.]
		,[FirstLongerPieces]											AS [Longue Piece 1]
		,[FirstRodsFromFirstWindows]									AS [Tige 1 Fenetre 1]
		,[SlotType]														AS [Type fente]
		,[WarehouseCode]												AS [Code entrepot]
		--,[ProductionLotXML]
		--,[IntermediateProductionLotXML]
		,ISNULL(CONVERT(DATE, [ScheduledDate]), '1754-01-01')			AS [Date Planifiee]
		,[ScheduledWeek]												AS [Semaine Planifiee]
		,ISNULL(CONVERT(DATE, [RealMaterialNeedsDate]), '1754-01-01')	AS [Date reel besoin materiel]								
		,ISNULL(CONVERT(DATE, [RealCalculationDate]), '1754-01-01')		AS [Date de calcul reel]
		,ISNULL(CONVERT(DATE, [RealStockUpdateDate]), '1754-01-01')		AS [Date Reel MAJ Materiel]
		,ISNULL(CONVERT(DATE, [RealShopEntryDate]), '1754-01-01')		AS [Date Reel Debut Achat]
		,ISNULL(CONVERT(DATE, [RealShopExitDate]), '1754-01-01')		AS [Date Reel Fin Achat]
		,[MaterialDiscounted]											AS [Rabais Materiel]						
		--,[XMLPieces]
		--,[XMLSquares]
		--,[XMLGlasses]
		,[DetailedBy]													AS [Detaillee par]
		,[MultipleRodsMode]												AS [Mode Tige Multiple]
		,ISNULL(CONVERT(DATE, [RealCalculationUTCDate]), '1754-01-01')	AS [Date de calcul reel UTC]
		,ISNULL([InUse], SPACE(0))										AS [En utilisation]
		,CONVERT(DATETIME, [DateCreation])								AS [Date de creation]
		,CONVERT(DATETIME, [DateModification])							AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_Optimisation] 
	FROM [Prevost].[dbo].[Brute_Optimizaciones]

	SET @version			= 1
	SET @Nom				= 'Stage_Optimisation'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_Optimizaciones])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

