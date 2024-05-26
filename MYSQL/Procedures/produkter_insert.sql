CREATE DEFINER=`root`@`localhost` PROCEDURE `produkter_insert`(
    p_produkt_navn VARCHAR(255),
    p_kategori_id INT,
    p_merke VARCHAR(100),
    p_modell VARCHAR(100),
    p_pris DECIMAL(10, 2),
    p_lagerkvantitet INT,
    p_produktBeskrivelse TEXT
)
BEGIN
    insert into produkter(
    produkt_navn,
    kategori_id,
    merke,
    modell,
    pris,
    lagerkvantitet,
    produktBeskrivelse
    ) values
    (
	p_produkt_navn,
    p_kategori_id,
    p_merke,
    p_modell,
    p_pris,
    p_lagerkvantitet,
    p_produktBeskrivelse
    );
END