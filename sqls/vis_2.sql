-- Las vistas en mysql son actualizables
-- Es necesario incluir el código para poder buscar y hacer la modificación luego
CREATE VIEW VistaVacantes AS
SELECT codigo, expectativa_salarial
FROM Vacantes;
