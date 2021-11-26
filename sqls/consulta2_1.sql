-- El mejor candidato para la vacante de código '1'
-- Criterios: el candidato con más habilidades que coincidan con la vacante

SELECT c.cedula, c.nombre, c.apellido
FROM HabilidadesVacantes AS hv
INNER JOIN HabilidadesCandidatos AS hc
ON hv.codigo_habilidad = hc.codigo_habilidad
INNER JOIN Candidatos AS c
ON hc.cedula_candidato = c.cedula
WHERE hv.codigo_vacante = '1'
GROUP BY hc.cedula_candidato
HAVING COUNT(*) = (
	SELECT MAX(coincidencias)
	FROM (
		SELECT COUNT(*) AS coincidencias
		FROM HabilidadesVacantes AS hv
		INNER JOIN HabilidadesCandidatos AS hc
		ON hv.codigo_habilidad = hc.codigo_habilidad
		WHERE hv.codigo_vacante = '1'
		GROUP BY hc.cedula_candidato
	) AS CandidatosCoincidencias
);
