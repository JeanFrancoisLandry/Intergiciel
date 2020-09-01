
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table Optimizaciones
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_Optimizaciones]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_Optimizaciones]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_Optimizaciones];

	SELECT [DocumentId]
			,[Numero]
			,[Reference]
			,[Dirty]
			,[FechaAlta]
			,[UsarTramos]
			,[Descripcion]
			,[FechaEntradaTaller]
			,[FechaSalidaTaller]
			,[Semana]
			,[ListaProduccion]
			,[Tipo]
			,[Owner]
			,[StockUpdateDate]
			,[CalculationDate]
			,[MaterialNeedsDate]
			,[OptimizationLevel]
			,[DontUseWasteInterval]
			,[DontForceMaxRodsAllowed]
			,[FirstLongerPieces]
			,[FirstRodsFromFirstWindows]
			,[SlotType]
			,[WarehouseCode]
			,[ProductionLotXML]
			,[IntermediateProductionLotXML]
			,[ScheduledDate]
			,[ScheduledWeek]
			,[RealMaterialNeedsDate]
			,[RealCalculationDate]
			,[RealStockUpdateDate]
			,[RealShopEntryDate]
			,[RealShopExitDate]
			,[MaterialDiscounted]
			,[XMLPieces]
			,[XMLSquares]
			,[XMLGlasses]
			,[DetailedBy]
			,[MultipleRodsMode]
			,[RealCalculationUTCDate]
			,[InUse]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_Optimizaciones]
	FROM [PREFDB].[ADP_Prod].[dbo].[Optimizaciones]

	SET @version			= 1
	SET @Nom				= 'Brute_Optimizaciones'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[Optimizaciones])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


