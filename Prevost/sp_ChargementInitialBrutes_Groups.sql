
CREATE PROCEDURE [dbo].[sp_ChargementInitialBrutes_Groups]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Brute_Groups]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Brute_Groups];

	SELECT [GroupId]
		,[GroupType]
		,[GroupName]
		,[Description]
		,[Position]
		,[DeliveryGroup]
		,[Normalize]
		,GETDATE()						AS DateCreation
		,GETDATE()						AS DateModification
	INTO [Prevost].[dbo].[Brute_Groups]
	FROM [ADP_Prod].[dbo].[Groups]
	ORDER BY [GroupId]

	SET @version			= 1
	SET @Nom				= 'Brute_Groups'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[Groups])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO


