


-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-12-17
-- Description:	Transfert de la table [Brute_MaterialesPAF] contenant le matériels pour les projets (soummision, commande, facture & bon de livraison)
--				dans une table transformée appelée aterielProject.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_MaterialesPAF_a_Stage_MaterielProject]


AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_MaterielProject]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_MaterielProject];

	SELECT [Numero]
		  ,[Version]
		  ,[Orden]															 AS [Ordre]
		  ,[Referencia]					COLLATE SQL_Latin1_General_CP1_CI_AS AS [Reference]
		  ,[ColorConfiguration]												 AS [Configuration Couleur]
		  ,[Cantidad]														 AS [Quantite]
		  ,[Longitud]														 AS [Longueur]
		  ,[Altura]															 AS [Hauteur]
		  ,[AnguloCorteA]													 AS [AngleCoupeA]										
		  ,[AnguloCorteB]													 AS [AngleCoupeB]
		  ,[Complejo]														 AS [Complexe]
		  ,[idMaterial]														 AS [IdMateriel]
		  ,[idCuadro]														 AS [IdPeinture]
		  ,[angulo]															 AS [Angle]
		  ,[EsCuadro]														 AS [Peinture]	
		  ,[Composite]														 AS [Composite]
		  ,[Component]														 AS [Composante]
		  ,[GlassNumber]													 AS [NoVerre]
		  ,[Unmounted]														 AS [Demonte]
		  ,[idCuadroPadre]													 AS [IdEtalonPeinture]
		  ,[SubModelId]														 AS [IdSousModele]
		  ,ISNULL([Param], SPACE(0))	COLLATE SQL_Latin1_General_CP1_CI_AS AS [Param]
		  ,[RawMaterialColorConfiguration]									 AS [ConfigurationCouleurMaterielBrut]
		  ,[Weight]															 AS [Poid]
		  ,[ProductTypeCode]												 AS [CodeTypeProduit]
		  ,ISNULL([ProcessingClassInstance], SPACE(0))						 AS [InstanceClasseTraitement]
		  ,[ModelSide]														 AS [CoteModel]	
		  ,CONVERT(DATETIME, [DateCreation])								 AS [Date de creation]
		  ,CONVERT(DATETIME, [DateModification])							 AS [Date de Modif.]
	  INTO [Prevost].[dbo].[Stage_MaterielProject]
	  FROM [Prevost].[dbo].[Brute_MaterialesPAF]

	SET @version			= 1
	SET @Nom				= 'Stage_MaterielProject'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_MaterialesPAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

