DELIMITER $$

CREATE TRIGGER tg_2
BEFORE INSERT
ON Postulaciones FOR EACH ROW
BEGIN
	DECLARE pagada INT;

	SELECT v.pagada
	INTO pagada
	FROM Vacantes AS v
	WHERE v.codigo = NEW.codigo_vacante;

	IF NOT pagada THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede postular un candidato a una vacante no pagada';
	END IF;
END$$

DELIMITER ;
