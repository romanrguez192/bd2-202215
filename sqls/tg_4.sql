DELIMITER $$

CREATE TRIGGER tg_4
AFTER INSERT
ON HabilidadesCandidatos FOR EACH ROW
BEGIN
	INSERT INTO Postulaciones(codigo_vacante, cedula_candidato, fecha_postulacion, status)
	SELECT v.codigo, c.cedula, NOW(), 'pendiente'
	FROM HabilidadesCandidatos AS hc
	JOIN HabilidadesVacantes AS hv
	ON hc.codigo_habilidad = hv.codigo_habilidad
	JOIN Candidatos AS c
	ON hc.cedula_candidato = c.cedula
	JOIN Vacantes AS v
	ON hv.codigo_vacante = v.codigo
	WHERE hc.cedula_candidato = NEW.cedula_candidato
	-- Verifica que no esté postulado ya
	AND NOT EXISTS(
		SELECT * FROM Postulaciones AS p
		WHERE p.codigo_vacante = v.codigo
		AND p.cedula_candidato = c.cedula 
	)
	-- Verifica que se pueda postular
	AND c.validado AND v.pagada
	GROUP BY v.codigo
	HAVING COUNT(*) > 6;
END$$

DELIMITER ;
