SELECT v.codigo AS 'Código vacante', v.posicion AS 'Posición',
e.rif AS 'RIF empresa', e.nombre AS 'Nombre empresa',
h.descripcion AS 'Descripción habilidad', h.annos_experiencia AS 'Años de experiencia'
FROM Vacantes AS v
INNER JOIN Empresas AS e
ON v.rif_empresa = e.rif
INNER JOIN HabilidadesVacantes AS hv
ON v.codigo = hv.codigo_vacante
INNER JOIN Habilidades AS h
ON hv.codigo_habilidad = h.codigo;