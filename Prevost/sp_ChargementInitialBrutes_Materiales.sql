
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table Materiales
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_Materiales]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_Materiales]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_Materiales];

	SELECT 
       [RowId]
      ,[ReferenciaBase]
      ,[Referencia]
      ,[Color]
      --,[Updating]
      --,[PrecioCompraPonderado]
      --,[AveragePriceDate]
      --,[P1]
      --,[P2]
      --,[P3]
      --,[P4]
      --,[P5]
      --,[P6]
      --,[DesAuto]
      --,[DesProd]
      ,[Almacen]
      ,[UE1]
      ,[UE2]
      ,[ControlDeStock]
      --,[CodigoEAN13]
      --,[PedirBajoDemanda]
      --,[MRPControl]
      --,[Slot1]
      --,[Slot2]
      --,[Slot3]
      --,[DivisaPrecioCompraPonderado]
      --,[DescontarAutomaticamente]
      ,[ManageRemnants]
      ,[LongitudBarra]
      ,[WastageAllowance]
      ,[UseWastageAllowanceInMN]
      ,[UseFullRodsInMN]
      ,[IsModel]
      --,[ModelCode]
      ,[TargetLevel]
      ,[PrefShopStatus]
      ,[DefaultValue]
      --,[MaterialSupplierCode]
      --,[ProductionPreparationTime]
      --,[ProductionExtraTime]
      --,[ProductionExtraTimePosition]
      --,[AverageDeliveryTime]
      --,[IsCustomAvgDeliveryTime]
		,GETDATE()						AS DateCreation
		,GETDATE()						AS DateModification
		--INTO [Prevost].[dbo].[Brute_Materiales]
	FROM [PREFDB].[ADP_Prod].[dbo].[Materiales]

	SET @version			= 1
	SET @Nom				= 'Brute_Materiales'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[Materiales])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


