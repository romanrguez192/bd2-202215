-- Solo aquellos candidatos que se han postulado alguna vez, sin incluir el teléfono de contacto
CREATE VIEW VistaCandidatos AS
SELECT DISTINCT c.cedula, c.nombre, c.apellido, c.direccion, c.codigo_pais, c.validado
FROM Postulaciones AS p
JOIN Candidatos AS c
ON p.cedula_candidato = c.cedula;
