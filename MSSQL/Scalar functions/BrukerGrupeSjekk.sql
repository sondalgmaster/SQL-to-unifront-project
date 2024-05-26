USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[BrukerGrupeSjekk]    Script Date: 26.05.2024 18:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[BrukerGrupeSjekk] 
(
    @BrukerId INT,
    @KnappId INT
)
RETURNS int
AS
BEGIN
    DECLARE @ErIGrupe int;

    -- Check if the user is in the group connected to the button
    IF EXISTS (
        SELECT 1
        FROM Grupe g
        INNER JOIN GrupeKnapp gk ON g.Id = gk.GrupeId
        INNER JOIN GrupeBruker gb ON g.Id = gb.GrupeId
        WHERE gb.BrukerId = @BrukerId
        AND gk.KnappId = @KnappId
    )
    BEGIN
        SET @ErIGrupe = 0; -- User is in the group connected to the button
    END
    ELSE
    BEGIN
        SET @ErIGrupe = 2; -- User is not in the group connected to the button
    END

    RETURN @ErIGrupe;
END;
