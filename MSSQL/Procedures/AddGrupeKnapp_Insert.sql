USE [MyDb]
GO
/****** Object:  StoredProcedure [dbo].[AddGrupeKnapp_Insert]    Script Date: 26.05.2024 17:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================

ALTER PROCEDURE [dbo].[AddGrupeKnapp_Insert]
(
    @KnappId int = NULL,
	@KnappNavn varchar(250) = NULL,
	@GrupeId int = NULL,
	@GrupeNavn varchar(250) = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Check if both BrukerId and GrupeId are provided
    IF ISNULL (@KnappId, 0) > 0 and ISNULL(@GrupeId, 0) > 0
    BEGIN
        -- Insert into GrupeBruker by IDs
        INSERT INTO GrupeKnapp (GrupeId, KnappId)
        VALUES (@GrupeId, @KnappId);
    END
    -- Check if both BrukerNavn and GrupeNavn are provided
    ELSE IF @KnappNavn IS NOT NULL AND @GrupeNavn IS NOT NULL
    BEGIN
        -- Insert into GrupeBruker by names
        DECLARE @InsertedKnappId INT, @InsertedGrupeId INT;

        -- Find BrukerId based on BrukerNavn
        SELECT @InsertedKnappId = Id
        FROM Knapp
        WHERE KnappNavn = @KnappNavn;

        -- Find GrupeId based on GrupeNavn
        SELECT @InsertedGrupeId = Id
        FROM Grupe
        WHERE GrupeNavn = @GrupeNavn;

        -- Check if both BrukerId and GrupeId are found
        IF @InsertedKnappId IS NOT NULL AND @InsertedGrupeId IS NOT NULL
        BEGIN
            -- Insert into GrupeBruker by IDs
            INSERT INTO GrupeKnapp (GrupeId, KnappId)
            VALUES (@InsertedGrupeId, @InsertedKnappId);
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
