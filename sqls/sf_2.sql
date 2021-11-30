DELIMITER $$

CREATE FUNCTION sf_2(rif VARCHAR(30))
RETURNS INT
BEGIN

	DECLARE num_vacantes, num_vacantes_10_postulaciones INT;
	
	SELECT COUNT(*)
	INTO num_vacantes
	FROM Vacantes
	WHERE rif_empresa = rif
	AND DATEDIFF(NOW(), fecha_publicacion) <= 365;
	
	SELECT COUNT(*)
	INTO num_vacantes_10_postulaciones
	FROM (
		SELECT v.codigo
		FROM Vacantes AS v
		INNER JOIN Postulaciones AS p
		ON v.codigo = p.codigo_vacante
		WHERE v.rif_empresa = rif
		AND DATEDIFF(NOW(), v.fecha_publicacion) <= 365
		GROUP BY v.codigo
		HAVING COUNT(*) >= 10
	) AS vacantes_10_postulaciones;
	
	RETURN num_vacantes > 15 AND num_vacantes_10_postulaciones > num_vacantes / 2;

END$$

DELIMITER ;