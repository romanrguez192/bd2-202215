DELIMITER $$

CREATE PROCEDURE sp_3(id INT, clave INT)
BEGIN

	DECLARE codigo INT;

	IF clave IS NULL THEN

		UPDATE Candidatos
		SET codigo_validacion = FLOOR(RAND() * 2000000000)
		WHERE cedula = id;

	ELSE
		
		SELECT codigo_validacion
		INTO codigo
		FROM Candidatos
		WHERE cedula = id;

		IF clave = codigo THEN

			UPDATE Candidatos
			SET validado = 1
			WHERE cedula = id;

		END IF;

	END IF;

END$$

DELIMITER ;