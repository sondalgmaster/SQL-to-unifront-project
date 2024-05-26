USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrdre]    Script Date: 26.05.2024 18:37:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetOrdre]
(   
    @BrukerId int,
    @SearchKeyword varchar(250) = NULL
)
RETURNS @tableresult TABLE (
    id int,
    Email varchar(250),
    Navn varchar(250),
    Etternavn varchar(250),
    ProduktNavn varchar(250),
    Merke varchar(250),
    Model varchar(250),
    Pris decimal(10,2),
    quantity int,
    Orderid int
)
AS
BEGIN
    -- Fetch data from MySQL directly into the table variable
    INSERT INTO @tableresult
    SELECT 
        b.id,
        b.Email,
        b.Navn,
        b.Etternavn,
        p.produkt_navn,
        p.merke,
        p.modell,
        p.pris,
        o.quantity,
        o.Id
    FROM
        [Bruker] b
    JOIN
        [Ordre] o ON b.id = o.BrukerId
    JOIN
        [MYSQL].[mydb2]..[produkter] p ON o.ProduktId = p.id
    WHERE
        (b.id = @BrukerId) -- Only orders of the specified BrukerId
        AND (@SearchKeyword IS NULL OR @SearchKeyword = '-1'
            OR b.Email LIKE '%' + @SearchKeyword + '%'
            OR b.Navn LIKE '%' + @SearchKeyword + '%'
            OR b.Etternavn LIKE '%' + @SearchKeyword + '%'
            OR p.produkt_navn LIKE '%' + @SearchKeyword + '%'
            OR p.merke LIKE '%' + @SearchKeyword + '%');

    RETURN;
END;




/*

DECLARE @BrukerId int = 1; -- Sample BrukerId
DECLARE @ProductName varchar(250) = 'ge'; -- Sample product name

-- Execute the function with only BrukerId parameter and filtering by product name
SELECT * FROM dbo.GetOrdre(@BrukerId, NULL, NULL, @ProductName);










select * from OPENQUERY(MYSQL, '
            SELECT id, produkt_navn, merke, modell, pris 
            FROM mydb2.produkter
            WHERE id = 2') AS p
*/
/*
DECLARE @BrukerId int = 1; -- Sample BrukerId
DECLARE @ProduktId int = 10; -- NULL ProduktId

-- Execute the function and retrieve the results
SELECT * FROM dbo.GetOrdre(@BrukerId, @ProduktId);

*/