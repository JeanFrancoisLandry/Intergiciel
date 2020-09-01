
CREATE FUNCTION [dbo].[EnleverSymbolesLargeur] (@MyString AS VARCHAR(max))
returns VARCHAR(max)
AS
  BEGIN

		IF (CHARINDEX('W=',@MyString) <> 0) OR (CHARINDEX('L=',@MyString) <> 0)
			SET @MyString = REPLACE(REPLACE(REPLACE(SUBSTRING(@MyString, CHARINDEX('W=',@MyString), CHARINDEX(';',@MyString)), 'L=', ''), ';', ''), 'W=', '')
		ELSE
			SET @MyString = ''
	 
     RETURN @MyString
  END

GO

