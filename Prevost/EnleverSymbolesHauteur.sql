CREATE FUNCTION [dbo].[EnleverSymbolesHauteur] (@MyString AS VARCHAR(max))
returns VARCHAR(max)
AS
  BEGIN
  
	IF CHARINDEX('H=', @MyString) <> 0
		SET @MyString = REPLACE(SUBSTRING(SUBSTRING(@MyString, CHARINDEX('H=',@MyString), LEN(@MyString)),0,CHARINDEX(';', SUBSTRING(@MyString, CHARINDEX('H=',@MyString), LEN(@MyString)))), 'H=', '')
	ELSE
		SET @MyString = ''

	RETURN @MyString
  
  END

GO

