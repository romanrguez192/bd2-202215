DELIMITER $$

CREATE TRIGGER tg_3
BEFORE UPDATE
ON Vacantes FOR EACH ROW
BEGIN
	-- Si cambia de estado (de no pagada a pagada)
	IF OLD.pagada = 0 AND NEW.pagada = 1 THEN
		SET NEW.fecha_pago = NOW();
		-- La función almacenada 3 de la práctica 06 calcula la fecha de vencimiento 
		SET NEW.fecha_vencimiento = sf_3(NEW.codigo);
	END IF;
END$$

DELIMITER ;
