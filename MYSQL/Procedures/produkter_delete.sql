CREATE DEFINER=`root`@`localhost` PROCEDURE `produkter_delete`(
p_id int
)
BEGIN
Delete from produkter where id = p_id;
END



CREATE DEFINER=`root`@`localhost` PROCEDURE `produkter_get`(
    IN p_produkt VARCHAR(250)
)
BEGIN
    CREATE TEMPORARY TABLE p_tableresult (
        id INT,
        produkt_navn VARCHAR(255),
        kategori_id INT,
        merke VARCHAR(100),
        modell VARCHAR(100),
        pris DECIMAL(10, 2),
        lagerkvantitet INT,
        produktBeskrivelse TEXT
    );
    
    IF p_produkt IS NULL OR p_produkt = '' THEN
        INSERT INTO p_tableresult
        SELECT
            p.id,
            p.produkt_navn,
            p.kategori_id,
            p.merke,
            p.modell,
            p.pris,
            p.lagerkvantitet,
            p.produktBeskrivelse
        FROM 
            produkter p
        INNER JOIN
            produktkategorier k ON p.kategori_id = k.id;
    ELSE
        INSERT INTO p_tableresult
        SELECT
            p.id,
            p.produkt_navn,
            p.kategori_id,
            p.merke,
            p.modell,
            p.pris,
            p.lagerkvantitet,
            p.produktBeskrivelse
        FROM 
            produkter p
        INNER JOIN
            produktkategorier k ON p.kategori_id = k.id
        WHERE 
            p.produkt_navn LIKE CONCAT('%', p_produkt, '%');
    END IF;
    
    SELECT * FROM p_tableresult;
    
    DROP TEMPORARY TABLE IF EXISTS p_tableresult;
END

