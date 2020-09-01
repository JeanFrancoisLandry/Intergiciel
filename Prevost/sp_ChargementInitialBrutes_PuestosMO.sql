
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données brutes provenant de la table PuestosMO
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_PuestosMO]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_PuestosMO]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_PuestosMO];

	SELECT   [MakerId]
			,[RowId]
			,[Nombre]
			,[LabourPlaceCode]
			,[Operario]
			,[Zone]
			,[Section]
			,[IdGrupoPresupuestado]
			,[Coste]
			,[IsWorkerTask]
			,[BitState]
			,[GenerateVariable]
			,GETDATE()						AS DateCreation
			,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_PuestosMO]
	FROM [PREFDB].[ADP_Prod].[dbo].[PuestosMO]

	SET @version			= 1
	SET @Nom				= 'Brute_PuestosMO'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[PuestosMO])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


