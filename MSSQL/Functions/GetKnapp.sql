USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetKnapp]    Script Date: 26.05.2024 18:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetKnapp](@KnappId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT g.Id AS GrupeId, g.GrupeNavn
    FROM Grupe g
    LEFT JOIN GrupeKnapp gk ON g.Id = gk.GrupeId
    LEFT JOIN Knapp k ON gk.KnappId = k.Id
    WHERE @KnappId IS NULL or @KnappId = -1 OR k.Id = @KnappId
)
