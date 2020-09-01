
-- =============================================
-- Author:		JF Landry
-- Create date: 2019-11-25
-- Description:	Créer la table qui garde le compte des tables Intergiciel.
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateCompteTableIntergiciel]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF OBJECT_ID('[dbo].[CompteTableIntergiciel]', 'U') IS NOT NULL
		DROP TABLE [dbo].[CompteTableIntergiciel];

	CREATE TABLE [dbo].[CompteTableIntergiciel](
		[Numero] [int] IDENTITY(1,1) PRIMARY KEY,
		[Version] [int] NOT NULL,
		[Nom] [nvarchar](50) NOT NULL,
		[Description] [nvarchar](100) NOT NULL,
		[CompteRangeTable] [int] NOT NULL,
		[CreateDateTime] [datetime] NOT NULL
	) ON [PRIMARY] 


END
GO


