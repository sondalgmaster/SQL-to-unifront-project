USE [MyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrdreAdmin]    Script Date: 26.05.2024 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetOrdreAdmin]
(   
    @BrukerId int = NULL,
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
        (@BrukerId IS NULL or @BrukerId = -1 OR b.id = @BrukerId)
        AND (
            @SearchKeyword IS NULL or  @SearchKeyword = '-1'
            OR b.Email LIKE '%' + @SearchKeyword + '%'
            OR b.Navn LIKE '%' + @SearchKeyword + '%'
            OR b.Etternavn LIKE '%' + @SearchKeyword + '%'
            OR p.produkt_navn LIKE '%' + @SearchKeyword + '%'
            OR p.merke LIKE '%' + @SearchKeyword + '%'
        );

    RETURN;
END;


/*
DECLARE @BrukerId int = -1; -- Sample BrukerId

SELECT * FROM dbo.GetOrdreAdmin(@BrukerId, NULL, NULL, NULL);



*/