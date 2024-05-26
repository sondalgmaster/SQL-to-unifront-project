CREATE DEFINER=`root`@`%` PROCEDURE `update_lagerkvantitet`(
p_id int,
p_lagerkvantitet int
)
BEGIN
	UPDATE produkter
    SET lagerkvantitet = lagerkvantitet - p_lagerkvantitet
    WHERE id = p_id;
	select * from produkter;

END