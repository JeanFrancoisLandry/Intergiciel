
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table MaterialesOptimizaciones
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_MaterialesOptimizaciones]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_MaterialesOptimizaciones]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_MaterialesOptimizaciones];


		SELECT   [id]
				,[Numero]
				,[SetRowId]
				,[Presupuesto]
				,[Version]
				,[Orden]
				,[SubModel]
				,[Referencia]
				,[ColorConfiguration]
				,[CantidadPorVentana]
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
				,[WorkPlace]
				,[OriginalReference]
				,[Weight]
				,[ModelSide]
				,GETDATE()						AS DateCreation
				,GETDATE()						AS DateModification
		INTO [Prevost].[dbo].[Brute_MaterialesOptimizaciones]
		FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesOptimizaciones]


	SET @version			= 1
	SET @Nom				= 'Brute_MaterialesOptimizaciones'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialesOptimizaciones])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


