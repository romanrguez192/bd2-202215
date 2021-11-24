SELECT c.cedula AS 'Cédula candidato', c.nombre AS 'Nombre candidato',
v.codigo AS 'Código vacante', v.posicion AS 'Posición vacante'
FROM Candidatos AS c
INNER JOIN Postulaciones AS p
ON c.cedula = p.cedula_candidato
INNER JOIN Vacantes AS v
ON p.codigo_vacante = v.codigo
INNER JOIN HabilidadesVacantes AS hv
ON v.codigo = hv.codigo_vacante
INNER JOIN HabilidadesCandidatos AS hc
ON hv.codigo_habilidad = hc.codigo_habilidad AND hc.cedula_candidato = c.cedula
GROUP BY c.cedula, c.nombre, v.codigo, v.posicion
HAVING COUNT(*) >= 3;
