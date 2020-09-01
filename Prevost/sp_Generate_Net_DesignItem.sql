

-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Chargement initial des données stage provenant de l'aggégation
--				des tables Stage_Projet & 
-- =============================================

CREATE PROCEDURE [dbo].[sp_Generate_Net_DesignItem]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @version as int,
			@Nom as varchar(50),
			@Description as varchar(100),
			@CompteRangeTable as int,
			@CreateDateTime	as datetime

	IF OBJECT_ID('[dbo].[Net_DesignItem]', 'U') IS NOT NULL
		DROP TABLE [dbo].[Net_DesignItem];
	
	CREATE TABLE [dbo].[Net_DesignItem]
	(
		[Design Item No] int IDENTITY(1,1) PRIMARY KEY,
		[Design Tool] [nvarchar](25) NOT NULL,
		[Project No] [nvarchar](50) NOT NULL,
		[Short Description] [nvarchar](50) NOT NULL,
		[Long Description] [nvarchar](250) NOT NULL,
		[Item Category Code] [nvarchar](20) NOT NULL,
		[Color] [nvarchar](20) NOT NULL,
		[Exterior Color] [nvarchar](20) NOT NULL,
		[Interior Color] [nvarchar](20) NOT NULL,
		[Sort Name]	[nvarchar](250) NOT NULL,
		[Length] [nvarchar](250) NOT NULL,
		[Amperage] [nvarchar](250) NOT NULL,
		[Geometry] [nvarchar](250) NOT NULL,
		[Qty. per Rack] [nvarchar](250) NOT NULL,
		[Delicate Immersion] [nvarchar](250) NOT NULL,
		[Difficult Rinsing] [nvarchar](250) NOT NULL,
		[Lift Type] [nvarchar](250) NOT NULL,
		[Creation Timestamp] [datetime] NULL,
		[Creation User] [nvarchar](250) NOT NULL,
		[Modification Timestamp] [datetime] NULL,
		[Modification User] [nvarchar](250) NOT NULL
	) ON [PRIMARY] 

	SET IDENTITY_INSERT [Prevost].[dbo].[Net_DesignItem] ON

	INSERT INTO [Prevost].[dbo].[Net_DesignItem]
	(
		 [Design Item No]
		,[Design Tool]
		,[Project No]
		,[Short Description]
		,[Long Description]
		,[Item Category Code]
		,[Color]
		,[Exterior Color]
		,[Interior Color]
		,[Sort Name]
		,[Length]
		,[Amperage]
		,[Geometry]
		,[Qty. per Rack]
		,[Delicate Immersion]
		,[Difficult Rinsing]
		,[Lift Type]
		,[Creation Timestamp]
		,[Creation User]
		,[Modification Timestamp]
		,[Modification User]
	)
	SELECT 	
		 ROW_NUMBER() OVER(ORDER BY p.[Numero Commande], dp.[Ordre], dp.[Nomenclature]) AS Row_Number
		,'PREF'																			AS [Design Tool]
		,CASE 
			WHEN CONVERT(NVARCHAR(5), dp.[Nomenclature]) <> ''
			THEN CONVERT(NVARCHAR(10), p.[Numero Commande]) + '-' + CONVERT(NVARCHAR(5), dp.[Ordre]) + '-' + CONVERT(NVARCHAR(5), dp.[Nomenclature]) 
			WHEN CONVERT(NVARCHAR(5), dp.[Nomenclature]) = ''
			THEN CONVERT(NVARCHAR(10), p.[Numero Commande]) + '-' + CONVERT(NVARCHAR(5), dp.[Ordre]) 
		END as [Projet No]
		,CASE 
			WHEN p.[Projet] = 'ShipTo Address'
			THEN p.[Adresse des travaux] 
			ELSE p.[Projet]
		END as [Short Description]
		,CASE 
			WHEN p.[Projet] = 'ShipTo Address'
			THEN p.[Adresse des travaux] 
			ELSE p.[Projet]
		END as [Long Description]
		,''													AS [Item Category Code]
		,''													AS [Color]
		,''													AS [Interior Color]
		,''													AS [Exterior Color]
		,''													AS [Sort Name]
		,ISNULL(dp.Mesures, SPACE(0))						AS [Lenght]
		,''											AS [Amperage]
		,''											AS [Geometry]
		,dp.[Quantité]
		,''											AS [Delicate Immersion]
		,''											AS [Difficult Rinsing]
		,''											AS [Lift Type]
		,p.[Date Modif. Syst.]						AS [Creation Timestamp]
		,''											AS [Creation User]
		,p.[Date de Modif.]							AS [Modification Timestamp]
		,p.[Nom Utilisateur]						AS [Modification User] 
	FROM [Prevost].[dbo].[Stage_Projet] p
		INNER JOIN [Prevost].[dbo].[Stage_DetailProject] dp
			ON dp.Numero = p.Numero
			AND dp.Version = p.version
	WHERE p.[Numero Commande] <> 0

	SET IDENTITY_INSERT [Prevost].[dbo].[Net_DesignItem] OFF 

	SET @version			= 1
	SET @Nom				= 'Net_DesignItem'
	SET @Description		= 'Chargement initial'
	SET @CompteRangeTable	= (SELECT COUNT(*) FROM [PREFDB].[ADP_Prod].[dbo].[MaterialNeedsMaster])
	SET @CreateDateTime		= GETDATE()

	EXEC sp_Inserer_CompteTableIntergiciel @Version, @Nom, @Description, @CompteRangeTable, @CreateDateTime 

END
GO

