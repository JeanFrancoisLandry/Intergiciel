
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_MaterialNeeds] contenant les données des besoins matériels d'une tâche
--				dans une table transformée appelée Stage_BesoinMateriel.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_MaterialNeeds_a_Stage_BesoinMateriel]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_BesoinMateriel]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_BesoinMateriel];

SELECT  [GUID]
		,ABS([Number])																AS [Numero]
		,ABS([Version])																AS [Version]
		,ABS([ProductionSet])														AS [Ensemble Production]
		,ABS([ReproductionNeedsCode])												AS [Code BesoinProduction]
		,[MNSet]
		,[Position]
		,[SquareId]																	AS [IdCarre]
		,[HoleId]																	AS [IdTrou]
		,[ElementId]					COLLATE SQL_Latin1_General_CP1_CI_AS		AS [IdElement]
		,[MaterialType]																AS [TypeMateriel]
		,[Complex]																	AS [Complexe]
		,[Reference]					COLLATE SQL_Latin1_General_CP1_CI_AS		AS [Reference]	
		,[ColorConfiguration]														AS [ConfigurationCouleur]
		,[RawMaterialColorConfiguration]											AS [ConfigurationCouleur MaterialBrut]
		,ISNULL([RawReference], SPACE(0))	COLLATE SQL_Latin1_General_CP1_CI_AS	AS [ReferenceBrut]
		,[Quantity]																	AS [Qte]
		,[Length]																	AS [Longueur]
		,[Height]																	AS [Hauteur]
		,[Volume]																	
		,[ProviderCode]																AS [Code de Fournisseur]
		,[WarehouseCode]															AS [Code Entrepot]
		,[AllowToOrder]																AS [AutoriserACommander]
		,[QuantityToOrder]															AS [QteACommander]
		,[QuantityToDiscount]														AS [QteAEscompter]
		,[DiscountedQuantity]														AS [QteEscompter]
		,[ReservedQuantity]															AS [QteReservee]
		,[IsCopy]																	AS [EstCopie]
		,[FromNumber]																AS [CopieDuNumero]
		,[FromVersion]																AS [CopieDeVersion]
		,[TargetLevel]																AS [NiveauCible]
		,[Unmounted]																AS [NonAssemble]
		,[ProductTypeCode]															AS [CodeTypeProduit]
		,[CustomLengthType]															AS [TypeLongueurPerso]
		,[DeltaQuantity]															AS [DeltaQte]
		,[OrderComponents]															AS [ComposantCommander]
		,[Weight]																	As [Poids]
		,CONVERT(DATETIME, [DateCreation])											AS [Date de creation]
		,CONVERT(DATETIME, [DateModification])										AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_BesoinMateriel] 
	FROM [Prevost].[dbo].[Brute_MaterialNeeds]

	SET @version			= 1
	SET @Nom				= 'Stage_BesoinMateriel'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brut_MaterialNeeds])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


