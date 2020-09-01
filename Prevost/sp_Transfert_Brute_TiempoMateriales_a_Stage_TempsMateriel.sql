
-- =======================================================================================================================================
-- Author:		JF Landry
-- Create date: 2019-11-26
-- Description:	Transfert de la table [Brute_TiempoMateriales] contenant les données d'optimization d'une tâche
--				dans une table transformée appelée Stage_TempsMateriel.
-- =======================================================================================================================================

CREATE PROCEDURE [dbo].[sp_Transfert_Brute_TiempoMateriales_a_Stage_TempsMateriel]

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Stage_TempsMateriel]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Stage_TempsMateriel];

	SELECT  [Puesto]			COLLATE SQL_Latin1_General_CP1_CI_AS AS [Poste Travail]
			,[ReferenciaBase]	COLLATE SQL_Latin1_General_CP1_CI_AS AS [Reference Base]
			,[a0]
			,[a1]
			,[b0]
			,[b1]
			,[d0]
			,[k0]
			,[k1]
			,CONVERT(DATETIME, [DateCreation])		AS [Date de creation]
			,CONVERT(DATETIME, [DateModification])	AS [Date de Modif.]
	INTO [Prevost].[dbo].[Stage_TempsMateriel] 
	FROM [Prevost].[dbo].[Brute_TiempoMateriales]

	SET @version			= 1
	SET @Nom				= 'Stage_TempsMateriel'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [Prevost].[dbo].[Brute_TiempoMateriales])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


