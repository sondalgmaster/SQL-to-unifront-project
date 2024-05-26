USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUsersInGroup]    Script Date: 26.05.2024 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[GetUsersInGroup]
(
    @GroupId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        B.Id AS UserId,
        B.Brukenavn AS UserName,
        MAX(gb.Id) AS GrupeBrukerId
    FROM
        GrupeBruker gb
    INNER JOIN
        Bruker B ON gb.BrukerId = B.Id
    WHERE
        (@GroupId IS NULL OR @GroupId = -1 OR gb.GrupeId = @GroupId)
    GROUP BY
        B.Id,
        B.Brukenavn
)





/*
-- Test with a specific GroupId
SELECT *
FROM dbo.GetUsersInGroup(5);

-- Test with NULL GroupId (to get all users)
SELECT *
FROM dbo.GetUsersInGroup(NULL);

SELECT *
FROM dbo.GetGrupeBrukerId(5, 1);

select * from GrupeBruker
*/