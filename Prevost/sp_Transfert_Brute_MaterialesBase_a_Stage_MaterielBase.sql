
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [MaterialesBase] contenant le matériels pour les projets (soummision, commande, facture & bon de livraison)
--				dans une table transformée appelée materielBase.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_MaterialesBase_a_Stage_MaterielBase]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_MaterielBase]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_MaterielBase];

	SELECT 
			 [RowId]																	 AS [IdLigne]
			,[ReferenciaBase]						COLLATE SQL_Latin1_General_CP1_CI_AS AS [ReferenceBase]
			,[Descripcion]							COLLATE SQL_Latin1_General_CP1_CI_AS AS [Description]
			,[TipoCalculo]							COLLATE SQL_Latin1_General_CP1_CI_AS AS [TypeCalcul]	
			,ISNULL([Nivel1], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Niveau1]
			,ISNULL([Nivel2], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Niveau2]
			,ISNULL([Nivel3], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Niveau3]
			,ISNULL([Nivel4], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Niveau4]
			,ISNULL([Nivel5], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Niveau5]
			,[CodigoProveedor]															 AS [CodeFournisseur]
			,[NoIncluirEnHojaDeTrabajo]													 AS [NonIncluFeuilleTravail]
			,[NoOptimizar]																 AS [NonOptimise]
			,[NoIncluirEnMaterialNeeds]													 AS [NonIncluBesoinMateriel]
			,[OrdenPrecioKg]															 AS [PrixCommanderKg]
			,ISNULL([SustituirPor], SPACE(0))		COLLATE SQL_Latin1_General_CP1_CI_AS AS [RemplacePour]
			,[IdGrupoPresupuestado]														 AS [IdGroupeBudget]
			,[IdGrupoProduccion]														 AS [IdGroupeProduction]	
			,ISNULL([DesAuto], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Auto]			
			,ISNULL([OrdenDesAuto], SPACE(0))											 AS [CommandeAuto]
			,ISNULL([DesProd], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Production]
			,ISNULL([OrdenDesProd], SPACE(0))											 AS [CommandeProduction]	
			,ISNULL([Familia], SPACE(0))			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Famille]
			,ISNULL([Clase], SPACE(0))				COLLATE SQL_Latin1_General_CP1_CI_AS AS [Classe]
			,[OrdenOptimizacion]														 AS [CommandeOptimisation]
			,[Valorador]																 AS [Evaluateur]
			--,[RawMaterial]							AS [MaterielBrut]
			--,[FromRawMaterial]						AS [DeMaterielBrut]
			,[IsFrameFitting]															 AS [EstMonterCadre]
			,[Role]									COLLATE SQL_Latin1_General_CP1_CI_AS AS [Role]
			--,[System]
			,[WorkPlace]																 AS [PosteTravail]
			,ISNULL([OrdenOptimizacion], SPACE(0))										 AS [CommandeOptimal]
			,[StockInWorkPlace]															 AS [MaterielAuPosteTravail]
			,[CustomTariffCalculation]													 AS [CalculTarifDouane]
			--,[DoNotShowInMonitors]													 	
			--,[DoNotShowInTree]														 
			,[Area]																		 AS [Secteur]
			,[InnerColorPerimeter]														 AS [CouleurPeriInterieur]
			,[OuterColorPerimeter]														 AS [CouleurPeriExterieur]
			,[InsertionPointX]															 AS [PointX]
			,[InsertionPointY]															 AS [Pointy]
			,[MaterialSide]																 AS [CoteMateriel]
			--,[ColorControl]						
			--,[ShowIn3D]
			--,[Alias]
			--,[ShowIn2DInner]
			--,[ShowIn2DOuter]
			,[MaterialSide]																 AS [CôteMateriel]
			--,[IsDummy]
			--,[IsTransparent]
			--,[VfoAlias]
			,[ColorControl]
			,[UnMountable]																AS [Demonte]
			,[MountedDefaultState]														AS [DefautMonter]
			--,[PriceDocGroupCode]					
			--,[PriceDocGroupText]
			--,[PriceDocGroupSortOrderText]
			--,[Remarks]
			--,[PackedBaseReference]
			,[PackedQuantity]															AS [QteEmballe]
			,[PackedUnitsType]															AS [TypeEmballeUnitaire]
			--,[PriceBookLevel]	
			,[Id]	
			--,[PrefShopStatus]
			,[DontIncludeInMaterialReport]												AS [NonIncluRapportMateriel]	
			--,[CommodityCode]						AS [CodeMarchandise]
			--,[IntrastatQuantityUnits]
			--,[SimplifiedPolyline]
			,CONVERT(DATETIME, [DateCreation])		AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])	AS [Date de Modif]
	  INTO [Prevost].[dbo].[Stage_MaterielBase]
	  FROM [Prevost].[dbo].[Brute_MaterialesBase]

	SET @version			= 1
	SET @Nom				= 'Stage_MaterielBase'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_MaterialesBase])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

