USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromGroup_Delete]    Script Date: 26.05.2024 18:30:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DeleteFromGroup_Delete]
(
    @BrukerId INT = NULL,
    @GrupeId INT = NULL,
    @BrukerNavn NVARCHAR(255) = NULL,
    @GrupeNavn NVARCHAR(255) = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    IF ISNULL (@BrukerId, 0) > 0 and ISNULL(@GrupeId, 0) > 0
    BEGIN
        -- Delete by IDs
        DELETE FROM GrupeBruker
        WHERE BrukerId = @BrukerId
        AND GrupeId = @GrupeId;
    END
    ELSE IF @BrukerNavn IS NOT NULL AND @GrupeNavn IS NOT NULL
    BEGIN
        -- Delete by names
        DECLARE @BrukerIdByName INT, @GrupeIdByName INT;

        -- Find BrukerId based on BrukerNavn
        SELECT @BrukerIdByName = Id
        FROM Bruker
        WHERE Brukenavn = @BrukerNavn;

        -- Find GrupeId based on GrupeNavn
        SELECT @GrupeIdByName = Id
        FROM Grupe
        WHERE GrupeNavn = @GrupeNavn;

        -- Delete the row from GrupeBruker where BrukerId and GrupeId match
        DELETE FROM GrupeBruker
        WHERE BrukerId = @BrukerIdByName
        AND GrupeId = @GrupeIdByName;
    END
    ELSE
    BEGIN
        -- Handle invalid input
        RAISERROR('Invalid parameters provided.', 16, 1);
        RETURN;
    END
END


/*

EXEC [dbo].[DeleteFromGroup_Delete] @BrukerNavn = 'bendover', @GrupeNavn = 'Nan';
select * from GrupeBruker
*/

