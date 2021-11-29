DELIMITER $$

CREATE FUNCTION sf_1(id INT)
RETURNS INT
BEGIN

	RETURN(
		SELECT pagada AND NOW() BETWEEN fecha_publicacion AND fecha_vencimiento
		FROM Vacantes
		WHERE codigo = id
	);

END$$

DELIMITER ;