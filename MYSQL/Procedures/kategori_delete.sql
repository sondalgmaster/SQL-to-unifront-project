CREATE DEFINER=`root`@`localhost` PROCEDURE `kategori_delete`(
p_id int
)
BEGIN
Delete from produktkategorier where id = p_id;
END



CREATE DEFINER=`root`@`localhost` PROCEDURE `kategori_get`(
    IN p_kategori VARCHAR(250)
)
BEGIN
    CREATE TEMPORARY TABLE p_tableresult (
        id INT,
        kategori_navn VARCHAR(100)
    );
    
    INSERT INTO p_tableresult
    SELECT
        id,
        kategori_navn
    FROM 
        produktkategorier
    WHERE 
        kategori_navn LIKE CONCAT('%', p_kategori, '%');
    
    SELECT * FROM p_tableresult;
    DROP TEMPORARY TABLE IF EXISTS p_tableresult;
END