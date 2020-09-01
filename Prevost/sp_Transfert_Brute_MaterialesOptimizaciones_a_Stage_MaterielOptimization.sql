
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [Brute_MaterialesOptimizaciones] contenant l'optimization matériels pour les projets 
--				dans une table transformée appelée Stage_MaterielOptimization.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_MaterialesOptimizaciones_a_Stage_MaterielOptimization]


AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_MaterielOptimization]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_MaterielOptimization];

	SELECT	 [id]
			,[Numero]																		 AS [NumeroOptimization]
			,[Presupuesto]																	 AS [Numero]
			,[Version]																		 
			,[Orden]																		 AS [Ordre]
			,[SubModel]																		 AS [Sous-Modele]
			,[Referencia]								COLLATE SQL_Latin1_General_CP1_CI_AS AS [Reference]
			,[ColorConfiguration]															 AS [Config. Couleur]
			,[CantidadPorVentana]															 AS [Quantité par fenêtre]
			,[Cantidad]																		 AS [Quantité]
			,[Longitud]																		 AS [Longueur]
			,[Altura]																		 AS [Hauteur]
			,[AnguloCorteA]																	 AS [AngleCoupeA]										
			,[AnguloCorteB]																	 AS [AngleCoupeB]
			,[Complejo]																		 AS [Complexe]
			,[idMaterial]																	 AS [IdMateriel]
			,[idCuadro]																		 AS [IdPeinture]
			,[angulo]																		 AS [Angle]
			,[EsCuadro]																		 AS [Peinture]	
			,[Composite]																	 AS [Composite]
			,[Component]																	 AS [Composante]
			,[GlassNumber]																	 AS [NoVerre]
			,[Unmounted]																	 AS [Demonte]
			,[idCuadroPadre]																 AS [IdEtalonPeinture]
			,ISNULL([WorkPlace], 0)															 AS [Lieu de travail]
			,ISNULL([OriginalReference], SPACE(0))		COLLATE SQL_Latin1_General_CP1_CI_AS AS [Ref. Original]
			,[Weight]																		 AS [Poid]
			,[ModelSide]																	 AS [Cote Modele]
			,CONVERT(DATETIME, [DateCreation])												 AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])											 AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_MaterielOptimization]
	FROM [Prevost].[dbo].[Brute_MaterialesOptimizaciones]

	SET @version			= 1
	SET @Nom				= 'Stage_MaterielOptimization'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_MaterialesOptimizaciones])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


