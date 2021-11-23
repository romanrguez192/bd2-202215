SELECT e.rif AS 'RIF empresa', e.nombre AS 'Nombre empresa', (
	SELECT COUNT(*)
	FROM Vacantes AS v
	WHERE e.rif = v.rif_empresa
) AS 'Total vacantes'
FROM Empresas AS e
INNER JOIN Vacantes AS v
ON e.rif = v.rif_empresa
WHERE DATEDIFF(NOW(), v.fecha_publicacion) <= 180
GROUP BY e.rif, e.nombre
HAVING COUNT(*) > 5;