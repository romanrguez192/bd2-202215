DELIMITER $$

CREATE FUNCTION sf_3(id INT)
RETURNS DATE
BEGIN

	DECLARE fecha_vencimiento DATE;
	DECLARE days, num_propuestas INT;

	SELECT v.fecha_vencimiento
	INTO fecha_vencimiento
	FROM Vacantes AS v
	WHERE v.codigo = id;
	
	-- Si no tiene fecha de vencimiento aún, es una nueva vacante
	IF fecha_vencimiento IS NULL THEN
		SET days = 7;
	END IF;
	
	-- Si tiene fecha de vencimiento, es una republicacion
	IF fecha_vencimiento IS NOT NULL THEN
		SET days = 15;
	END IF;
	
	SELECT COUNT(*)
	INTO num_propuestas
	FROM Vacantes AS v
	INNER JOIN Postulaciones AS p
	ON v.codigo = p.codigo_vacante
	WHERE v.codigo = id;
	
	IF num_propuestas < 5 THEN
		SET days = days + 7;
	END IF;
	
	RETURN(DATE_ADD(NOW(), INTERVAL days DAY));

END$$

DELIMITER ;