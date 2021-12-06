DELIMITER $$

CREATE PROCEDURE sp_4()
BEGIN

	UPDATE Vacantes
	SET inactiva = 1
	WHERE (NOT pagada AND DATEDIFF(NOW(), fecha_publicacion) > 3)
	OR NOW() > fecha_vencimiento;

END$$

DELIMITER ;