USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[AdToGroup_Insert]    Script Date: 26.05.2024 18:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================

ALTER PROCEDURE [dbo].[AdToGroup_Insert]
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

    -- Check if both BrukerId and GrupeId are provided
    IF ISNULL (@BrukerId, 0) > 0 and ISNULL(@GrupeId, 0) > 0
    BEGIN
        -- Insert into GrupeBruker by IDs
        INSERT INTO GrupeBruker (GrupeId, BrukerId)
        VALUES (@GrupeId, @BrukerId);
    END
    -- Check if both BrukerNavn and GrupeNavn are provided
    ELSE IF @BrukerNavn IS NOT NULL AND @GrupeNavn IS NOT NULL
    BEGIN
        -- Insert into GrupeBruker by names
        DECLARE @InsertedBrukerId INT, @InsertedGrupeId INT;

        -- Find BrukerId based on BrukerNavn
        SELECT @InsertedBrukerId = Id
        FROM Bruker
        WHERE Brukenavn = @BrukerNavn;

        -- Find GrupeId based on GrupeNavn
        SELECT @InsertedGrupeId = Id
        FROM Grupe
        WHERE GrupeNavn = @GrupeNavn;

        -- Check if both BrukerId and GrupeId are found
        IF @InsertedBrukerId IS NOT NULL AND @InsertedGrupeId IS NOT NULL
        BEGIN
            -- Insert into GrupeBruker by IDs
            INSERT INTO GrupeBruker (GrupeId, BrukerId)
            VALUES (@InsertedGrupeId, @InsertedBrukerId);
        END
        ELSE
        BEGIN
            -- Either Bruker or Grupe name not found, raise an error or handle accordingly
            RAISERROR('Bruker or Grupe name not found.', 16, 1);
            RETURN;
        END
    END
    ELSE
    BEGIN
        -- Handle invalid input
        RAISERROR('Invalid parameters provided.', 16, 1);
        RETURN;
    END
END;
