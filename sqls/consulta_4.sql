SELECT e.rif, e.nombre, v.codigo, v.posicion, v.fecha_publicacion, v.fecha_vencimiento
FROM Empresas AS e
INNER JOIN Vacantes AS v
ON e.rif = v.rif_empresa
AND NOW() BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
AND v.cedula_candidato_seleccionado IS NULL;