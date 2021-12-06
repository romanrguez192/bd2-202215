DELIMITER $$

CREATE PROCEDURE sp_2(id INT, cedula INT)
BEGIN

	UPDATE Vacantes
	SET cedula_candidato_seleccionado = cedula
	WHERE codigo = id;

END$$

DELIMITER ;