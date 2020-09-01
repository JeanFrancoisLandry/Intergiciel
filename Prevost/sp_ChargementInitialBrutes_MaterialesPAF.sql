
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table MaterialesPAF
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialesPAF]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_MaterialesPAF]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_MaterialesPAF];


	SELECT [Numero]
			,[Version]
			,[Orden]
			,[Referencia]
			,[ColorConfiguration]
			,[Cantidad]
			,[Longitud]
			,[Altura]
			,[AnguloCorteA]
			,[AnguloCorteB]
			,[Complejo]
			,[idMaterial]
			,[idCuadro]
			,[angulo]
			,[EsCuadro]
			,[Composite]
			,[Component]
			,[GlassNumber]
			,[Unmounted]
			,[idCuadroPadre]
			,[SubModelId]
			,[Param]
			,[RawMaterialColorConfiguration]
			,[Weight]
			,[ProductTypeCode]
			,[ProcessingClassInstance]
			,[ModelSide]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_MaterialesPAF]
	FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesPAF]


	SET @version			= 1
	SET @Nom				= 'Brute_MaterialesPAF'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesPAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


