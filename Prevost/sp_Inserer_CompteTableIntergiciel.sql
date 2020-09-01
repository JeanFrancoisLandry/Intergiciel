
-- =============================================
-- Author:		JF Landry
-- Create date: 25 novembre 2019
-- Description:	Inserer ligne dans table CompteTableIntergiciel
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserer_CompteTableIntergiciel]
	@version as int,
	@Nom as varchar(50),
	@Description as varchar(100),
	@CompteRangeTable as int,
	@CreateDateTime	as datetime
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[CompteTableIntergiciel]
			   ([Version]
			   ,[Nom]
			   ,[Description]
			   ,[CompteRangeTable]
			   ,[CreateDateTime])
	VALUES
			   (@version
			   ,@Nom
			   ,@Description
			   ,@CompteRangeTable
			   ,@CreateDateTime)

END
GO


