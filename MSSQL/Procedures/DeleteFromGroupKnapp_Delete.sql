USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromGroupKnapp_Delete]    Script Date: 26.05.2024 18:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DeleteFromGroupKnapp_Delete]
(

    @KnappId INT = NULL,
    @GrupeId INT = NULL,
	@KnappNavn nvarchar(250) = NULL,
    @GrupeNavn NVARCHAR(250) = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    IF ISNULL (@KnappId, 0) > 0 and ISNULL(@GrupeId, 0) > 0
    BEGIN
        -- Delete by IDs
        DELETE FROM GrupeKnapp
        WHERE KnappId = @KnappId
        AND GrupeId = @GrupeId;
    END
    ELSE IF @KnappNavn IS NOT NULL AND @GrupeNavn IS NOT NULL
    BEGIN
        -- Delete by names
        DECLARE @KnappIdByName INT, @GrupeIdByName INT;

        -- Find BrukerId based on BrukerNavn
        SELECT @KnappIdByName = Id
        FROM Knapp
        WHERE KnappNavn = @KnappNavn;

        -- Find GrupeId based on GrupeNavn
        SELECT @GrupeIdByName = Id
        FROM Grupe
        WHERE GrupeNavn = @GrupeNavn;

        -- Delete the row from GrupeBruker where BrukerId and GrupeId match
        DELETE FROM GrupeKnapp
        WHERE KnappId = @KnappIdByName
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

