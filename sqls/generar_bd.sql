-- 18/10/2021 5:44 PM

CREATE TABLE `Candidatos`  (
  `cedula` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `codigo_pais` int NOT NULL,
  PRIMARY KEY (`cedula`)
);

CREATE TABLE `Categorias`  (
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `Empresas`  (
  `rif` varchar(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) NULL,
  PRIMARY KEY (`rif`)
);

CREATE TABLE `Habilidades`  (
  `codigo` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `annos_experiencia` int NOT NULL,
  `codigo_categoria` int NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `HabilidadesCandidatos`  (
  `cedula_candidato` int NOT NULL,
  `codigo_habilidad` int NOT NULL,
  PRIMARY KEY (`cedula_candidato`, `codigo_habilidad`)
);

CREATE TABLE `HabilidadesVacantes`  (
  `codigo_vacante` int NOT NULL,
  `codigo_habilidad` int NOT NULL,
  PRIMARY KEY (`codigo_vacante`, `codigo_habilidad`)
);

CREATE TABLE `Paises`  (
  `codigo` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `Postulaciones`  (
  `codigo_vacante` int NOT NULL,
  `cedula_candidato` int NOT NULL,
  `fecha_postulacion` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_vacante`, `cedula_candidato`)
);

CREATE TABLE `Vacantes`  (
  `codigo` int NOT NULL,
  `posicion` varchar(100) NOT NULL,
  `es_remota` int NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `rif_empresa` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
);

ALTER TABLE `Candidatos` ADD CONSTRAINT `fk_Candidatos_Paises_1` FOREIGN KEY (`codigo_pais`) REFERENCES `Paises` (`codigo`);
ALTER TABLE `Habilidades` ADD CONSTRAINT `fk_Habilidad_Categorias_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `Categorias` (`codigo`);
ALTER TABLE `HabilidadesCandidatos` ADD CONSTRAINT `fk_HabilidadesCandidatos_Candidatos_1` FOREIGN KEY (`cedula_candidato`) REFERENCES `Candidatos` (`cedula`);
ALTER TABLE `HabilidadesCandidatos` ADD CONSTRAINT `fk_HabilidadesCandidatos_Habilidades_1` FOREIGN KEY (`codigo_habilidad`) REFERENCES `Habilidades` (`codigo`);
ALTER TABLE `HabilidadesVacantes` ADD CONSTRAINT `fk_HabilidadesVacantes_Vacantes_1` FOREIGN KEY (`codigo_vacante`) REFERENCES `Vacantes` (`codigo`);
ALTER TABLE `HabilidadesVacantes` ADD CONSTRAINT `fk_HabilidadesVacantes_Habilidades_1` FOREIGN KEY (`codigo_habilidad`) REFERENCES `Habilidades` (`codigo`);
ALTER TABLE `Postulaciones` ADD CONSTRAINT `fk_Postulaciones_Candidatos_1` FOREIGN KEY (`cedula_candidato`) REFERENCES `Candidatos` (`cedula`);
ALTER TABLE `Postulaciones` ADD CONSTRAINT `fk_Postulaciones_Vacantes_1` FOREIGN KEY (`codigo_vacante`) REFERENCES `Vacantes` (`codigo`);
ALTER TABLE `Vacantes` ADD CONSTRAINT `fk_Vacantes_Empresas_1` FOREIGN KEY (`rif_empresa`) REFERENCES `Empresas` (`rif`);

