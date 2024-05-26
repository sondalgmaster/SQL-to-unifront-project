USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[FinBrukerIdEtterBrukernavn]    Script Date: 26.05.2024 18:31:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FinBrukerIdEtterBrukernavn]
    @Brukernavn VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BrukerId INT;

    -- Query to find BrukerId based on Brukernavn
    SELECT @BrukerId = Id
    FROM Bruker
    WHERE Brukenavn = @Brukernavn;

    -- Return BrukerId
    SELECT @BrukerId AS BrukerId;
END;
