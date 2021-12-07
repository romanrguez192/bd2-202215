DELIMITER $$

CREATE PROCEDURE sp_1(id INT)
BEGIN

	UPDATE Vacantes
	SET pagada = 1,
	fecha_vencimiento = sf_3(id)
	WHERE codigo = id;

END$$

DELIMITER ;