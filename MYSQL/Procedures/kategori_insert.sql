CREATE DEFINER=`root`@`localhost` PROCEDURE `kategori_insert`(
    p_kategori_navn varchar(100)
    )
BEGIN
    insert into produktkategorier(
	kategori_navn
    ) values
    (
	p_kategori_navn
    );
END


CREATE DEFINER=`root`@`localhost` PROCEDURE `kategori_update`(
    IN p_id INT,
    IN p_kategori_navn VARCHAR(255)
)
BEGIN
    UPDATE produktkategorier
    SET
        id = p_id,
        kategori_navn = p_kategori_navn
    WHERE
        id = p_id;
END