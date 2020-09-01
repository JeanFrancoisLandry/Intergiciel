-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table ManoObraPAF
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_ManoObraPAF]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_ManoObraPAF]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_ManoObraPAF];

	SELECT  [Numero]
			,[Version]
			,[Orden]
			,[SubModelId]
			,[Puesto]
			,[Segundos]
			,[idWorkforce]
			,[ProductTypeCode]
			,[ProcessingClassInstance]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_ManoObraPAF]
	FROM [PREFDB].[ADP_Prod].[dbo].[ManoObraPAF]


	SET @version			= 1
	SET @Nom				= 'Brute_ManoObraPAF'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[ManoObraPAF])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


