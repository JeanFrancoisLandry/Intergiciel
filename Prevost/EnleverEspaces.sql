
CREATE FUNCTION [dbo].[EnleverEspaces] (@MyString AS VARCHAR(max))
returns VARCHAR(max)
AS
  BEGIN
      --NULL
      SET @MyString = Replace(@MyString, Char(0), '');
      --Horizontal Tab
      SET @MyString = Replace(@MyString, Char(9), '');
      --Line Feed
      SET @MyString = Replace(@MyString, Char(10), '');
      --Vertical Tab
      SET @MyString = Replace(@MyString, Char(11), '');
      --Form Feed
      SET @MyString = Replace(@MyString, Char(12), '');
      --Carriage Return
      SET @MyString = Replace(@MyString, Char(13), '');
      --Column Break
      SET @MyString = Replace(@MyString, Char(14), '');
      --Non-breaking space
      SET @MyString = Replace(@MyString, Char(160), '');
      SET @MyString = Ltrim(Rtrim(@MyString));

      RETURN @MyString
  END

GO

