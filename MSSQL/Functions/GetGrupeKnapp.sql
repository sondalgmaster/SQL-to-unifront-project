USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGrupeKnapp]    Script Date: 26.05.2024 18:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetGrupeKnapp](@GrupeId INT)
RETURNS TABLE
AS
RETURN
(
     SELECT DISTINCT k.Id AS KnappId, k.KnappNavn
    FROM Knapp k
    LEFT JOIN GrupeKnapp gk ON k.Id = gk.KnappId
    LEFT JOIN Grupe g ON gk.GrupeId = g.Id
    WHERE @GrupeId IS NULL or @GrupeId = -1 OR g.Id = @GrupeId
)
