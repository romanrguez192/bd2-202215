DELIMITER $$

CREATE FUNCTION sf_4(id INT, precio_base FLOAT)
RETURNS FLOAT
BEGIN

	DECLARE porcentaje INT DEFAULT 0;
	DECLARE codigo_pais, publicaciones, porcentaje_promocional INT;
	DECLARE rif_empresa VARCHAR(30);
	
	SELECT e.rif
	INTO rif_empresa
	FROM Vacantes AS v
	INNER JOIN Empresas AS e
	ON v.rif_empresa = e.rif
	WHERE v.codigo = id;
	
	SELECT e.codigo_pais
	INTO codigo_pais
	FROM Empresas AS e
	WHERE e.rif = rif_empresa;
	
	-- Si el pais es diferente de Venezuela
	IF codigo_pais != 8 THEN
		SET porcentaje = porcentaje + 35;
	END IF;
	
	-- El primer mes de cada trismestre
	IF MONTH(NOW()) IN (1, 4, 7, 10) THEN
		SET porcentaje = porcentaje + 15;
	END IF;
	
	SELECT COUNT(*)
	INTO publicaciones
	FROM Vacantes AS v
	WHERE v.rif_empresa = rif_empresa
	AND sf_1(v.codigo);
	
	IF publicaciones >= 5 THEN
		SET porcentaje = porcentaje - 10;
	END IF;
	
	SELECT v.porcentaje_promocional
	INTO porcentaje_promocional
	FROM Vacantes AS v
	WHERE v.codigo = id;
	
	SET porcentaje = porcentaje - porcentaje_promocional;
	
	RETURN(precio_base * (1 + porcentaje / 100));

END$$

DELIMITER ;