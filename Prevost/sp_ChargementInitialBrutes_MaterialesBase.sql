
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table MaterialesBase
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialesBase]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_MaterialesBase]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_MaterialesBase];

SELECT   [MakerId]
		,[RowId]
		,[ReferenciaBase]
		,[Descripcion]
		,[TipoCalculo]
		,[Nivel1]
		,[Nivel2]
		,[Nivel3]
		,[Nivel4]
		,[Nivel5]
		,[Esquema]
		,[CodigoProveedor]
		,[NoIncluirEnHojaDeTrabajo]
		,[NoOptimizar]
		,[NoIncluirEnMaterialNeeds]
		,[OrdenPrecioKg]
		,[SustituirPor]
		,[IdGrupoPresupuestado]
		,[IdGrupoProduccion]
		,[DesAuto]
		,[OrdenDesAuto]
		,[DesProd]
		,[OrdenDesProd]
		,[DXF]
		,[Familia]
		,[Clase]
		,[OrdenOptimizacion]
		,[Jpeg]
		,[Valorador]
		,[RawMaterial]
		,[FromRawMaterial]
		,[XMLDxf]
		,[XamlSilverlight]
		,[IsFrameFitting]
		,[Role]
		,[System]
		,[WorkPlace]
		,[ConditionalWorkPlace]
		,[StockInWorkPlace]
		,[CustomTariffCalculation]
		,[DoNotShowInMonitors]
		,[DoNotShowInTree]
		,[Area]
		,[InnerColorPerimeter]
		,[OuterColorPerimeter]
		,[InsertionPointX]
		,[InsertionPointY]
		,[ShowIn3D]
		,[Alias]
		,[ShowIn2DInner]
		,[ShowIn2DOuter]
		,[MaterialSide]
		,[IsDummy]
		,[IsTransparent]
		,[VfoAlias]
		,[ColorControl]
		,[UnMountable]
		,[MountedDefaultState]
		,[PriceDocGroupCode]
		,[PriceDocGroupText]
		,[PriceDocGroupSortOrderText]
		,[Remarks]
		,[PackedBaseReference]
		,[PackedQuantity]
		,[PackedUnitsType]
		,[PriceBookLevel]
		,[Id]
		,[PrefShopStatus]
		,[DontIncludeInMaterialReport]
		,[CommodityCode]
		,[IntrastatQuantityUnits]
		,[SimplifiedPolyline]
		,GETDATE()						AS DateCreation
		,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_MaterialesBase]
	FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesBase]

	SET @version			= 1
	SET @Nom				= 'Brute_MaterialesBase'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesBase])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


