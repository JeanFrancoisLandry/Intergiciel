
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table MaterialNeeds
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialNeeds]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brut_MaterialNeeds]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brut_MaterialNeeds];

SELECT   [GUID]
		,[Number]
		,[Version]
		,[ProductionSet]
		,[ReproductionNeedsCode]
		,[MNSet]
		,[Position]
		,[SquareId]
		,[HoleId]
		,[ElementId]
		,[MaterialType]
		,[Complex]
		,[Reference]
		,[ColorConfiguration]
		,[RawMaterialColorConfiguration]
		,[RawReference]
		,[Quantity]
		,[Length]
		,[Height]
		,[Volume]
		,[ProviderCode]
		,[WarehouseCode]
		,[XMLDoc]
		,[AllowToOrder]
		,[QuantityToOrder]
		,[QuantityToDiscount]
		,[DiscountedQuantity]
		,[ReservedQuantity]
		,[IsCopy]
		,[FromNumber]
		,[FromVersion]
		,[TargetLevel]
		,[Unmounted]
		,[ProductTypeCode]
		,[CustomLengthType]
		,[DeltaQuantity]
		,[OrderComponents]
		,[Weight]
		,GETDATE()						AS DateCreation
		,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brut_MaterialNeeds]
	FROM [PREFDB].[ADP_Prod].[dbo].[MaterialNeeds]

	SET @version			= 1
	SET @Nom				= 'Brut_MaterialNeeds'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialNeeds])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


