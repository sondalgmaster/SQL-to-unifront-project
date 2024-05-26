CREATE DEFINER=`root`@`localhost` PROCEDURE `update_produkter`(
    IN p_id INT,
    IN p_produkt_navn VARCHAR(255),
    IN p_kategori_id INT,
    IN p_merke VARCHAR(100),
    IN p_modell VARCHAR(100),
    IN p_pris float,
    IN p_lagerkvantitet INT,
    IN p_produktBeskrivelse TEXT
)
BEGIN
    UPDATE produkter
    SET
        produkt_navn = p_produkt_navn,
        kategori_id = p_kategori_id,
        merke = p_merke,
        modell = p_modell,
        pris = p_pris,
        lagerkvantitet = p_lagerkvantitet,
        produktBeskrivelse = p_produktBeskrivelse
    WHERE
        id = p_id;
END