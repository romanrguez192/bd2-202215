-- La mejor vacante para el candidato de cédula 29907275
-- Criterios: la vacante activa con mayor cantidad de habilidades que coincidan

SELECT v.codigo, v.posicion, e.rif, e.nombre
FROM HabilidadesCandidatos AS hc
INNER JOIN HabilidadesVacantes AS hv
ON hc.codigo_habilidad = hv.codigo_habilidad
INNER JOIN Vacantes AS v
ON hv.codigo_vacante = v.codigo
INNER JOIN Empresas AS e
ON v.rif_empresa = e.rif
WHERE hc.cedula_candidato = 29907275
AND NOW() BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
AND v.cedula_candidato_seleccionado IS NULL
GROUP BY hv.codigo_vacante
HAVING COUNT(*) = (
	SELECT MAX(coincidencias)
	FROM (
		SELECT COUNT(*) AS coincidencias
		FROM HabilidadesCandidatos AS hc
		INNER JOIN HabilidadesVacantes AS hv
		ON hc.codigo_habilidad = hv.codigo_habilidad
		INNER JOIN Vacantes AS v
		ON hv.codigo_vacante = v.codigo
		WHERE hc.cedula_candidato = 29907275
		AND NOW() BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
		AND v.cedula_candidato_seleccionado IS NULL
		GROUP BY hv.codigo_vacante
	) AS VacantesCoincidencias
);
