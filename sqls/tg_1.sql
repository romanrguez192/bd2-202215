DELIMITER $$

CREATE TRIGGER tg_1
BEFORE INSERT
ON Postulaciones FOR EACH ROW
BEGIN
	DECLARE validado INT;

	SELECT c.validado
	INTO validado
	FROM Candidatos AS c
	WHERE c.cedula = NEW.cedula_candidato;

	IF NOT validado THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede postular un candidato no validado';
	END IF;
END$$

DELIMITER ;
