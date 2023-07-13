SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
Create PROCEDURE [dbo].[ImsProcResetPasswordEmail] @Token nvarchar(max), @Name nvarchar(max),@AppUrl nvarchar(max), @UserName nvarchar(max)
	
AS
BEGIN
	SET NOCOUNT ON;

	Declare @returnValue as Table (dataKey nvarchar(max), dataValue nvarchar(max))
	Declare @Header nvarchar(max);
	Declare @Subject nvarchar(max);
	Set @Header = 'You have requested a new password'
	Set @Subject = '[ScanPrint IMS - Password Request]'

	BEGIN TRY  

		INSERT INTO @returnValue (dataKey,dataValue)
		 VALUES ('Subject', @Subject)

		INSERT INTO @returnValue (dataKey,dataValue)
		 VALUES ('Header', @Header)
	
		INSERT INTO @returnValue(dataKey,dataValue)
		 VALUES
			   ('Content',
                'Hello ' + @Name + ',
                <br><br>
                You recently requested a new password (Your login is ' + @UserName + ')
                <br><br>
                Please click the link below to complete your new password request:
                <br>
                <a href='+ @AppUrl + '/changePassword?token=' + @Token + '>Change password</a>
                <br><br>
                If you did not request a new password, someone may have been trying to access you account without your permission.
                <br>
                As long as you do not click the link contained in the email, no action will be taken and your account remain secure.
                <br><br>
                Thank you.')

		--return temporary table
		SELECT * from @returnValue

	END TRY  
	
	BEGIN CATCH 
		--get error message
	    Declare @msg nvarchar(max) ;
		set  @msg = cast(ERROR_NUMBER() as nvarchar(max)) + '-' + ERROR_MESSAGE();

		--return actual table
		SELECT * from @returnValue
	END CATCH;

END
GO
