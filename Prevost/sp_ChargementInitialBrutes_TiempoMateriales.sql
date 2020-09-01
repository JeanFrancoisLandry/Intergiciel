
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table TiempoMateriales
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_TiempoMateriales]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_TiempoMateriales]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_TiempoMateriales];

	SELECT [DataVerId]
			,[Puesto]
			,[ReferenciaBase]
			,[a0]
			,[a1]
			,[b0]
			,[b1]
			,[d0]
			,[k0]
			,[k1]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	  INTO [Prevost].[dbo].[Brute_TiempoMateriales]
	  FROM [PREFDB].[ADP_Prod].[dbo].[TiempoMateriales]


	SET @version			= 1
	SET @Nom				= 'Brute_TiempoMateriales'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[TiempoMateriales])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


