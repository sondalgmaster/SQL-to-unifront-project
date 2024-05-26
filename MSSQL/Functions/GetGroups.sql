USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGroups]    Script Date: 26.05.2024 18:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetGroups](
    @BrukerId int
)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT
        G.Id AS GroupId,
        G.GrupeNavn AS GroupName
    FROM
        [Grupe] G
    LEFT JOIN
        [GrupeBruker] GB ON G.Id = GB.GrupeId
    WHERE
        (@BrukerId IS NULL OR @BrukerId = -1 OR GB.BrukerId = @BrukerId)
);
