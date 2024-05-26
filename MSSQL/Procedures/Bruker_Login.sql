USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[Bruker_Login]    Script Date: 26.05.2024 18:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Bruker_Login]
    @Brukenavn VARCHAR(250),
    @Passord VARCHAR(250),
    @LoginResult BIT OUT, -- Define an OUT parameter to hold the login result
    @UserId INT OUT -- Define an OUT parameter to hold the user ID
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Check if a user with the provided username and password exists
    IF EXISTS (SELECT 1 FROM Bruker WHERE Brukenavn = @Brukenavn AND Passord = @Passord)
    BEGIN
        -- User exists, set the OUT parameters to indicate a successful login
        SET @LoginResult = 1;

        -- Get the user ID for the provided username
        SELECT @UserId = Id FROM Bruker WHERE Brukenavn = @Brukenavn;
    END
    ELSE
    BEGIN
        -- User does not exist or invalid credentials, set the OUT parameters to indicate failure
        SET @LoginResult = 0;
        SET @UserId = NULL; -- Set the user ID to NULL if login fails
    END
END





