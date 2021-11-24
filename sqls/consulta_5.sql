SELECT v.codigo, v.posicion, COUNT(*) AS 'Total de postulaciones'
FROM Vacantes AS v
INNER JOIN Postulaciones AS p
ON v.codigo = p.codigo_vacante
AND p.fecha_postulacion BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
GROUP BY v.codigo, v.posicion;