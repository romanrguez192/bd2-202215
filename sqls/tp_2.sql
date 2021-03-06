CREATE EVENT EventoEliminarCandidatos
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO
DELETE FROM Candidatos
WHERE NOT validado AND DATEDIFF(NOW(), fecha_registro) > 180;
