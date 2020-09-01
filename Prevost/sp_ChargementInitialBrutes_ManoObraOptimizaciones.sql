CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_ManoObraOptimizaciones]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_ManoObraOptimizaciones]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_ManoObraOptimizaciones];


	SELECT   [id]
			,[Numero]
			,[SetRowId]
			,[Presupuesto]
			,[Version]
			,[Orden]
			,[SubModel]
			,[Puesto]
			,[Segundos]
			,[Quantity]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_ManoObraOptimizaciones]
	FROM [PREFDB].[ADP_Prod].[dbo].[ManoObraOptimizaciones]


	SET @version			= 1
	SET @Nom				= 'Brute_ManoObraOptimizaciones'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[ManoObraOptimizaciones])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

